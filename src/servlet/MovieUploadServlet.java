package servlet;

import bean.Movie;
import dao.MovieDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "MovieUploadServlet")
@MultipartConfig(maxFileSize = 799999999)
public class MovieUploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InputStream inputStreamCover = null;
        InputStream inputStreamMovie = null;
        int sizeCover;
        int sizeFile;
        String title = request.getParameter("movie_title");
        String actor = request.getParameter("actor");
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");
        String date = year + "/" + month + "/" + day;
        String director = request.getParameter("director");
        Part cover_File = request.getPart("cover_file");
        Part movie_file = request.getPart("movie_file");
        if (movie_file != null && cover_File != null){
            System.out.println(movie_file.getName());
            System.out.println(movie_file.getSize());
            System.out.println(movie_file.getContentType());

            System.out.println(cover_File.getName());
            System.out.println(cover_File.getSize());
            System.out.println(cover_File.getContentType());

            inputStreamMovie = movie_file.getInputStream();
            inputStreamCover = cover_File.getInputStream();
        }
        Movie movie = new Movie();
        movie.setTitle(title);
        movie.setActor(actor);
        movie.setRelease_date(date);
        movie.setDirector(director);
        if (inputStreamCover != null && inputStreamMovie != null){
            sizeCover = (int) cover_File.getSize();
            sizeFile = (int) movie_file.getSize();
            movie.setCover(inputStreamCover);
            movie.setFile(inputStreamMovie);
            movie.setCoverSize(sizeCover);
            movie.setFileSize(sizeFile);
        }
        int status = MovieDao.saveMovie(movie);
        if (status > 0){
            System.out.println("file uploaded");
            request.getRequestDispatcher("movies.jsp").include(request, response);

        } else {
            System.out.println("Couldn't upload the file");
            request.getRequestDispatcher("uploadMovie.jsp").include(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
