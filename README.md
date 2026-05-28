# Library Management System

A beginner-friendly Java web CRUD project built with JSP, Servlets, JDBC, MySQL, Bootstrap, Maven, and Apache Tomcat.

## Interview Explanation

This is a Library Management System built using JSP, Servlets, JDBC, and MySQL. JSP handles the UI, Servlet acts as the controller, DAO handles SQL operations, Model represents book data, and DBConnection manages database connectivity. The project supports adding, viewing, updating, deleting, and searching books.

## Project Structure

```text
Library-Management-System/
├── database.sql
├── pom.xml
├── src/main/java/
│   ├── db/DBConnection.java
│   ├── model/Book.java
│   ├── dao/BookDAO.java
│   └── servlet/BookServlet.java
└── src/main/webapp/
    ├── index.jsp
    ├── add-book.jsp
    ├── view-books.jsp
    ├── update-book.jsp
    └── style.css
```

## Database Setup

1. Open MySQL Workbench or MySQL command line.
2. Run the SQL in `database.sql`.
3. Update the username and password in `src/main/java/db/DBConnection.java` if your MySQL password is not `root`.

```sql
CREATE DATABASE IF NOT EXISTS library_db;

USE library_db;

CREATE TABLE IF NOT EXISTS books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    quantity INT NOT NULL
);
```

## How To Run On Tomcat

1. Install JDK 11 or newer.
2. Install Apache Tomcat 9.
3. Import this folder into Eclipse or IntelliJ as a Maven project.
4. Run `mvn clean package`.
5. Deploy `target/Library-Management-System.war` to Tomcat.
6. Open `http://localhost:8080/Library-Management-System/`.

## What Each File Does

- `pom.xml`: Defines the Maven project, WAR packaging, and dependencies for Servlet, JSP, JSTL, and MySQL JDBC.
- `database.sql`: Creates the MySQL database and `books` table.
- `DBConnection.java`: Creates and returns a MySQL database connection.
- `Book.java`: Model class that represents one book record.
- `BookDAO.java`: Contains all SQL operations such as add, view, update, delete, and search.
- `BookServlet.java`: Controller that receives browser requests and decides which DAO method and JSP page to use.
- `index.jsp`: Home page with navigation.
- `add-book.jsp`: Form page for adding a new book.
- `view-books.jsp`: Displays all books and provides edit, delete, and search options.
- `update-book.jsp`: Form page for editing an existing book.
- `style.css`: Small custom CSS file used with Bootstrap.

## Suggested Git Commit Messages

1. `Initial Maven web project structure`
2. `Add MySQL database setup script`
3. `Add JDBC database connection class`
4. `Add Book model`
5. `Add BookDAO CRUD operations`
6. `Add BookServlet request handling`
7. `Add JSP pages for book CRUD`
8. `Add Bootstrap styling`
9. `Verify CRUD build with Maven`
10. `Add book search by title or author`
