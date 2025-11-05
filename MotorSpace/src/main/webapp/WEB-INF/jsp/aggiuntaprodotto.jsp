<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="HeaderAmministratore.jsp">
    <jsp:param name="pageTitle" value="Aggiungi Prodotto"/>
</jsp:include>

<script src="${pageContext.request.contextPath}/scripts/validazione-prodotto.js"></script>

<section>
    <h1>Aggiungi un nuovo prodotto</h1>
    <h5 style="color:green;">${notifica}</h5>

    <form action="AggiuntaProdotto" method="post"  onsubmit="return validaProdotto()">
        <label>Nome</label>
        <input type="text" name="nome" id="nome" placeholder="Inserisci il nome del prodotto">
        <span id="errore-nome" class="errore"></span>
        <br>

        <label>Descrizione</label>
        <textarea name="descrizione" id="descrizione" placeholder="Inserisci la descrizione"></textarea>
        <span id="errore-descrizione" class="errore"></span>
        <br>

        <label>Marca</label>
        <input type="text" name="marca" id="marca" placeholder="Inserisci la marca">
        <span id="errore-marca" class="errore"></span>
        <br>

        <label>Prezzo (€)</label>
        <input type="number" name="prezzo" id="prezzo" step="0.01" placeholder="Inserisci il prezzo">
        <span id="errore-prezzo" class="errore"></span>
        <br>

        <label>Categoria</label>
        <select name="addCategoria" id="addCategoria">
            <option value="">-- Seleziona una categoria --</option>
            <c:forEach items="${categorie}" var="categoria">
                <option value="${categoria.id}">${categoria.nome}</option>
            </c:forEach>
        </select>
        <span id="errore-categoria" class="errore"></span>
        <br>

        <!-- Campo opzionale per immagine
        <label>Immagine del prodotto (opzionale)</label>
        <input type="file" name="immagine" id="immagine" accept="image/*">
        <span id="errore-immagine" class="errore"></span>
        <br><br>
-->
        <input type="submit" value="Aggiungi prodotto">
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

