<%@ page import="java.util.List" %>
<%@ page import="model.Categoria" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
    <title>MotorSpace - ${param.pageTitle}</title>
    <meta charset="utf-8">
    <meta name="description" content="BareCSS template file">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="css/bare.min.css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/header.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/scripts/ricercaAjax.js" defer></script>
</head>

<body>
<nav>
  <div class="navbar">
    <a class="brand" href="Home" aria-label="Home">
      <img src="img/logo.png" alt="MotorSpace">
    </a>

    <button id="navToggle" class="toggle" aria-controls="navMenu" aria-expanded="false">☰</button>

    <ul id="navMenu" class="menu">

      <li>
        <button class="caret" type="button">Vestiario</button>
        <ul class="dropdown">
          <c:forEach items="${categorie1}" var="categorie1">
            <li><a href="Categoria?id=<c:out value='${categorie1.id}'/>"><c:out value='${categorie1.nome}'/></a></li>
          </c:forEach>
        </ul>
      </li>

      <li>
        <button class="caret" type="button">Parti Di Ricambio</button>
        <ul class="dropdown">
          <c:forEach items="${categorie2}" var="categorie2">
            <li><a href="CategoriaParti?id=<c:out value='${categorie2.id}'/>"><c:out value='${categorie2.nome}'/></a></li>
          </c:forEach>
        </ul>
      </li>

      <li>
        <button class="caret" type="button">Accessori Moto</button>
        <ul class="dropdown">
          <c:forEach items="${categorie3}" var="categorie3">
            <li><a href="CategoriaAccessori?id=<c:out value='${categorie3.id}'/>"><c:out value='${categorie3.nome}'/></a></li>
          </c:forEach>
        </ul>
      </li>

      <li>
        <button class="caret" type="button">
          <img src="img/logoLogin_2_2.png" alt="Login">
        </button>
        <ul class="dropdown">
          <c:choose>
            <c:when test="${utente == null}">
              <li>
                <div style="padding:12px">
                  <form action="LoginServlet" method="post">
                    <input type="text" name="username" placeholder="Username" style="width:100%;margin-bottom:8px;padding:8px;border-radius:4px;border:1px solid #333">
                    <input type="password" name="password" placeholder="Password" style="width:100%;margin-bottom:8px;padding:8px;border-radius:4px;border:1px solid #333">
                    <input type="submit" value="Login" style="width:100%;padding:8px;border:0;border-radius:4px;background:var(--accent);color:#fff">
                  </form>
                </div>
              </li>
              <li><a href="RegistrazioneForm">Registrazione</a></li>
              <li><a href="HomeAmministratore?id=home">Accedi come amministratore</a></li>
            </c:when>
            <c:otherwise>
              <li><a href="Profilo">Profilo</a></li>
              <li><a href="VisualizzaOrdini">I miei ordini</a></li>
              <li>
                <div style="padding:4px 12px">
                  <form action="Logout">
                    <input type="submit" value="Logout" style="width:100%;padding:8px;border:0;border-radius:4px;background:var(--accent);color:#fff">
                  </form>
                </div>
              </li>
            </c:otherwise>
          </c:choose>
        </ul>
      </li>

      <li><a href="Carrello"><img src="img/carrello_rosso.png" alt="Carrello"></a></li>

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




