<%@ page import="dao.BookDao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Base64" %>

<section id="video-container">
    <h4 class="video-heading" style="margin-left: 10px;"><p></p></h4>
    <ul id="result-video">
        <%
            try {
                Connection connection = BookDao.getConnection();
                byte[] fileData;
                String title;
                String author;
                String sql = "SELECT * FROM image_table";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    fileData = resultSet.getBytes("file");
                    title = resultSet.getString("title");
                    author = resultSet.getString("author");
                    response.setContentType("text/html");
                    String encode = Base64.getEncoder().encodeToString(fileData);
                    request.setAttribute("imageBase", encode);
                    request.setAttribute("title", title);
                    request.setAttribute("author", author);
                    %>
        <li class="book-item-main">
            <a href=""><img src="data:image/png;base64,${imageBase}" alt="image_type_check">
                <p><small>Title: </small>${title}</p>
                <p><small>Author: </small>${author}</p>
            </a>
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
