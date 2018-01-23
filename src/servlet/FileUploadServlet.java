package servlet;

import bean.Book;
import dao.BookDao;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "FileUploadServlet")
@MultipartConfig(maxFileSize = 169999999)
public class FileUploadServlet extends HttpServlet {
//    private static final String UPLOAD_DIR = "/Users/mac/Documents/workspace/E-Site/web/uploadsTest";
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        get image path
//        String path = request.getServletContext().getRealPath(UPLOAD_DIR + File.separator);
//
//        File files = new File(path);
//        response.setContentType("image/png");
//        go through the files in dir
//        for (String file : files.list()){
//            File f = new File(path + file);
//            BufferedImage bufferedImage = ImageIO.read(f);
//            OutputStream outputStream = response.getOutputStream();
//            ImageIO.write(bufferedImage, "png", outputStream);
//
//            outputStream.close();
//        }
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter printWriter = response.getWriter();

        InputStream inputStreamCover = null;
        InputStream inputStreamImg = null;
        int sizeCover;
        int sizeImg;
        String title = request.getParameter("image_title");
        String author = request.getParameter("author");
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");
        String date = year + "/" + month + "/" + day;
        String publisher = request.getParameter("publisher");
        Part cover = request.getPart("cover_file");
        Part file = request.getPart("image_file");
        if (file != null && cover != null){
            System.out.println(file.getName());
            System.out.println(file.getSize());
            System.out.println(file.getContentType());

            System.out.println(cover.getName());
            System.out.println(cover.getSize());
            System.out.println(cover.getContentType());

            inputStreamImg = file.getInputStream();
            inputStreamCover = cover.getInputStream();
        }
        Book book = new Book();
        book.setTitle(title);
        book.setAuthor(author);
        book.setDate(date);
        book.setPublisher(publisher);
        if (inputStreamCover != null && inputStreamImg != null){
            sizeCover = (int) cover.getSize();
            sizeImg = (int) file.getSize();
            book.setCover(inputStreamCover);
            book.setFile(inputStreamImg);
            book.setCoverSize(sizeCover);
            book.setImgSize(sizeImg);
        }
        int status = BookDao.saveBook(book);
        if (status > 0){
            System.out.println("file uploaded");
            request.getRequestDispatcher("eBook.jsp").include(request, response);

        } else {
            System.out.println("Couldn't upload the file");
            request.getRequestDispatcher("eBook.jsp").include(request, response);
        }

    }

}
