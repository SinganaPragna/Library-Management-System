<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Library Management System</a>
        <div class="navbar-nav">
            <a class="nav-link" href="books">View Books</a>
            <a class="nav-link" href="books?action=new">Add Book</a>
        </div>
    </div>
</nav>

<main class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Update Book</h2>
        <a href="books" class="btn btn-outline-secondary">Back to List</a>
    </div>

    <form action="books" method="post" class="form-box">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<c:out value='${book.id}'/>">

        <div class="mb-3">
            <label for="title" class="form-label">Title</label>
            <input type="text" class="form-control" id="title" name="title" value="<c:out value='${book.title}'/>" required>
        </div>

        <div class="mb-3">
            <label for="author" class="form-label">Author</label>
            <input type="text" class="form-control" id="author" name="author" value="<c:out value='${book.author}'/>" required>
        </div>

        <div class="mb-3">
            <label for="category" class="form-label">Category</label>
            <input type="text" class="form-control" id="category" name="category" value="<c:out value='${book.category}'/>" required>
        </div>

        <div class="mb-3">
            <label for="quantity" class="form-label">Quantity</label>
            <input type="number" class="form-control" id="quantity" name="quantity" min="0" value="<c:out value='${book.quantity}'/>" required>
        </div>

        <button type="submit" class="btn btn-primary">Update Book</button>
        <a href="books" class="btn btn-light">Cancel</a>
    </form>
</main>
</body>
</html>
