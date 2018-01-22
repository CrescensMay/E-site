package servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "/Users/mac/Documents/workspace/E-Site/web/uploadsTest";

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

        //check if it is a file
        if (ServletFileUpload.isMultipartContent(request)){

            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for(FileItem item: multiparts){
                    if(!item.isFormField()){
                        //get file name
                        String name = new File(item.getName()).getName();
                        //upload file into dir
                        item.write(new File(UPLOAD_DIR + File.separator + name));
//                        request.setAttribute("file", UPLOAD_DIR + File.separator + name);
                    }
                }
                //File upload successfully
                request.setAttribute("message","Success");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Failed due to " + e);
            }

        }
        request.getRequestDispatcher("eBook.jsp").forward(request,response);
    }

}
