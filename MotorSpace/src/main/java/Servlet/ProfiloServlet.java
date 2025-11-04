package Servlet;

import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@WebServlet("/Profilo")
public class ProfiloServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher =
            request.getRequestDispatcher("/WEB-INF/jsp/profilo.jsp");
        dispatcher.forward(request, response);
    }
}
