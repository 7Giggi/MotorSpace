<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>

<jsp:include page="Header.jsp">
    <jsp:param name="pageTitle" value="Errore"/>
</jsp:include>

<section style="text-align: center; padding: 40px;">
    <h1>Si è verificato un errore</h1>
    <p>Spiacenti, si è verificato un problema durante l'elaborazione della richiesta.</p>
    <p>Ti invitiamo a tornare alla <a href="Home">home page</a> o a riprovare più tardi.</p>

    <%
        // Mostra il messaggio solo se è sicuro e non contiene informazioni tecniche
        if (exception != null) {
            String msg = exception.getMessage();
            if (msg != null && msg.matches("^[a-zA-Z0-9àèéìòùÁÉÍÓÚçÇñÑ, .!?'\"()-]+$")) {
    %>
                <p><strong>Dettaglio:</strong> <%= msg %></p>
    <%
            }
        }
    %>
</section>

<%@ include file="../footer.html" %>