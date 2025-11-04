
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="Header.jsp">
    <jsp:param name="pageTitle" value="Ordine"/>
</jsp:include>
<section>
    <grid>
        <h1>Ordine N."${id}"</h1>

        <c:forEach items="${prodottiOrdine}" var="ordine">
            <div col="1/3">
                <a href="Prodotto?id=${ordine.prodotto.id}"><img src="img/prodotto${ordine.prodotto.id}.jpg"></a>
            </div>
            <div col="2/3">
                <h3>
                    <a href="Prodotto?id=${ordine.id}">${ordine.prodotto.nome}</a>
                </h3>
                <p>${ordine.prodotto.descrizione}</p>
                <h5>Prezzo Unit:${ordine.prodotto.prezzo}€</h5>
            </div>
        </c:forEach>
    </grid>
</section>

<%@include file="../footer.html"%>