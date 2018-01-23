package servlet;

import dao.DB_Connection;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter printWriter = response.getWriter();

        InputStream inputStream = null;
        String title = request.getParameter("image_title");
        Part part = request.getPart("image_file");
        if (part != null){
            System.out.println(part.getName());
            System.out.println(part.getSize());
            System.out.println(part.getContentType());

            inputStream = part.getInputStream();
        }

        try {
            DB_Connection db_connection = new DB_Connection();
            Connection connection = db_connection.getConnection();
            String sql = "INSERT INTO image_table (title, file) VALUES (?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, title);
            if (inputStream != null){
                preparedStatement.setBinaryStream(2, inputStream, (int)part.getSize());
            }
            int row = preparedStatement.executeUpdate();
            if (row > 0) {
                System.out.println("file uploaded");
                preparedStatement.close();
                connection.close();
                request.getRequestDispatcher("eBook.jsp").include(request, response);

            } else {
                System.out.println("Couldn't upload the file");
                preparedStatement.close();
                connection.close();
                request.getRequestDispatcher("eBook.jsp").include(request, response);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

//        //check if it is a file
//        if (ServletFileUpload.isMultipartContent(request)){
//
//            try {
//                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
//                for(FileItem item: multiparts){
//                    if(!item.isFormField()){
//                        //get file name
//                        String name = new File(item.getName()).getName();
//                        //upload file into dir
//                        item.write(new File(UPLOAD_DIR + File.separator + name));
////                        request.setAttribute("file", UPLOAD_DIR + File.separator + name);
//                    }
//                }
//                //File upload successfully
//                request.setAttribute("message","Success");
//            } catch (Exception e) {
//                e.printStackTrace();
//                request.setAttribute("message", "Failed due to " + e);
//            }
//
//        }
////        request.getRequestDispatcher("eBook.jsp").forward(request,response);
    }

}
