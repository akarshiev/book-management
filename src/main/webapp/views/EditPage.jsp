<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Edit Book</title>
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

        .form-control, .form-select {
            border: 1px solid #eaeaea;
            border-radius: 8px;
            padding: 0.625rem 0.875rem;
            font-size: 0.875rem;
            transition: all 0.2s;
            background: #ffffff;
            color: #000000;
        }

        .form-control:focus, .form-select:focus {
            border-color: #000000;
            box-shadow: 0 0 0 3px rgba(0, 0, 0, 0.1);
            outline: none;
        }

        .btn-update {
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

        .btn-update:hover {
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

        .info-box {
            background: #fafafa;
            border: 1px solid #eaeaea;
            border-radius: 10px;
            padding: 1rem;
            margin-bottom: 1.5rem;
        }

        .info-box i {
            color: #000000;
            margin-right: 0.5rem;
        }

        hr {
            border-color: #eaeaea;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h2><i class="bi bi-pencil-square"></i> Edit Book</h2>
                    <p>Update book information</p>
                </div>
                <div class="card-body p-4">
                    <!-- Book ID display -->
                    <div class="info-box">
                        <i class="bi bi-info-circle"></i> Editing Book ID:
                        <strong>${param.id != null ? param.id : "Not specified"}</strong>
                    </div>

                    <form method="POST" action="/book/edit">
                        <input type="hidden" name="id" value="${param.id}">

                        <div class="mb-4">
                            <label class="form-label">Select field to update</label>
                            <select class="form-select" name="select">
                                <option value="title">Book Title</option>
                                <option value="author">Author</option>
                                <option value="link">URL</option>
                            </select>
                            <small class="text-muted">Choose which field you want to edit</small>
                        </div>

                        <div class="mb-4">
                            <label for="input" class="form-label">New Value</label>
                            <input type="text"
                                   class="form-control"
                                   id="input"
                                   name="input"
                                   placeholder="Enter the new value here"
                                   required>
                        </div>

                        <hr>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn-update">
                                <i class="bi bi-check-lg"></i> Update Book
                            </button>
                            <a href="/" class="btn-back">
                                <i class="bi bi-arrow-left"></i> Cancel & Back
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