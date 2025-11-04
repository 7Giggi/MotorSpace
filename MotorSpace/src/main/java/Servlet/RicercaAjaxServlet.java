package Servlet;

import model.Prodotto;
import model.ProdottoDAO;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/RicercaServlet")
public class RicercaAjaxServlet extends HttpServlet {

    private final ProdottoDAO prodottoDAO = new ProdottoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("application/json; charset=UTF-8");


        // Prende il parametro della query
        String query = request.getParameter("q");
        if (query == null || query.trim().isEmpty()) {
            response.getWriter().write("[]");
            return;
        }

        // Recupera i prodotti dal database (max 10)
        List<Prodotto> prodotti = prodottoDAO.doRetrieveByNome(query, 0, 10);

        // Converte in JSON
        JSONArray prodJson = new JSONArray();
        for (Prodotto p : prodotti) {
            JSONObject obj = new JSONObject();
            obj.put("id", p.getId());
            obj.put("nome", p.getNome());
            obj.put("prezzo", p.getPrezzo());
            prodJson.put(obj);
        }

        // Restituisce l’array JSON
        response.getWriter().write(prodJson.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

