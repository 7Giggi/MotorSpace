package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MyServletException extends ServletException {

    private static final String DEFAULT_ERROR_MESSAGE = "Si è verificato un errore durante l'elaborazione della richiesta.";

    public MyServletException() {
        super(DEFAULT_ERROR_MESSAGE);
    }

    public MyServletException(String message) {
        super(sanitizeMessage(message));
    }

    public MyServletException(String message, Throwable rootCause) {
        super(sanitizeMessage(message), rootCause);
    }

    public MyServletException(Throwable rootCause) {
        super(DEFAULT_ERROR_MESSAGE, rootCause);
    }

    private static String sanitizeMessage(String message) {
        if (message == null || message.trim().isEmpty()) {
            return DEFAULT_ERROR_MESSAGE;
        }
        return message.replaceAll("[\\r\\n]", " ").trim();
    }

    public static void handle(HttpServletRequest request, HttpServletResponse response, Exception e) throws IOException {
        request.getSession().removeAttribute("utente"); 
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<html><body>");
        response.getWriter().println("<h2>Errore</h2>");
        response.getWriter().println("<p>" + sanitizeMessage(e.getMessage()) + "</p>");
        response.getWriter().println("<a href='Home'>Torna alla home</a>");
        response.getWriter().println("</body></html>");
    }
}

