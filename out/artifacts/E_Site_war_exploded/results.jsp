<%@ page import="dao.DB_Connection" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Base64" %>

<section id="video-container">
    <h4 class="video-heading" style="margin-left: 10px;"><p></p></h4>
    <ul id="result-video">
        <%
            try {
                DB_Connection db_connection = new DB_Connection();
                Connection connection = db_connection.getConnection();

                byte[] fileData = null;
                String sql = "SELECT * FROM image_table";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    fileData = resultSet.getBytes("file");
                    response.setContentType("text/html");
                    String encode = Base64.getEncoder().encodeToString(fileData);
                    request.setAttribute("imageBase", encode);
                    %>
        <li class="list-item-main"><img src="data:image/png;base64,${imageBase}" alt="image_type_check">
            <%
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        %></li>
    </ul>
    <div id="btn">
    </div>
</section>
