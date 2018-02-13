<%@ page import="java.sql.Connection" %>
<%@ page import="dao.ConnectionDao" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %>
<%@ page import="com.github.marlonlom.utilities.timeago.TimeAgoMessages" %>
<%@ page import="java.util.Locale" %>
<%@ page import="com.github.marlonlom.utilities.timeago.TimeAgo" %>
<section id="video-container">
    <form name="comment-form" id="forum-form" action="postCommentUpload" method="post" enctype="multipart/form-data">
        <label for="text-area">Express yourself</label><br>
        <textarea id="text-area"  name="comment" style="width: 350px;height: 100px;" placeholder="Enter comment here" required></textarea><br>
        <input type="file" name="post-file">
        <input type="submit" value="Post">
    </form>
    <span id="local"></span>
    <h4 class="video-heading" style="margin-left: 10px;"><p></p></h4>
    <ul id="result-post">
        <%
            byte[] fileData;
            String post;
            Connection connection = ConnectionDao.getConnection();
            String sql = "SELECT * FROM forum_table";
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    post = resultSet.getString("comment");
                    fileData = resultSet.getBytes("file");
                    String encodeFile = Base64.getEncoder().encodeToString(fileData);
                    request.setAttribute("post", post);
                    Locale locale = Locale.forLanguageTag("en");
                    TimeAgoMessages timeAgoMessages = new TimeAgoMessages.Builder().withLocale(locale).build();
                    String text = TimeAgo.using(System.currentTimeMillis(), timeAgoMessages);
                    System.out.println(text);
                    request.setAttribute("time", text);
                    request.setAttribute("file", encodeFile);

        %>
        <li class="post-item-main">
            <img src="" alt="user_profile" height="30" width="30"><p style="margin-left: 10px;">New Guy</p>
            <div>
                <h4 style="margin-left: 10px;margin-top: 3px;">${post}</h4>
                <img src="data:image/png;base64,${file}">
                <h5>${time}</h5>
            </div>
            <button class="dowload-btn">Download</button>
        </li>
        <%
                preparedStatement.close();
                connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </ul>
    <div id="btn">
    </div>
</section>
