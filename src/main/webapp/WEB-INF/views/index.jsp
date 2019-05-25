<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kalkulator PV | przeanalizuj rentowność inwestycji w instalację fotowoltaiczną</title>
    <link rel="stylesheet" href="/resources/css/rangeslider.css">
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">
    <meta charset="UTF-8">

    <style>
        body {
            background-image: url("../../resources/other/background_smoked.jpg");
            /*background-image: url("../other/background.jpg");*/
        }

    </style>


</head>
<body>
<%--<%@ include file="headers/header_anonymus.jspf" %>--%>
<br><br><br>
<div class="container">
    <h1 class="display-4 text-center font-weight-light mt-0" ; style="font-size: 400px; color: lightgrey">Witaj</h1>
    <p class="font-weight-light text-center" ; style="font-size: 30px ;color: lightgrey"> Przeanalizuj rentowność
        inwestycji w instalację fotowoltaiczną. Pobierz gotowy biznesplan. Uzyskaj finansowanie na swoją własną farmę
        PV.</p>
    <center>
        <button class="btn btn-outline-success my-2 my-sm-0 btn-sm" id="registerButton" style="width: 340px">Zarejestruj
            się i korzystaj z pełni funkcjonalności
        </button>
        <script type="text/javascript">
            document.getElementById("registerButton").onclick = function () {
                location.href = "../../register";
            };
        </script>

        &nbsp;<button class="btn btn-outline-success my-2 my-sm-0 btn-sm mt-3" id="loginButton" style="width: 340px">
        Zaloguj się i odtwórz poprzednie kalkulacje
    </button>
        <script type="text/javascript">
            document.getElementById("loginButton").onclick = function () {
                location.href = "../../login";
            };
        </script>
        &nbsp;<button class="btn btn-outline-success my-2 my-sm-0 btn-sm mt-3" id="continueButton" style="width: 340px">
        Zrób szybką kalkulację bez rejestracji
    </button>
        <script type="text/javascript">
            document.getElementById("continueButton").onclick = function () {
                location.href = "../../home/start";
            };
        </script>
    </center>
</div>
</body>
</html>
