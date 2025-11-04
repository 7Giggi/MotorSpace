<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="HeaderAmministratore.jsp">
    <jsp:param name="pageTitle" value="Gestione Ordini"/>
</jsp:include>

<section style="padding: 20px; width: 90%; margin: 0 auto;">
    <h1>Gestione Ordini</h1>
    <h4>Filtra per cliente o intervallo di date</h4>

    <form action="GestioneOrdini" method="get" style="margin-bottom: 30px;">
        <label>Cliente (username):</label>
        <input type="text" name="cliente" value="${clienteFiltro}" style="margin-right: 20px;">

        <label>Da:</label>
        <input type="date" name="dataInizio" value="${dataInizioFiltro}" style="margin-right: 20px;">

        <label>A:</label>
        <input type="date" name="dataFine" value="${dataFineFiltro}" style="margin-right: 20px;">

        <input type="submit" value="Filtra">
        <a href="GestioneOrdini" style="margin-left: 10px;">Reset</a>
    </form>

    <c:choose>
        <c:when test="${not empty ordini}">
            <table border="1" cellpadding="8" cellspacing="0" style="width:100%; border-collapse:collapse;">
                <thead style="background-color:#efefef;">
                    <tr>
                        <th>ID Ordine</th>
                        <th>Cliente</th>
                        <th>Data Ordine</th>
                        <th>Data Spedizione</th>
                        <th>Data Consegna</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ordine" items="${ordini}">
                        <tr>
                            <td>${ordine.id}</td>
                            <td>${ordine.cliente}</td>
							<td><fmt:formatDate value="${ordine.dataOrdine}" pattern="dd/MM/yyyy"/></td>
							<td><fmt:formatDate value="${ordine.dataSpedizione}" pattern="dd/MM/yyyy"/></td>
							<td><fmt:formatDate value="${ordine.dataConsegna}" pattern="dd/MM/yyyy"/></td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>Nessun ordine trovato.</p>
        </c:otherwise>
    </c:choose>
</section>

<%@ include file="../footer.html" %>
