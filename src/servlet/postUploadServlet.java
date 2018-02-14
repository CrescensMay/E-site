package servlet;

import bean.Forum;
import com.github.marlonlom.utilities.timeago.TimeAgoMessages;
import dao.ForumDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@WebServlet(name = "postUploadServlet")
@MultipartConfig(maxFileSize = 799999999)
public class postUploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        InputStream postFile = null;
        int postSize;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        String comment = request.getParameter("comment");
        Part post_file = request.getPart("post-file");
        if (post_file != null){
            System.out.println(post_file.getName());
            System.out.println(post_file.getContentType());
            System.out.println(post_file.getSize());

            postFile = post_file.getInputStream();
        }
        Forum forum = new Forum();
        forum.setComment(comment);
        forum.setDate(simpleDateFormat.format(new Date()));
        if (postFile != null){
            postSize = (int) post_file.getSize();
            forum.setFileSize(postSize);
            forum.setPostFile(postFile);
        }
        int status = ForumDao.savePost(forum);
        if (status > 0){
            System.out.println("Comment uploaded");
            request.getRequestDispatcher("forum.jsp").include(request, response);
        }else {
            System.out.println("Couldn't upload the file");
            request.getRequestDispatcher("forum.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
