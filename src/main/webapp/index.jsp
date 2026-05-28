<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
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

<main class="container py-5">
    <div class="welcome-section text-center">
        <h1 class="mb-3">Library Management System</h1>
        <p class="lead mb-4">A simple Java web CRUD project using JSP, Servlets, JDBC, and MySQL.</p>
        <a href="books" class="btn btn-primary btn-lg me-2">View Books</a>
        <a href="books?action=new" class="btn btn-outline-primary btn-lg">Add Book</a>
    </div>
</main>
</body>
</html>
