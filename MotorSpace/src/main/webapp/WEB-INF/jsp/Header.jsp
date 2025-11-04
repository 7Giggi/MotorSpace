<%@ page import="java.util.List" %>
<%@ page import="model.Categoria" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype HTML>
<html lang="en">
<head>
    <title>MotorSpace - ${param.pageTitle}</title>

    <meta charset=utf-8>
    <meta name="description" content="BareCSS template file">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>

	<link rel="stylesheet" href="css/bare.min.css">
    <link href="css/style.css" rel="stylesheet" type="text/css">

<script src="${pageContext.request.contextPath}/scripts/ricercaAjax.js" defer></script>
</head>
<body>
<nav>
    <label>
        <ul>
            <div style="text-align: center;">
  <a href="Home"><img src="img/logo.png" style="height: 80px;"></a>
</div>


            <!-- Categorie -->
            <li>
                <a>Vestiario</a>
                <menu>
                    <c:forEach items="${categorie1}" var="categorie1">
                        <menuitem>
                            <a href="Categoria?id=<c:out value='${categorie1.id}'/>">
                                <c:out value='${categorie1.nome}'/>
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
                                <c:out value='${categorie2.nome}'/>
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
                                <c:out value='${categorie3.nome}'/>
                            </a>
                        </menuitem>
                    </c:forEach>
                </menu>
            </li>

            <!-- Login / Profilo -->
            <li>
                <c:choose>
                    <c:when test="${utente == null}">
                        <a><img src="img/logoLogin_2_2.png"></a>
                        <menu>
                            <menuitem>
                                <card>
                                    <form action="LoginServlet" method="post">
                                        <input type="text" name="username" value="Spaghettino"><br>
                                        <input type="password" name="password" value="Ciaone55"><br>
                                        <input type="submit" value="Login">
                                    </form>
                                </card>
                            </menuitem>
                            <menuitem><a href="RegistrazioneForm">Registrazione</a></menuitem>
                            <menuitem><a href="HomeAmministratore?id=home">Accedi come amministratore</a></menuitem>
                        </menu>
                    </c:when>

                    <c:otherwise>
                        <a><img src="img/logoLogin_2_2.png"></a>
                        <menu>
                            <menuitem><a href="Profilo">Profilo</a></menuitem>
                            <menuitem><a href="VisualizzaOrdini">I miei ordini</a></menuitem>
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

            <!-- Carrello -->
            <li><a href="Carrello"><img src="img/carrello_rosso.png"></a></li>

            <!-- 🔍 Barra di ricerca AJAX -->
            <li style="position: relative;">
                <input type="text" id="searchInput" placeholder="Cerca prodotti..." autocomplete="off" 
                       style="padding:5px; border-radius:4px; border:none;">
                <div id="searchResults"
                     style="position:absolute; top:100%; left:0; right:0; background:#222; 
                            color:white; z-index:1000; display:none; border:1px solid #444;">
                </div>
            </li>
        </ul>
    </label>
</nav>


