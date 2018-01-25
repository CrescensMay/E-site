<%@ page import="dao.BookDao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Base64" %>

<section id="video-container">
    <h4 class="video-heading" style="margin-left: 10px;"><p></p></h4>
    <jsp:include page="html/description.html"/>
    <ul id="result-video">
        <%
            try {
                Connection connection = BookDao.getConnection();
                byte[] fileData;
                byte[] coverImg;
                String title;
                String author;
                String sql = "SELECT * FROM image_table";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    title = resultSet.getString("title");
                    author = resultSet.getString("author");
                    coverImg = resultSet.getBytes("cover");
                    fileData = resultSet.getBytes("file");
                    response.setContentType("text/html");
                    String encodeFile = Base64.getEncoder().encodeToString(fileData);
                    String encodeCover = Base64.getEncoder().encodeToString(coverImg);
                    request.setAttribute("file", encodeFile);
                    request.setAttribute("cover", encodeCover);
                    request.setAttribute("title", title);
                    request.setAttribute("author", author);
                    %>
        <li class="book-item-main">
            <a><img src="data:image/png;base64,${cover}" alt="image_type_check">
                <p><small>Title: </small>${title}</p>
                <p><small>Author: </small>${author}</p>
            </a>
            <a><button class="dowload-btn">Details</button></a><br>
            <a href="data:application/pdf;base64,${file}" download="${title}"><button class="dowload-btn">Download</button></a>
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
