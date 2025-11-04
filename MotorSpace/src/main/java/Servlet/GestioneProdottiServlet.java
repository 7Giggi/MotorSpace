package Servlet;

import model.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/GestioneProdotti")
public class GestioneProdottiServlet extends HttpServlet {

    private final ProdottoDAO prodottoDAO = new ProdottoDAO();
    private final CategoriaDAO categoriaDAO = new CategoriaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Amministratore amministratore = (Amministratore) request.getSession().getAttribute("amministratore");
        if (amministratore == null) {
            throw new MyServletException("Utente non autorizzato");
        }

        List<Categoria> categorie = categoriaDAO.doRetrieveAll();
        Map<Categoria, List<Prodotto>> catalogo = new LinkedHashMap<>();

        for (Categoria c : categorie) {
            List<Prodotto> prodottiCategoria = prodottoDAO.doRetrieveByCategoria(c.getId(), ProdottoDAO.OrderBy.DEFAULT, 0, Integer.MAX_VALUE);
            catalogo.put(c, prodottiCategoria);
        }

        request.setAttribute("catalogo", catalogo);

        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/jsp/gestioneprodotti.jsp");
        rd.forward(request, response);
    }
}

