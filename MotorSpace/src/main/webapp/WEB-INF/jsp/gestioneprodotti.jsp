<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="HeaderAmministratore.jsp">
    <jsp:param name="pageTitle" value="Gestione Prodotti"/>
</jsp:include>

<section>
    <h1>Gestione Prodotti</h1>
    <h4>Seleziona un prodotto per modificarlo o eliminarlo</h4>

    <c:forEach var="entry" items="${catalogo}">
        <div style="margin-top: 40px;">
            <h2 style="border-bottom: 2px solid #444; padding-bottom: 5px;">
                ${entry.key.nome}
            </h2>

            <c:choose>
                <c:when test="${not empty entry.value}">
                    <div style="display: flex; flex-wrap: wrap; gap: 20px;">
                        <c:forEach var="prodotto" items="${entry.value}">
                            <div style="border: 1px solid #ccc; padding: 10px; width: 250px; border-radius: 10px;">
                                <img src="img/prodotto${prodotto.id}.jpg" alt="${prodotto.nome}" style="width:100%; height:180px; object-fit:cover;">
                                <h3>${prodotto.nome}</h3>
                                <p><strong>Marca:</strong> ${prodotto.marca}</p>
                                <p><strong>Prezzo:</strong> ${prodotto.prezzo} &euro;</p>

                                <div style="display: flex; justify-content: space-between;">
                                    <form action="ModificaProdotto" method="get">
                                        <input type="hidden" name="id" value="${prodotto.id}">
                                        <input type="submit" value="Modifica">
                                    </form>

                                    <form action="EliminaProdotto" method="post" onsubmit="return confirm('Sei sicuro di voler eliminare questo prodotto?');">
                                        <input type="hidden" name="id" value="${prodotto.id}">
                                        <input type="submit" value="Elimina" style="background-color:#d33; color:white;">
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <p>Nessun prodotto in questa categoria.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </c:forEach>
</section>

<%@ include file="../footer.html" %>
