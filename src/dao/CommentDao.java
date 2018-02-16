package dao;

import bean.Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CommentDao {
    //save comment into database
    public static int saveComment(Comment comment){
        int status = 0;
        Connection connection;
        try {
            String sql = "INSERT INTO comment_table(comments) VALUES (?)";
            connection = ConnectionDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, comment.getComment());
            status = preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
