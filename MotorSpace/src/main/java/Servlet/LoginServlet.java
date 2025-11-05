package Servlet;

import model.Utente;
import model.UtenteDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private final UtenteDAO utenteDAO = new UtenteDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Utente utente = null;
        if (username != null && password != null) {
            utente = utenteDAO.doRetrieveByUsernamePassword(username, password);
        }

        if (utente == null) {
            throw new MyServletException("Username e/o password non validi.");
        }

        request.getSession().setAttribute("utente", utente);
        response.sendRedirect("Home");
    }
}

