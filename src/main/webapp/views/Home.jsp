<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Book List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        * {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', sans-serif;
        }

        body {
            background: #ffffff;
            color: #000000;
        }

        .container {
            max-width: 1200px;
            margin-top: 3rem;
        }

        h1 {
            font-size: 2rem;
            font-weight: 600;
            letter-spacing: -0.025em;
            color: #000000;
        }

        .table {
            background: #ffffff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
            border: 1px solid #eaeaea;
        }

        .table thead th {
            background: #fafafa;
            color: #111111;
            font-weight: 500;
            font-size: 0.875rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            border-bottom: 1px solid #eaeaea;
            padding: 1rem;
        }

        .table tbody td {
            padding: 1rem;
            vertical-align: middle;
            border-bottom: 1px solid #f0f0f0;
            color: #1a1a1a;
        }

        .table tbody tr:hover {
            background: #fafafa;
        }

        .btn-outline-custom {
            border: 1px solid #eaeaea;
            color: #333333;
            background: white;
            transition: all 0.2s ease;
            font-size: 0.875rem;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 8px;
        }

        .btn-outline-custom:hover {
            background: #f5f5f5;
            border-color: #cccccc;
            transform: translateY(-1px);
        }

        .btn-add {
            background: #000000;
            color: white;
            border: none;
            padding: 0.5rem 1.25rem;
            font-size: 0.875rem;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.2s ease;
        }

        .btn-add:hover {
            background: #2c2c2c;
            transform: translateY(-1px);
        }

        .btn-edit {
            color: #000000;
            background: transparent;
            border: 1px solid #eaeaea;
            font-size: 0.813rem;
            padding: 0.375rem 0.875rem;
            border-radius: 6px;
            transition: all 0.2s;
        }

        .btn-edit:hover {
            background: #f0f0f0;
            border-color: #cccccc;
        }

        .btn-delete {
            color: #dc2626;
            background: transparent;
            border: 1px solid #fee2e2;
            font-size: 0.813rem;
            padding: 0.375rem 0.875rem;
            border-radius: 6px;
            transition: all 0.2s;
        }

        .btn-delete:hover {
            background: #fef2f2;
            border-color: #fecaca;
        }

        .link-group {
            display: flex;
            gap: 0.75rem;
            justify-content: center;
            margin-top: 2rem;
            padding: 1.5rem;
            background: #fafafa;
            border-radius: 16px;
            border: 1px solid #eaeaea;
        }

        .link-group a {
            text-decoration: none;
            font-weight: 500;
            font-size: 0.875rem;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            transition: all 0.2s;
        }

        .link-group a i {
            margin-right: 0.5rem;
        }

        .badge-id {
            background: #f0f0f0;
            color: #333;
            font-family: monospace;
            font-weight: 500;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.75rem;
        }

        footer {
            text-align: center;
            margin-top: 3rem;
            padding: 1.5rem;
            color: #666;
            font-size: 0.75rem;
            border-top: 1px solid #eaeaea;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1><i class="bi bi-book"></i> Books</h1>
            <p class="text-muted mt-1" style="color: #666 !important;">Manage your book collection</p>
        </div>
        <a href="/book/add" class="btn-add">
            <i class="bi bi-plus-lg"></i> Add book
        </a>
    </div>

    <div class="table-responsive mt-5">
        <table class="table">
            <thead>
            <tr>
                <th style="width: 8%">ID</th>
                <th style="width: 25%">Title</th>
                <th style="width: 25%">Author</th>
                <%--                <th style="width: 25%">ISBN</th>--%>
                <th style="width: 22%">Link</th>
                <th style="width: 35%">Action</th>

                <%-- <th style="width: 22%">Actions</th>--%>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${books}" var="book">
                <tr>
                    <td><span class="badge-id">#${book.book_id}</span></td>
                    <td><strong>${book.title}</strong></td>
                    <td>${book.author}</td>
                        <%--                    <td>${book.isbn}</td>--%>
                    <td><a href="${book.link}" target="_blank">Buy this book</a></td>
                    <td>
                        <a href="/book/edit?id=${book.book_id}" class="btn-edit me-2"
                           style="text-decoration: none; display: inline-block;">
                            <i class="bi bi-pencil"></i> Edit
                        </a>
                        <a href="/book/delete?id=${book.book_id}" class="btn-delete"
                           style="text-decoration: none; display: inline-block;">
                            <i class="bi bi-trash"></i> Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty books}">
                <tr>
                    <td colspan="4" class="text-center py-5" style="color: #999;">
                        <i class="bi bi-inbox" style="font-size: 2rem;"></i>
                        <p class="mt-2">No books found. Add your first book!</p>
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>