<%@ page import="java.sql.Connection" %>
<%@ page import="dao.ConnectionDao" %>
<%@ page import="bean.Comment" %>
<%@ page import="dao.CommentDao" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%
    Connection connection;
    String commentForm = request.getParameter("userComment");
    connection = ConnectionDao.getConnection();
    Comment comment = new Comment();
    comment.setComment(commentForm);
    int status = CommentDao.saveComment(comment);

    try {
        String sql = "SELECT * FROM comment_table ORDER BY id DESC";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        out.write("<hr><h2>Comments</h2>");
        while (resultSet.next()){
            out.print("<div class='box'>");
            out.print("<p><strong>By crescens</strong></p>");
            out.print("<p>" + resultSet.getString("comments") + "</p>");
            out.print("</div>");
        }
        preparedStatement.close();
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>