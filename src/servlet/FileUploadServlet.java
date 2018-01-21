package servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter printWriter = response.getWriter();
        if (ServletFileUpload.isMultipartContent(request)){

            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for(FileItem item: multiparts){
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                        String UPLOAD_DIR = "/Users/mac/Documents/workspace/E-Site/web/uploadsTest";
                        item.write(new File(UPLOAD_DIR + File.separator + name));
                    }
                }
                //Filde upload successfully
                request.setAttribute("message","Success");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Failed due to " + e);
            }

        }
        request.getRequestDispatcher("eBook.jsp").forward(request,response);
    }
}
