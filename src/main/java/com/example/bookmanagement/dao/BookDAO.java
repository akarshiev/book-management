package com.example.bookmanagement.dao;

import com.example.bookmanagement.model.Book;
import com.example.bookmanagement.config.DatabaseConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    // 1. Hamma kitoblarni olish
    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books ORDER BY book_id ASC";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                books.add(mapResultSetToBook(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    // 2. Yangi kitob qo'shish
    public void addBook(Book book) {
        String sql = "INSERT INTO books (title, author, link, isbn) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getLink());
            ps.setString(4, book.getIsbn());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 3. Kitobni yangilash
    public void updateBookField(int id, String column, String newValue) {
        // ustun nomini to'g'ridan-to'g'ri berish biroz xavfli, shuning uchun Servletda tekshirib olamiz
        String sql = "UPDATE books SET " + column + " = ? WHERE book_id = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, newValue);
            ps.setInt(2, id);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 4. Kitobni o'chirish
    public void deleteBook(int id) {
        String sql = "DELETE FROM books WHERE book_id = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Yordamchi metod: ResultSet'dan Book obyektini yasab beradi (Kodni qisqartirish uchun)
    private Book mapResultSetToBook(ResultSet rs) throws SQLException {
        return Book.builder()
                .book_id(rs.getInt("book_id"))
                .title(rs.getString("title"))
                .author(rs.getString("author"))
                .link(rs.getString("link"))
                .isbn(rs.getString("isbn"))
                .created_at(rs.getString("created_at"))
                .build();
    }
}