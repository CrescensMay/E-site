<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="dao.ConnectionDao" %>

<section id="video-container">
    <h4 class="video-heading" style="margin-left: 10px;"><p></p></h4>
    <ul id="result-video">
        <%
            try {
                Connection connection = ConnectionDao.getConnection();
                byte[] fileData;
                byte[] coverImg;
                String title;
                String author;
                String published_date;
                String sql = "SELECT * FROM book_table";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    title = resultSet.getString("title");
                    author = resultSet.getString("author");
                    coverImg = resultSet.getBytes("cover");
                    fileData = resultSet.getBytes("file");
                    published_date = resultSet.getString("published_date");
                    response.setContentType("text/html");
                    String encodeFile = Base64.getEncoder().encodeToString(fileData);
                    String encodeCover = Base64.getEncoder().encodeToString(coverImg);
                    request.setAttribute("file", encodeFile);
                    request.setAttribute("cover", encodeCover);
                    request.setAttribute("title", title);
                    request.setAttribute("author", author);
                    request.setAttribute("date", published_date);
                    %>
        <li data-fancybox data-type="iframe" data-src="data:application/pdf;base64,${file}" class="book-item-main">
            <img src="data:image/png;base64,${cover}" alt="image_type_check">
            <p><small>Title: </small>${title}</p>
            <p><small>Author: </small>${author}</p>
            <button class="detail-btn">Preview</button><br>
            <%--<a href="data:application/pdf;base64,${file}" download="${title}"><button class="dowload-btn">Download</button></a>--%>
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
