package com.example.bookmanagement.servlet;

import com.example.bookmanagement.dao.BookDAO;
import com.example.bookmanagement.model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AddBook", value = "/book/add")
public class AddBookServlet extends HttpServlet {
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/AddPage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String isbn = req.getParameter("isbn");
        String link = req.getParameter("link");

        if (title == null || title.isBlank() || author == null || author.isBlank()) {
            req.setAttribute("error", "Name va author bo‘sh bo‘lmasligi kerak");
            req.getRequestDispatcher("/views/AddPage.jsp").forward(req, resp);
            return;
        }

        // Builder orqali obyekt yasaymiz
        Book newBook = Book.builder()
                .title(title)
                .author(author)
                .isbn(isbn)
                .link(link)
                .build();

        // DAO orqali bazaga saqlaymiz
        bookDAO.addBook(newBook);

        resp.sendRedirect(req.getContextPath() + "/");
    }
}