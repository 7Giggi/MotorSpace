package Servlet;

import model.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/EliminaProdotto")
public class EliminaProdottoServlet extends HttpServlet {

    private final ProdottoDAO prodottoDAO = new ProdottoDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Amministratore amministratore = (Amministratore) request.getSession().getAttribute("amministratore");
        if (amministratore == null) {
            throw new MyServletException("Utente non autorizzato");
        }

        String idStr = request.getParameter("id");
        if (idStr == null || !idStr.matches("\\d+")) {
            throw new MyServletException("ID prodotto non valido.");
        }

        try {
            prodottoDAO.doDelete(idStr);
            request.getSession().setAttribute("notifica", "Prodotto eliminato con successo.");
        } catch (RuntimeException e) {
            request.getSession().setAttribute("notifica", "Errore durante l'eliminazione del prodotto.");
        }

        response.sendRedirect("GestioneProdotti");
    }
}

