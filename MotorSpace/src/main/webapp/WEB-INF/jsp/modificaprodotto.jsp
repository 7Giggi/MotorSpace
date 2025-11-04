<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="HeaderAmministratore.jsp">
    <jsp:param name="pageTitle" value="Modifica Prodotto"/>
</jsp:include>

<script src="${pageContext.request.contextPath}/scripts/validazione-prodotto-modifica.js"></script>

<section>
    <h1>Modifica prodotto</h1>
    <h5 style="color:green;">${notifica}</h5>

    <form action="ModificaProdotto" method="post" onsubmit="return validaProdottoModifica()">
        <input type="hidden" name="idStr" value="${prodotto.id}">

        <p><strong>ID prodotto:</strong> ${prodotto.id}</p>

        <label>Nome</label>
        <input type="text" name="nome" id="nome" value="${prodotto.nome}" placeholder="Modifica nome">
        <span id="errore-nome" class="errore"></span>
        <br>

        <label>Descrizione</label>
        <textarea name="descrizione" id="descrizione" placeholder="Modifica descrizione">${prodotto.descrizione}</textarea>
        <span id="errore-descrizione" class="errore"></span>
        <br>

        <label>Marca</label>
        <input type="text" name="marca" id="marca" value="${prodotto.marca}" placeholder="Modifica marca">
        <span id="errore-marca" class="errore"></span>
        <br>

        <label>Prezzo (€)</label>
        <input type="number" name="prezzo" id="prezzo" step="0.01" value="${prodotto.prezzo}" placeholder="Modifica prezzo">
        <span id="errore-prezzo" class="errore"></span>
        <br>

        <label>Categoria</label>
        <select name="addCategoria" id="addCategoria">
            <c:forEach items="${categorie}" var="categoria">
                <option value="${categoria.id}" <c:if test="${categoria.id == prodotto.categoria}">selected</c:if>>
                    ${categoria.nome}
                </option>
            </c:forEach>
        </select>
        <span id="errore-categoria" class="errore"></span>
        <br><br>

        <input type="submit" value="Salva modifiche">
    </form>
</section>

<style>
    section {
        width: 60%;
        margin: 0 auto;
        padding: 20px;
    }
    label {
        display: block;
        margin-top: 10px;
        font-weight: bold;
    }
    input, textarea, select {
        width: 100%;
        padding: 6px;
        margin-bottom: 5px;
    }
    .errore {
        color: red;
        font-size: 0.9em;
    }
</style>

<%@ include file="../footer.html" %>

