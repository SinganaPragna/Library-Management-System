<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Library Management System</a>
        <div class="navbar-nav">
            <a class="nav-link active" href="books">View Books</a>
            <a class="nav-link" href="books?action=new">Add Book</a>
        </div>
    </div>
</nav>

<main class="container py-4">
    <div class="d-flex flex-wrap gap-2 justify-content-between align-items-center mb-3">
        <h2>Books</h2>
        <a href="books?action=new" class="btn btn-primary">Add New Book</a>
    </div>

    <c:if test="${not empty sessionScope.successMessage}">
        <div class="alert alert-success">${sessionScope.successMessage}</div>
        <c:remove var="successMessage" scope="session"/>
    </c:if>

    <c:if test="${not empty sessionScope.errorMessage}">
        <div class="alert alert-danger">${sessionScope.errorMessage}</div>
        <c:remove var="errorMessage" scope="session"/>
    </c:if>

    <form action="books" method="get" class="row g-2 mb-3">
        <input type="hidden" name="action" value="search">
        <div class="col-md-10">
            <input type="text" name="keyword" class="form-control" placeholder="Search by title or author" value="<c:out value='${keyword}'/>">
        </div>
        <div class="col-md-2 d-grid">
            <button type="submit" class="btn btn-outline-primary">Search</button>
        </div>
    </form>

    <div class="table-responsive">
        <table class="table table-bordered table-striped align-middle">
            <thead class="table-primary">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Category</th>
                <th>Quantity</th>
                <th class="text-center">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td><c:out value="${book.id}"/></td>
                    <td><c:out value="${book.title}"/></td>
                    <td><c:out value="${book.author}"/></td>
                    <td><c:out value="${book.category}"/></td>
                    <td><c:out value="${book.quantity}"/></td>
                    <td class="text-center">
                        <a href="books?action=edit&id=${book.id}" class="btn btn-sm btn-warning">Edit</a>
                        <a href="books?action=delete&id=${book.id}" class="btn btn-sm btn-danger"
                           onclick="return confirm('Are you sure you want to delete this book?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty books}">
                <tr>
                    <td colspan="6" class="text-center text-muted">No books found.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
