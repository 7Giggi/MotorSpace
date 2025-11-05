<%@ page import="java.util.List" %>
<%@ page import="model.Categoria" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="it">
<head>
    <title>MotorSpace Admin - ${param.pageTitle}</title>
    <meta charset="utf-8">
    <meta name="description" content="MotorSpace amministrazione">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>

    <link rel="stylesheet" href="css/bare.min.css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/header.css" type="text/css">
    <script src="${pageContext.request.contextPath}/scripts/ricercaAjax.js" defer></script>
</head>

<body>
<nav>
  <div class="navbar">
    <a class="brand" href="HomeAmministratore" aria-label="Home amministratore">
      <img src="img/logo.png" alt="MotorSpace Admin">
    </a>

    <button id="navToggle" class="toggle" aria-controls="navMenu" aria-expanded="false">☰</button>

    <ul id="navMenu" class="menu">

      <!-- Categorie 
      <li>
        <button class="caret" type="button">Vestiario</button>
        <ul class="dropdown">
          <c:forEach items="${categorie1}" var="c1">
            <li><a href="Categoria?id=<c:out value='${c1.id}'/>"><c:out value='${c1.nome}'/></a></li>
          </c:forEach>
        </ul>
      </li>

      <li>
        <button class="caret" type="button">Parti di Ricambio</button>
        <ul class="dropdown">
          <c:forEach items="${categorie2}" var="c2">
            <li><a href="CategoriaParti?id=<c:out value='${c2.id}'/>"><c:out value='${c2.nome}'/></a></li>
          </c:forEach>
        </ul>
      </li>

      <li>
        <button class="caret" type="button">Accessori Moto</button>
        <ul class="dropdown">
          <c:forEach items="${categorie3}" var="c3">
            <li><a href="CategoriaAccessori?id=<c:out value='${c3.id}'/>"><c:out value='${c3.nome}'/></a></li>
          </c:forEach>
        </ul>
      </li>
-->
      <!-- Gestione amministrativa -->
      <c:if test="${amministratore != null}">
        <li>
          <button class="caret" type="button">Gestione Prodotti</button>
          <ul class="dropdown">
            <li><a href="AggiuntaProdotto">Aggiungi Prodotto</a></li>
            <li><a href="GestioneProdotti">Modifica / Elimina Prodotti</a></li>
          </ul>
        </li>

        <li>
          <button class="caret" type="button">Gestione Ordini</button>
          <ul class="dropdown">
            <li><a href="GestioneOrdini">Visualizza Ordini</a></li>
          </ul>
        </li>
      </c:if>

      <!-- Login / Logout -->
      <li>
        <button class="caret" type="button">
          <img src="img/logoLogin_2_2.png" alt="Login">
        </button>
        <ul class="dropdown">
          <c:choose>
            <c:when test="${amministratore == null}">
              <li>
                <div style="padding:12px">
                  <form action="LoginAmministratoreServlet" method="post">
                    <input type="text" name="username" placeholder="Admin" value="admin"
                           style="width:100%;margin-bottom:8px;padding:8px;border-radius:4px;border:1px solid #333">
                    <input type="password" name="password" placeholder="Password" value="admin"
                           style="width:100%;margin-bottom:8px;padding:8px;border-radius:4px;border:1px solid #333">
                    <input type="number" name="codice" placeholder="Codice" value="111"
                           style="width:100%;margin-bottom:8px;padding:8px;border-radius:4px;border:1px solid #333">
                    <input type="submit" value="Login"
                           style="width:100%;padding:8px;border:0;border-radius:4px;background:var(--accent);color:#fff">
                  </form>
                </div>
              </li>
            </c:when>
            <c:otherwise>
              <li>
                <div style="padding:4px 12px">
                  <form action="${pageContext.request.contextPath}/Logout" method="get">
                    <input type="submit" value="Logout"
                           style="width:100%;padding:8px;border:0;border-radius:4px;background:var(--accent);color:#fff">
                  </form>
                </div>
              </li>
            </c:otherwise>
          </c:choose>
          <!-- Sempre visibile -->
          <li><a href="${pageContext.request.contextPath}/Home">↩ Torna al sito utente</a></li>
        </ul>
      </li>

      <!-- Ricerca -->
      <li class="search">
        <input type="text" id="searchInput" placeholder="Cerca prodotti..." autocomplete="off">
        <div id="searchResults"></div>
      </li>

    </ul>
  </div>
</nav>

<script>
  const navToggle=document.getElementById('navToggle');
  const navMenu=document.getElementById('navMenu');
  navToggle.addEventListener('click',function(){
    const isOpen=navMenu.classList.toggle('show');
    navToggle.setAttribute('aria-expanded',isOpen?'true':'false');
  });

  function isMobile(){return window.matchMedia('(max-width: 991.98px)').matches}

  function closeOthers(current){
    document.querySelectorAll('#navMenu .caret').forEach(btn=>{
      if(btn!==current){btn.classList.remove('open')}
    });
    document.querySelectorAll('#navMenu .dropdown').forEach(dd=>{
      if(!dd.contains(current)){dd.classList.remove('show')}
    });
  }

  document.querySelectorAll('#navMenu .caret').forEach(btn=>{
    btn.addEventListener('click',function(e){
      if(isMobile()){
        e.preventDefault();
        const dd=this.nextElementSibling;
        const willOpen=!dd.classList.contains('show');
        closeOthers(this);
        if(willOpen){this.classList.add('open');dd.classList.add('show')}
        else{this.classList.remove('open');dd.classList.remove('show')}
      }
    });
  });

  window.addEventListener('resize',function(){
    if(!isMobile()){
      navMenu.classList.remove('show');
      document.querySelectorAll('#navMenu .dropdown').forEach(dd=>dd.classList.remove('show'));
      document.querySelectorAll('#navMenu .caret').forEach(btn=>btn.classList.remove('open'));
      navToggle.setAttribute('aria-expanded','false');
    }
  });
</script>
</body>
</html>







