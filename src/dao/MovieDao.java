package dao;

import bean.Movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MovieDao {

    //save movie into DB
    public static int saveMovie(Movie movie){
        int status = 0;
        Connection connection;

        try {
            String sql = "INSERT INTO movie_table(title, actor, released_date, director, cover, file) VALUES (?, ?, ?, ?, ?, ?)";
            connection = ConnectionDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, movie.getTitle());
            preparedStatement.setString(2, movie.getActor());
            preparedStatement.setString(3, movie.getRelease_date());
            preparedStatement.setString(4, movie.getDirector());
            preparedStatement.setBinaryStream(5, movie.getCover(), movie.getCoverSize());
            preparedStatement.setBinaryStream(6, movie.getFile(), movie.getFileSize());

            status = preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }

}
