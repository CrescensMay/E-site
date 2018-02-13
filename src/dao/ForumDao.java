package dao;

import bean.Forum;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ForumDao {
    //save post into the database
    public static int savePost(Forum forum){
        int status = 0;
        Connection connection;
        try {
            String sql = "INSERT INTO forum_table(comment, date, file) VALUES(?, ?, ?)";
            connection = ConnectionDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, forum.getComment());
            preparedStatement.setString(2, forum.getDate());
            preparedStatement.setBinaryStream(3, forum.getPostFile(), forum.getFileSize());

            status = preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }
}
