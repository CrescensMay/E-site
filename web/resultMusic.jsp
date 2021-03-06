<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Base64" %>
<%@ page import="dao.ConnectionDao" %>
<%@ page import="java.io.InputStream" %>
<section id="video-container">
    <h4 class="video-heading" style="margin-left: 10px;"><p></p></h4>
    <ul id="result-video">
        <%
            try {
                Connection connection = ConnectionDao.getConnection();
                byte[] fileData;
                byte[] coverImg;
                String title;
                String artist;
                String published_date;
                String sql = "SELECT * FROM music_table";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    title = resultSet.getString("title");
                    artist = resultSet.getString("artist");
                    coverImg = resultSet.getBytes("cover");
                    fileData = resultSet.getBytes("file");
                    published_date = resultSet.getString("released_date");
                    response.setContentType("text/html");
                    String encodeFile = Base64.getEncoder().encodeToString(fileData);
                    String encodeCover = Base64.getEncoder().encodeToString(coverImg);
                    request.setAttribute("file", encodeFile);
                    request.setAttribute("cover", encodeCover);
                    request.setAttribute("title", title);
                    request.setAttribute("artist", artist);
                    request.setAttribute("date", published_date);
        %>
        <li class="book-item-main">
            <a class="listen-music" href="data:audio/mp3;base64,${file}">
                <img src="data:image/png;base64,${cover}">
                <h4 style="margin-left: 10px;margin-top: 3px;">${title}</h4>
            </a>
            <p style="margin-left: 10px;"><small>By ${artist}</small></p>
            <a href="data:audio/mp3;base64,${file}" download="${title}"><button class="dowload-btn">Download</button></a>
        </li>
        <%
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        %>
    </ul>
    <div id="btn">
    </div>
</section>

