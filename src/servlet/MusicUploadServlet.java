package servlet;

import bean.Music;
import dao.MusicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "MusicUploadServlet")
@MultipartConfig(maxFileSize = 799999999)
public class MusicUploadServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        InputStream inputStreamCover = null;
        InputStream inputStreamZik = null;
        int sizeCover;
        int sizeFile;
        String title = request.getParameter("music_title");
        String artist = request.getParameter("artist");
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");
        String date = year + "/" + month + "/" + day;
        String producer = request.getParameter("producer");
        Part cover_File = request.getPart("music_cover");
        Part music_file = request.getPart("music_file");
        if (music_file != null && cover_File != null){
            System.out.println(music_file.getName());
            System.out.println(music_file.getSize());
            System.out.println(music_file.getContentType());

            System.out.println(cover_File.getName());
            System.out.println(cover_File.getSize());
            System.out.println(cover_File.getContentType());

            inputStreamZik = music_file.getInputStream();
            inputStreamCover = cover_File.getInputStream();
        }
        Music music = new Music();
        music.setTitle(title);
        music.setArtist(artist);
        music.setRelease_date(date);
        music.setProducer(producer);
        if (inputStreamCover != null && inputStreamZik != null){
            sizeCover = (int) cover_File.getSize();
            sizeFile = (int) music_file.getSize();
            music.setCover(inputStreamCover);
            music.setFile(inputStreamZik);
            music.setCoverSize(sizeCover);
            music.setFileSize(sizeFile);
        }
        int status = MusicDao.saveMusic(music);
        if (status > 0){
            System.out.println("file uploaded");
            request.getRequestDispatcher("musics.jsp").include(request, response);

        } else {
            System.out.println("Couldn't upload the file");
            request.getRequestDispatcher("uploadMusic.jsp").include(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
