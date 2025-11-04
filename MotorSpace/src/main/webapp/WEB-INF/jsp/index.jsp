<%@ page import="model.Prodotto" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>MotorSpace - Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS -->
    <link rel="stylesheet" href="css/bare.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/animate.css" type="text/css">
    <link rel="stylesheet" href="css/header.css" type="text/css">
</head>

<body>

    <!-- Header -->
    <jsp:include page="Header.jsp">
        <jsp:param name="pageTitle" value="Home"/>
    </jsp:include>

    <!-- Slideshow -->
    <section class="slideshow-container" style="margin-top:20px;">
        <div class="mySlides">
            <div class="numbertext">1 / 3</div>
            <img src="img/offerte/Dainese_Kleidung_Banner.jpg" style="width:100%">
        </div>

        <div class="mySlides">
            <div class="numbertext">2 / 3</div>
            <img src="img/offerte/DaineseBanner4_m.jpg" style="width:100%">
        </div>

        <div class="mySlides">
            <div class="numbertext">3 / 3</div>
            <img src="img/offerte/img67.jpg" style="width:100%">
        </div>

        <!-- Next and previous buttons -->
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </section>

    <div style="text-align:center; margin-top:10px;">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
    </div>

    <!-- Prodotti -->
    <section style="margin: 40px auto; width:90%;">
        <grid>
            <c:forEach items="${Prodotti}" var="prodotto">
                <div col="1/3" style="text-align:center; padding:15px;">
                    <h3>
                        <a href="Prodotto?id=<c:out value='${prodotto.id}'/>">
                            <c:out value='${prodotto.nome}'/>
                        </a>
                    </h3>
                    <a href="Prodotto?id=<c:out value='${prodotto.id}'/>">
                        <img src="img/prodotto${prodotto.id}.jpg" alt="${prodotto.nome}" style="max-width:100%; height:auto;">
                    </a>
                    <h4>Prezzo: <c:out value='${prodotto.prezzo}'/> &euro;</h4>
                </div>
            </c:forEach>
        </grid>
    </section>

    <%@ include file="../footer.html" %>

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

</body>
</html>

<%@include file="../footer.html"%>