package servlet;

import bean.Show;
import dao.TVShowDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "ShowUploadServlet")
@MultipartConfig(maxFileSize = 799999999)
public class ShowUploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        InputStream inputStreamCover = null;
        InputStream inputStreamShow = null;
        int sizeCover;
        int sizeFile;
        String title = request.getParameter("show_title");
        String host = request.getParameter("host_name");
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");
        String date = year + "/" + month + "/" + day;
        String director = request.getParameter("director_name");
        Part cover_File = request.getPart("cover_file");
        Part show_file = request.getPart("show_file");
        if (show_file != null && cover_File != null){
            System.out.println(show_file.getName());
            System.out.println(show_file.getSize());
            System.out.println(show_file.getContentType());

            System.out.println(cover_File.getName());
            System.out.println(cover_File.getSize());
            System.out.println(cover_File.getContentType());

            inputStreamShow = show_file.getInputStream();
            inputStreamCover = cover_File.getInputStream();
        }
        Show show = new Show();
        show.setTitle(title);
        show.setHost(host);
        show.setRelease_date(date);
        show.setDirector(director);
        if (inputStreamCover != null && inputStreamShow != null){
            sizeCover = (int) cover_File.getSize();
            sizeFile = (int) show_file.getSize();
            show.setCover(inputStreamCover);
            show.setFile(inputStreamShow);
            show.setCoverSize(sizeCover);
            show.setFileSize(sizeFile);
        }
        int status = TVShowDao.saveTVShow(show);
        if (status > 0){
            System.out.println("file uploaded");
            request.getRequestDispatcher("tvShow.jsp").include(request, response);

        } else {
            System.out.println("Couldn't upload the file");
            request.getRequestDispatcher("uploadShow.jsp").include(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
