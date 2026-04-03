package com.example.bookmanagement.servlet;

import com.example.bookmanagement.dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/book/edit")
public class EditBookServlet extends HttpServlet {
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/EditPage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String input = req.getParameter("input");
        String select = req.getParameter("select");

        // Xavfsizlik uchun faqat shu uchta ustunni o'zgartirishga ruxsat beramiz
        String column = switch (select) {
            case "title" -> "title";
            case "author" -> "author";
            case "link" -> "link";
            default -> throw new RuntimeException("Invalid field");
        };

        if (input == null || input.isBlank()) {
            req.setAttribute("error", "Maydon bo‘sh bo‘lmasligi kerak");
            req.getRequestDispatcher("/views/EditPage.jsp").forward(req, resp);
            return;
        }

        bookDAO.updateBookField(id, column, input);
        resp.sendRedirect(req.getContextPath() + "/");
    }
}