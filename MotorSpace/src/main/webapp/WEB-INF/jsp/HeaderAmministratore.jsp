<%@ page import="java.util.List" %>
<%@ page import="model.Categoria" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype HTML>
<html lang="en">
<head>
    <title>MotorSpace - ${param.pageTitle}</title>
    <meta charset="utf-8">
    <meta name="description" content="BareCSS template file">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link href="css/bare.min.css" rel="stylesheet" type="text/css">
     <link href="css/style.css" rel="stylesheet" type="text/css">
    
    <script src="Ricerca.js"></script>
</head>
<body>
<nav>
    <label>
        <ul>
             <div style="text-align: center;">
  				<a href="HomeAmministratore"><img src="img/logo.png" style="height: 80px;"></a>
			</div>

            <li>
                <a>Vestiario</a>
                <menu>
                    <c:forEach items="${categorie1}" var="categorie1">
                        <menuitem>
                            <a href="Categoria?id=<c:out value='${categorie1.id}'/>">
                                <c:out value="${categorie1.nome}" />
                            </a>
                        </menuitem>
                    </c:forEach>
                </menu>
            </li>

            <li>
                <a>Parti Di Ricambio</a>
                <menu>
                    <c:forEach items="${categorie2}" var="categorie2">
                        <menuitem>
                            <a href="CategoriaParti?id=<c:out value='${categorie2.id}'/>">
                                <c:out value="${categorie2.nome}" />
                            </a>
                        </menuitem>
                    </c:forEach>
                </menu>
            </li>

            <li>
                <a>Accessori Moto</a>
                <menu>
                    <c:forEach items="${categorie3}" var="categorie3">
                        <menuitem>
                            <a href="CategoriaAccessori?id=<c:out value='${categorie3.id}'/>">
                                <c:out value="${categorie3.nome}" />
                            </a>
                        </menuitem>
                    </c:forEach>
                </menu>
            </li>


            <!-- Sezione esclusiva per amministratore -->
            <c:if test="${amministratore != null}">
                <li>
                    <a>Gestione Prodotti</a>
                    <menu>
                        <menuitem><a href="AggiuntaProdotto">Aggiungi Prodotto</a></menuitem>
                        <menuitem><a href="GestioneProdotti">Modifica / Elimina Prodotti</a></menuitem>
                    </menu>
                </li>

                <li>
                    <a>Gestione Ordini</a>
                    <menu>
                        <menuitem><a href="GestioneOrdini">Visualizza Ordini</a></menuitem>
                    </menu>
                </li>
            </c:if>

            <!-- Login / Logout -->
            <li>
                <c:choose>
                    <c:when test="${amministratore == null}">
                        <a><img src="img/logoLogin_2_2.png"></a>
                        <menu>
                            <menuitem>
                                <card>
                                    <form action="LoginAmministratoreServlet" method="post">
                                        <input type="text" name="username" value="admin"><br>
                                        <input type="password" name="password" value="admin"><br>
                                        <input type="number" name="codice" value="111"><br>
                                        <input type="submit" value="Login">
                                    </form>
                                </card>
                            </menuitem>
                            <menuitem>
                                <a href="Home">Non sei amministratore? Torna al login utente</a>
                            </menuitem>
                        </menu>
                    </c:when>

                    <c:otherwise>
                        <a><img src="img/logoLogin_2_2.png"></a>
                        <menu>
                            <menuitem>
                                <card>
                                    <form action="Logout">
                                        <input type="submit" value="Logout">
                                    </form>
                                </card>
                            </menuitem>
                        </menu>
                    </c:otherwise>
                </c:choose>
            </li>

            <!-- RICERCA -->
            <li>
                <form action="RicercaServlet" method="get">
                    <input type="text" name="q" ricerca="ricerca-datalist"
                           placeholder="Ricerca" onkeyup="ricerca(this.value)"
                           value="<c:out value='${param.q}'/>">
                    <datalist id="ricerca-datalist"></datalist>
                </form>
            </li>
        </ul>
    </label>
</nav>


