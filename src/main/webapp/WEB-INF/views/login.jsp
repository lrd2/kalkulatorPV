<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kalkulator PV | zaloguj się</title>
    <link rel="stylesheet" href="/resources/css/rangeslider.css">
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">
</head>

<body>
<%@ include file="headers/header_anonymus.jspf" %>
<br><br>
<div class="container mt-4 w-25">
    <div class="card mt-2 card text-white bg-dark mb-1 transparent">
        <div class="card-header font-weight-bold transparent text-center">
            Zaloguj się
        </div>
        <div class="card-body">
            <form method="post">
                <div class="form-group">
                    <label for="login" class="col-form-label">Podaj login:</label>
                    <input type="text" name="login" id="login" class="form-control">
                </div>
                <div class="form-group">
                    <label for="password" class="col-form-label">Podaj hasło:</label>
                    <input type="password" name="password" id="password" class="form-control">
                </div>
                <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Zaloguj się" align="center"/>
            </form>
            <p class="error">${message}</p>

        </div>
    </div>
</div>

</body>
</html>
