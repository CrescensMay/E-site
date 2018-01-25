package dao;

import bean.Music;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MusicDao {

    //save music into DB
    public static int saveMusic(Music music){
        int status = 0;
        Connection connection;

        try {
            String query = "INSERT INTO music_table(title, artist, released_date, producer, cover, file) VALUES (?, ?, ?, ?, ?, ?)";
            connection = ConnectionDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, music.getTitle());
            preparedStatement.setString(2, music.getArtist());
            preparedStatement.setString(3, music.getRelease_date());
            preparedStatement.setString(4, music.getProducer());
            preparedStatement.setBinaryStream(5, music.getCover(), music.getCoverSize());
            preparedStatement.setBinaryStream(6, music.getFile(), music.getFileSize());

            status = preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }

    //get all musics
    public static List<Music> getMusics(){
        List<Music> musicList = new ArrayList<>();
        Connection connection;
        try {
            connection = ConnectionDao.getConnection();
            String query = "SELECT * FROM music_table";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                Music music = new Music();
                music.setTitle(resultSet.getString(1));
                music.setArtist(resultSet.getString(2));
                music.setRelease_date(resultSet.getString(3));
                music.setProducer(resultSet.getString(4));
                music.setCover(resultSet.getBinaryStream(5));
                music.setFile(resultSet.getBinaryStream(6));

                musicList.add(music);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return musicList;
    }
}
