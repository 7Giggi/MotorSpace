<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="Header.jsp">
    <jsp:param name="pageTitle" value="Registrazione utente"/>
</jsp:include>
<script src="${pageContext.request.contextPath}/scripts/validazione-registrazione.js"></script>

<section>
    <h1>Registrazione utente</h1>
    <h5>Riempi tutti i campi</h5>

    <form id="formRegistrazione" action="Registrazione" method="get">
        <label>Username (almeno 6 caratteri, solo lettere e numeri, non utilizzato da altri utenti)</label>
        <input type="text" id="username" name="username" required>

        <label>Password (almeno 8 caratteri, deve contenere: una lettera maiuscola, una minuscola e un numero)</label>
        <input type="password" id="password" name="password" required>

        <label>Password conferma</label>
        <input type="password" id="passwordConferma" name="passwordConferma" required>

        <label>Nome (solo lettere)</label>
        <input type="text" id="nome" name="nome" required>

        <label>Cognome (solo lettere)</label>
        <input type="text" id="cognome" name="cognome" required>

        <label>Email</label>
        <input type="email" id="email" name="email" required>

        <input id="registrami" type="submit" value="Registrami">
        <span id="registramimessaggio"></span>
    </form>
</section>



<%@ include file="../footer.html"%>