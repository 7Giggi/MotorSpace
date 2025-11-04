package Servlet;

import model.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.sql.Date;
import java.util.*;

@WebServlet("/GestioneOrdini")
public class GestioneOrdiniServlet extends HttpServlet {

    private final OrdineDAO ordineDAO = new OrdineDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Amministratore admin = (Amministratore) request.getSession().getAttribute("amministratore");
        if (admin == null) {
            throw new MyServletException("Utente non autorizzato");
        }

        String username = request.getParameter("cliente");
        String dataInizioStr = request.getParameter("dataInizio");
        String dataFineStr = request.getParameter("dataFine");

        List<Ordine> ordiniFiltrati = new ArrayList<>();

        try (Connection con = ConPool.getConnection()) {
            StringBuilder query = new StringBuilder("SELECT id_ordine, cliente, dataordine, dataspedizione, dataconsegna FROM ordine WHERE 1=1");
            List<Object> params = new ArrayList<>();

            if (username != null && !username.trim().isEmpty()) {
                query.append(" AND cliente LIKE ?");
                params.add("%" + username.trim() + "%");
            }

            if (dataInizioStr != null && !dataInizioStr.isEmpty()) {
                query.append(" AND dataordine >= ?");
                params.add(Date.valueOf(dataInizioStr));
            }

            if (dataFineStr != null && !dataFineStr.isEmpty()) {
                query.append(" AND dataordine <= ?");
                params.add(Date.valueOf(dataFineStr));
            }

            query.append(" ORDER BY dataordine DESC");

            PreparedStatement ps = con.prepareStatement(query.toString());

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ordine o = new Ordine();
                o.setId(rs.getInt(1));
                o.setCliente(rs.getString(2));
                o.setDataOrdine(rs.getDate(3));
                o.setDataSpedizione(rs.getDate(4));
                o.setDataConsegna(rs.getDate(5));
                ordiniFiltrati.add(o);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("ordini", ordiniFiltrati);
        request.setAttribute("clienteFiltro", username);
        request.setAttribute("dataInizioFiltro", dataInizioStr);
        request.setAttribute("dataFineFiltro", dataFineStr);

        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/jsp/gestioneordini.jsp");
        rd.forward(request, response);
    }
}

