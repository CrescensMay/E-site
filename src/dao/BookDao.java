package dao;

import bean.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
    //save book into DB
    public static int saveBook(Book book){
        int status = 0;
        Connection connection;

        try {
            String query = "INSERT INTO book_table(title, author, published_date, publisher, cover, file) VALUES (?, ?, ?, ?, ?, ?)";
            connection = ConnectionDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getAuthor());
            preparedStatement.setString(3, book.getDate());
            preparedStatement.setString(4, book.getPublisher());
            preparedStatement.setBinaryStream(5, book.getCover(), book.getCoverSize());
            preparedStatement.setBinaryStream(6, book.getFile(), book.getImgSize());

            status = preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }

    //get book by id
    public static Book getBookById(int id){
        Book book = new Book();

        try {
            Connection connection = ConnectionDao.getConnection();
            String sql = "SELECT * FROM book_table where id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                book.setId(resultSet.getInt("id"));
                book.setTitle(resultSet.getString("title"));
                book.setAuthor(resultSet.getString("author"));
                book.setDate(resultSet.getString("published_date"));
                book.setPublisher(resultSet.getString("publisher"));
                book.setCover(resultSet.getBinaryStream("cover"));
                book.setFile(resultSet.getBinaryStream("file"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }
    //get all books
    public static List<Book> getBooks(){
        List<Book> books = new ArrayList<>();
        Connection connection;
        try {
            connection = ConnectionDao.getConnection();
            String query = "SELECT * FROM book_table";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                Book book = new Book();
                book.setTitle(resultSet.getString(1));
                book.setAuthor(resultSet.getString(2));
                book.setDate(resultSet.getString(3));
                book.setPublisher(resultSet.getString(4));
                book.setCover(resultSet.getBinaryStream(5));
                book.setFile(resultSet.getBinaryStream(6));

                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return books;
    }


}
