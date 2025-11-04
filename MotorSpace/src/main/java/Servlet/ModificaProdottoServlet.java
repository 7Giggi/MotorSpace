package Servlet;

import model.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ModificaProdotto")
public class ModificaProdottoServlet extends HttpServlet {

    private final ProdottoDAO prodottoDAO = new ProdottoDAO();
    private final CategoriaDAO categoriaDAO = new CategoriaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Amministratore amministratore = (Amministratore) request.getSession().getAttribute("amministratore");
        if (amministratore == null) {
            throw new MyServletException("Utente non autorizzato");
        }

        String idStr = request.getParameter("id");
        if (idStr == null || !idStr.matches("\\d+")) {
            throw new MyServletException("ID non valido.");
        }

        int id = Integer.parseInt(idStr);
        Prodotto prodotto = prodottoDAO.doRetrieveById(id);
        if (prodotto == null) {
            throw new MyServletException("Prodotto non trovato.");
        }

        List<Categoria> categorie = categoriaDAO.doRetrieveAll();
        request.setAttribute("categorie", categorie);
        request.setAttribute("prodotto", prodotto);

        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/jsp/modificaprodotto.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        Amministratore amministratore = (Amministratore) request.getSession().getAttribute("amministratore");
        if (amministratore == null) {
            throw new MyServletException("Utente non autorizzato");
        }

        String idStr = request.getParameter("idStr");
        if (idStr == null || !idStr.matches("\\d+")) {
            throw new MyServletException("ID non valido.");
        }

        String nome = request.getParameter("nome");
        if (nome == null || nome.trim().isEmpty()) {
            throw new MyServletException("Nome non valido.");
        }

        String descrizione = request.getParameter("descrizione");
        if (descrizione == null || descrizione.trim().isEmpty()) {
            throw new MyServletException("Descrizione non valida.");
        }

        String marca = request.getParameter("marca");
        if (marca == null || marca.trim().isEmpty()) {
            throw new MyServletException("Marca non valida.");
        }

        String prezzo = request.getParameter("prezzo");
        if (prezzo == null || !prezzo.matches("^\\d{1,6}(\\.\\d{1,2})?$")) {
            throw new MyServletException("Prezzo non valido.");
        }

        String categoria = request.getParameter("addCategoria");
        if (categoria == null || !categoria.matches("\\d+")) {
            throw new MyServletException("Categoria non valida.");
        }

        int idCategoria = Integer.parseInt(categoria);

        Prodotto prodotto = new Prodotto();
        prodotto.setId(Integer.parseInt(idStr));
        prodotto.setNome(nome);
        prodotto.setDescrizione(descrizione);
        prodotto.setMarca(marca);
        prodotto.setPrezzo(Float.parseFloat(prezzo));
        prodotto.setCategoria(categoria);

        prodottoDAO.doUpdate(prodotto, idCategoria);

        request.setAttribute("notifica", "Prodotto modificato con successo");
        List<Categoria> categorie = categoriaDAO.doRetrieveAll();
        request.setAttribute("categorie", categorie);
        request.setAttribute("prodotto", prodotto);

        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/jsp/modificaprodotto.jsp");
        rd.forward(request, response);
    }
}




