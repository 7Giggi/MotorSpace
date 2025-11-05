<%@ page import="model.Prodotto" %>
<%@ page import="java.util.List" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<jsp:include page="HeaderAmministratore.jsp">
    <jsp:param name="pageTitle" value="Home"/>
</jsp:include>
<meta charset="UTF-8">

<section>
    <link href="${pageContext.request.contextPath}/css/animate.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="css/bare.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
     <link rel="stylesheet" href="css/header.css" type="text/css">

    <!-- Slideshow -->
    <div class="slideshow-container">
        <div class="mySlides">
            <div class="numbertext">1 / 3</div>
            <img src="img/offerte/banner1.jpg" style="width:100%">
            <div class="text"></div>
        </div>

        <div class="mySlides">
            <div class="numbertext">2 / 3</div>
            <img src="img/offerte/banner2.jpg" style="width:100%">
            <div class="text"></div>
        </div>

        <div class="mySlides">
            <div class="numbertext">3 / 3</div>
            <img src="img/offerte/banner3.jpg" style="width:100%">
            <div class="text"></div>
        </div>

        <!-- Next and previous buttons -->
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <br>

    <!-- The dots/circles -->
    <div style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
    </div>
</section>

<!-- SEZIONE PRODOTTI -->
<section>
    <grid>
        <c:forEach items="${Prodotti}" var="prodotto">
            <div col="1/3">
                <h3>
                    <a href="Prodotto?id=<c:out value='${prodotto.id}'/>">
                        <c:out value="${prodotto.nome}" />
                    </a>
                </h3>
                <a href="Prodotto?id=<c:out value='${prodotto.id}'/>">
                    <img src="img/prodotto${prodotto.id}.jpg">
                </a>
                <h4>Prezzo: <c:out value="${prodotto.prezzo}" /> &euro;</h4>
            </div>
        </c:forEach>
    </grid>
</section>

<script>
    var slideIndex = 0;
    showSlides();

    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";
        dots[slideIndex-1].className += " active";
        setTimeout(showSlides, 4000);
    }
</script>
<script>
document.addEventListener("DOMContentLoaded", () => {
  const toggles = document.querySelectorAll(".menu > li.caret > a");

  toggles.forEach(link => {
    link.addEventListener("click", (e) => {
      // Evita che il link ricarichi la pagina
      e.preventDefault();

      // Trova il menu associato
      const parent = link.parentElement;
      const dropdown = parent.querySelector(".dropdown");

      // Chiudi eventuali altri menu aperti
      document.querySelectorAll(".menu .dropdown.show").forEach(menu => {
        if (menu !== dropdown) menu.classList.remove("show");
      });

      // Alterna apertura/chiusura del menu corrente
      dropdown.classList.toggle("show");
    });
  });

  // Chiudi i menu cliccando fuori
  document.addEventListener("click", (e) => {
    if (!e.target.closest(".menu")) {
      document.querySelectorAll(".menu .dropdown.show").forEach(menu => {
        menu.classList.remove("show");
      });
    }
  });
});
</script>


<%@include file="../footer.html"%>
