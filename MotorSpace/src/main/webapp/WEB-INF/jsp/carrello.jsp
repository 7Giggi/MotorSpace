<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="Header.jsp">
    <jsp:param name="pageTitle" value="Carrello"/>
</jsp:include>

<section>
    <h1>Carrello</h1>
    <grid>
        <c:forEach items="${carrello.prodotti}" var="pq">
            <div col="1/3">
                <a href="Prodotto?id=${pq.prodotto.id}">
                    <img src="img/prodotto${pq.prodotto.id}.jpg">
                </a>
            </div>
            <div col="2/3">
                <h3>
                    <a href="Prodotto?id=${pq.prodotto.id}">
                        ${pq.prodotto.nome}
                    </a>
                </h3>
                <p>${pq.prodotto.descrizione}</p>

                <h5>
                    Prezzo Unitario: ${pq.prodotto.prezzo}€<br>
                    Totale: ${pq.prezzoTot}€
                </h5>

                <!-- Modifica quantità -->
                <form action="Carrello" method="post" style="margin-bottom:10px;">
                    <input type="hidden" name="prodId" value="${pq.prodotto.id}">
                    <label for="quantita${pq.prodotto.id}">Quantità:</label>
                    <input type="number" id="quantita${pq.prodotto.id}" name="setNum"
                           value="${pq.quantità}" min="1" style="width:60px;">
                    <input type="submit" value="Aggiorna quantità">
                </form>

                <!-- Rimuovi prodotto -->
                <form action="Carrello" method="post">
                    <input type="hidden" name="prodId" value="${pq.prodotto.id}">
                    <input type="hidden" name="setNum" value="0">
                    <input type="submit" value="Rimuovi">
                </form>
            </div>
        </c:forEach>

        <c:if test="${empty carrello.prodotti}">
            <div col="1">Nessun prodotto nel carrello</div>
        </c:if>
    </grid>
</section>

<!-- Totale e pulsanti -->
<c:if test="${not empty carrello.prodotti}">
<section>
    <grid>
        <div col="1/3">
            <h2>Totale: ${carrello.prezzoTot}€</h2>
        </div>

        <div col="1/3">
            <form action="Passo2PagamentoServlet" method="post">
                <input type="submit" value="Completa acquisto">
            </form>
        </div>

        <div col="1/3">
            <form action="Carrello" method="post">
                <input type="hidden" name="clear" value="true">
                <input type="submit" value="Svuota carrello">
            </form>
        </div>
    </grid>
</section>
</c:if>

<%@include file="../footer.html"%>
