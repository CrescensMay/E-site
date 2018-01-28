package dao;

import bean.Show;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TVShowDao {

    //save movie into DB
    public static int saveTVShow(Show show){
        int status = 0;
        Connection connection;

        try {
            String sql = "INSERT INTO tvshow_table(title, host, released_date, director, cover, file) VALUES (?, ?, ?, ?, ?, ?)";
            connection = ConnectionDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, show.getTitle());
            preparedStatement.setString(2, show.getHost());
            preparedStatement.setString(3, show.getRelease_date());
            preparedStatement.setString(4, show.getDirector());
            preparedStatement.setBinaryStream(5, show.getCover(), show.getCoverSize());
            preparedStatement.setBinaryStream(6, show.getFile(), show.getFileSize());

            status = preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }
}
