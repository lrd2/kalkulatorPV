<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kalkulator PV | zarejestruj się</title>
    <link rel="stylesheet" href="/resources/css/rangeslider.css">
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">
</head>

<body>
<%@ include file="headers/header_anonymus.jspf" %>

<br><br>
<div class="container mt-4 w-50">
    <div class="card mt-2 card text-white bg-dark mb-1 transparent">
        <div class="card-header font-weight-bold transparent text-center">
            Zarejestruj nowego użytkownika
        </div>
        <div class="card-body">
            <form:form method="post" modelAttribute="user">
                <div class="form-group">
                    <label for="login" class="col-form-label">Wybierz login:</label>
                    <form:input type="text" path="login" id="login" class="form-control"/>
                    <form:errors path="login" element="div" class="error"/>
                </div>
                <div class="form-group">
                    <label for="password" class="col-form-label">Wybierz hasło:</label>
                    <form:input type="password" path="password" id="password" class="form-control"/>
                    <form:errors path="password" element="div" class="error"/>
                </div>
                <div class="form-group">
                    <label for="email" class="col-form-label">Podaj email:</label>
                    <form:input type="text" path="email" id="email" class="form-control"/>
                    <form:errors path="email" element="div" class="error"/>
                </div>
                <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Zarejestruj się" align="center"/>
            </form:form>
            <p class="error">${message}</p>
        </div>
    </div>
</div>
</body>
</html>


<%--@Id--%>
<%--@GeneratedValue(strategy = GenerationType.IDENTITY)--%>
<%--private Long id;--%>
<%--@NotEmpty--%>
<%--private String login;--%>
<%--@NotEmpty--%>
<%--@Email--%>
<%--private String email;--%>
<%--@OneToMany(mappedBy = "user")--%>
<%--private List<Investment> investments;--%>
