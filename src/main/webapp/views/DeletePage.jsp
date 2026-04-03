<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Delete Book</title>
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
      box-shadow: 0 4px 12px rgba(0,0,0,0.05);
      background: #ffffff;
    }
    .card-header {
      background: #ffffff;
      border-bottom: 1px solid #eaeaea;
      padding: 1.5rem;
      text-align: center;
    }
    .card-header i {
      font-size: 3rem;
      color: #dc2626;
      margin-bottom: 0.5rem;
      display: inline-block;
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
      box-shadow: 0 0 0 3px rgba(0,0,0,0.1);
      outline: none;
    }
    .warning-box {
      background: #fef2f2;
      border: 1px solid #fecaca;
      border-radius: 10px;
      padding: 1rem;
      margin: 1.5rem 0;
      text-align: center;
    }
    .warning-box i {
      color: #dc2626;
      font-size: 1.25rem;
      margin-right: 0.5rem;
    }
    .warning-box strong {
      color: #dc2626;
    }
    .btn-delete {
      background: #dc2626;
      color: white;
      border: none;
      padding: 0.625rem 1.25rem;
      font-size: 0.875rem;
      font-weight: 500;
      border-radius: 8px;
      width: 100%;
      transition: all 0.2s;
    }
    .btn-delete:hover {
      background: #b91c1c;
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
  </style>
</head>
<body>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-5">
      <div class="card">
        <div class="card-header">
          <i class="bi bi-exclamation-triangle-fill"></i>
          <h2>Delete Book</h2>
          <p>This action cannot be undone</p>
        </div>
        <div class="card-body p-4">
          <div class="warning-box">
            <i class="bi bi-shield-exclamation"></i>
            <strong>Warning!</strong> You are about to delete a book permanently.
          </div>

          <form method="POST" action="/book/delete">
            <div class="mb-4">
              <label for="id" class="form-label">Book ID to Delete</label>
              <input type="text"
                     class="form-control"
                     id="id"
                     name="id"
                     placeholder="Enter book ID"
                     value="${param.id}"
                     required>
              <small class="text-muted">Enter the ID of the book you want to delete</small>
            </div>

            <div class="d-grid gap-2">
              <button type="submit" class="btn-delete" onclick="return confirm('Are you absolutely sure you want to delete this book?');">
                <i class="bi bi-trash3"></i> Yes, Delete Book
              </button>
              <a href="/" class="btn-back">
                <i class="bi bi-x-circle"></i> No, Go Back
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