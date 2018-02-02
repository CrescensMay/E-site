<%@ page import="java.sql.Connection" %>
<%@ page import="dao.ConnectionDao" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.SQLException" %>
<section id="video-container">
    <h4 class="video-heading" style="margin-left: 10px;"><p></p></h4>
    <ul id="result-video">
        <%
            try {
                Connection connection = ConnectionDao.getConnection();
                byte[] fileData;
                byte[] coverImg;
                String title;
                String host;
                String published_date;
                String sql = "SELECT * FROM tvshow_table";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    title = resultSet.getString("title");
                    host = resultSet.getString("host");
                    coverImg = resultSet.getBytes("cover");
                    fileData = resultSet.getBytes("file");
                    published_date = resultSet.getString("released_date");
                    response.setContentType("text/html");
                    String encodeFile = Base64.getEncoder().encodeToString(fileData);
                    String encodeCover = Base64.getEncoder().encodeToString(coverImg);
                    request.setAttribute("file", encodeFile);
                    request.setAttribute("cover", encodeCover);
                    request.setAttribute("title", title);
                    request.setAttribute("host", host);
                    request.setAttribute("date", published_date);
        %>
        <li class="book-item-main">
            <a data-fancybox data-type="iframe" data-src="data:video/mp4;base64,${file}">
                <img src="data:image/png;base64,${cover}">
                <h4 style="margin-left: 10px;margin-top: 3px;">${title}</h4>
            </a>
            <p style="margin-left: 10px;"><small>By </small>${host}</p>
            <a href="data:video/mp4;base64,${file}" download="${title}"><button class="dowload-btn">Download</button></a>
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
