package com.example.bookmanagement.servlet;

import com.example.bookmanagement.dao.BookDAO;
import com.example.bookmanagement.model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "")
public class HomeServlet extends HttpServlet {
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book> books = bookDAO.getAllBooks();
        req.setAttribute("books", books);
        req.getRequestDispatcher("/views/Home.jsp").forward(req, resp);
    }
}