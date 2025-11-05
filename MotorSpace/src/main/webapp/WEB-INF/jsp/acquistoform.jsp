<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<body>
<jsp:include page="Header.jsp">
    <jsp:param name="pageTitle" value="Acquisto"/>
</jsp:include>
<section>
    <form action="Pagamento" method="post">
        <br>
        <label>Nome</label>
        <input type="text" name="nome" value="${utente.nome}" readonly>
        <label>Cognome</label>
        <input type="text" name ="cognome" value="${utente.cognome}"readonly>
        <label>Email</label>
        <input type="text" name="email" value="${utente.email}"readonly>
        <label>Provincia</label>
        <select name="provincia" required>
            <option value="">-- Seleziona --</option>
            <option value="SA">SA</option>
            <option value="NA">NA</option>
            <option value="CE">CE</option>
            <option value="AV">AV</option>
            <option value="BN">BN</option>
        </select>
        <label>Città</label>
        <input type="text" name="città" placeholder="Inserire la città">
        <label>Cap</label>
        <input type="text" name="cap" placeholder="Inserire il cap">
        <label>Indirizzo</label>
        <input type="text" name="indirizzo" placeholder="Inserire l'indirizzo">
        <label>Numero Carta</label>
        <input type="text" name="Numero" placeholder="Inserire numero carta">
        <label>CVV</label>
        <input type="text" name ="cvv" placeholder= "CVV">
        <label>Data di scadenza carta</label>
        <input type="text" name="dataScadenza" placeholder= "GG/MM/AAAA">
        <label>Nome intestatario carta</label>
        <input type="text" name="nome" placeholder="Nome e cognome intestatario carta">
        <label></label>
        <c:choose>
            <c:when test="${utente != null}">
        <input type="submit" value="Avanti">
            </c:when>
            <c:otherwise>
                <label> Effettua l'accesso per completare l'acquisto</label>
            </c:otherwise>
        </c:choose>
    </form>
</section>
</body>
<%@include file="../footer.html"%>