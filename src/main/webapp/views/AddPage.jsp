<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add New Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        * {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', sans-serif;
        }

        body {
            background: #ffffff;
            color: #000000;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        .card {
            border: 1px solid #eaeaea;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            background: #ffffff;
        }

        .card-header {
            background: #ffffff;
            border-bottom: 1px solid #eaeaea;
            padding: 1.5rem;
        }

        .card-header h2 {
            font-size: 1.5rem;
            font-weight: 600;
            letter-spacing: -0.025em;
            color: #000000;
            margin: 0;
        }

        .card-header p {
            color: #666;
            margin-top: 0.5rem;
            margin-bottom: 0;
            font-size: 0.875rem;
        }

        .form-label {
            font-weight: 500;
            color: #1a1a1a;
            margin-bottom: 0.5rem;
            font-size: 0.875rem;
        }

        .form-control {
            border: 1px solid #eaeaea;
            border-radius: 8px;
            padding: 0.625rem 0.875rem;
            font-size: 0.875rem;
            transition: all 0.2s;
            background: #ffffff;
            color: #000000;
        }

        .form-control:focus {
            border-color: #000000;
            box-shadow: 0 0 0 3px rgba(0, 0, 0, 0.1);
            outline: none;
        }

        .form-control::placeholder {
            color: #aaa;
        }

        .required-field::after {
            content: " *";
            color: #dc2626;
        }

        .btn-save {
            background: #000000;
            color: white;
            border: none;
            padding: 0.625rem 1.25rem;
            font-size: 0.875rem;
            font-weight: 500;
            border-radius: 8px;
            width: 100%;
            transition: all 0.2s;
        }

        .btn-save:hover {
            background: #2c2c2c;
            transform: translateY(-1px);
        }

        .btn-back {
            background: white;
            color: #333;
            border: 1px solid #eaeaea;
            padding: 0.625rem 1.25rem;
            font-size: 0.875rem;
            font-weight: 500;
            border-radius: 8px;
            width: 100%;
            transition: all 0.2s;
            text-decoration: none;
            text-align: center;
            display: inline-block;
        }

        .btn-back:hover {
            background: #f5f5f5;
            border-color: #cccccc;
        }

        small.text-muted {
            color: #888 !important;
            font-size: 0.75rem;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h2>Add New Book</h2>
                    <p>Fill in the details to add a book to your collection</p>
                </div>
                <div class="card-body p-4">
                    <form method="POST">
                        <div class="mb-4">
                            <label for="name" class="form-label required-field">Book Title</label>
                            <input type="text"
                                   class="form-control"
                                   id="name"
                                   name="title"
                                   placeholder="e.g., The Great Gatsby"
                                   required>
                        </div>
                        <div class="mb-4">
                            <label for="author" class="form-label required-field">Author</label>
                            <input type="text"
                                   class="form-control"
                                   id="author"
                                   name="author"
                                   placeholder="e.g., F. Scott Fitzgerald"
                                   required>
                        </div>
                        <div class="mb-4">
                            <label for="link" class="form-label required-field">Book Link (URL)</label>
                            <input type="url"
                                   class="form-control"
                                   id="link"
                                   name="link"
                                   placeholder="https://example.com/book"
                                   required>
                            <small class="text-muted">Link to the book's page or PDF</small>
                        </div>
                        <div class="mb-4">
                            <label for="isbn" class="form-label">ISBN</label>
                            <input type="text"
                                   class="form-control"
                                   id="isbn"
                                   name="isbn"
                                   maxlength="13"
                                   placeholder="978-3-16-148410-0">
                            <small class="text-muted">Optional, must be unique if provided</small>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn-save">
                                <i class="bi bi-save"></i> Save Book
                            </button>
                            <a href="/" class="btn-back">
                                <i class="bi bi-arrow-left"></i> Back to Books
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>