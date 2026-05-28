package servlet;

import dao.BookDAO;
import model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/books")
public class BookServlet extends HttpServlet {
    private final BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "new":
                request.getRequestDispatcher("add-book.jsp").forward(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteBook(request, response);
                break;
            case "search":
                searchBooks(request, response);
                break;
            default:
                listBooks(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("insert".equals(action)) {
            addBook(request, response);
        } else if ("update".equals(action)) {
            updateBook(request, response);
        } else {
            response.sendRedirect("books");
        }
    }

    private void listBooks(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Book> books = bookDAO.getAllBooks();
        request.setAttribute("books", books);
        request.getRequestDispatcher("view-books.jsp").forward(request, response);
    }

    private void searchBooks(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        List<Book> books;

        if (keyword == null || keyword.trim().isEmpty()) {
            books = bookDAO.getAllBooks();
        } else {
            books = bookDAO.searchBooks(keyword.trim());
        }

        request.setAttribute("books", books);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("view-books.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Book existingBook = bookDAO.getBookById(id);

        if (existingBook == null) {
            request.getSession().setAttribute("errorMessage", "Book not found.");
            response.sendRedirect("books");
            return;
        }

        request.setAttribute("book", existingBook);
        request.getRequestDispatcher("update-book.jsp").forward(request, response);
    }

    private void addBook(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Book book = readBookFromRequest(request);
        boolean saved = bookDAO.addBook(book);

        if (saved) {
            request.getSession().setAttribute("successMessage", "Book added successfully.");
        } else {
            request.getSession().setAttribute("errorMessage", "Unable to add book. Please check the database connection.");
        }

        response.sendRedirect("books");
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Book book = readBookFromRequest(request);
        book.setId(id);

        boolean updated = bookDAO.updateBook(book);

        if (updated) {
            request.getSession().setAttribute("successMessage", "Book updated successfully.");
        } else {
            request.getSession().setAttribute("errorMessage", "Unable to update book.");
        }

        response.sendRedirect("books");
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        boolean deleted = bookDAO.deleteBook(id);

        if (deleted) {
            request.getSession().setAttribute("successMessage", "Book deleted successfully.");
        } else {
            request.getSession().setAttribute("errorMessage", "Unable to delete book.");
        }

        response.sendRedirect("books");
    }

    private Book readBookFromRequest(HttpServletRequest request) {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        return new Book(title, author, category, quantity);
    }
}
