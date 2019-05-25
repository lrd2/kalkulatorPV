<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kalkulator PV | ${user.login} - Twoje inwestycje</title>
    <link rel="stylesheet" href="/resources/css/rangeslider.css">
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">
    <meta charset="UTF-8">
</head>
<body>
<%@ include file="headers/header_logged.jspf" %>

<br><br>
<div class="container">
    <div class="card mt-5 bg-dark text-white transparent">
        <div class="card-header font-weight-bold text-center mb-0 h3">Twoje inwestycje</div>
        <div class="card-body mt-0">
            <br>
                <table border="2" class="table table-striped table-dark table-hover  table-borderless radius">
                    <thead>
                    <tr class="font-weight-bold">
                        <td>
                            Nazwa inwestycji
                        </td>
                        <td style="text-align:center">
                            Moc
                        </td>
                        <td style="text-align:center">
                            Zarządzaj
                        </td>
                        <td style="text-align:center">
                            Pobierz biznesplan
                        </td>
                    </tr>
                    </thead>
                    <c:forEach items="${investments}" var="investment">
                        <tr>
                            <td>
                                    ${investment.name}
                            </td>
                            <td style="text-align:center">
                                <fmt:formatNumber maxFractionDigits="0">${investment.power}</fmt:formatNumber> kW
                            </td>
                            <td style="text-align:center">
                                <button class="btn btn-outline-primary my-2 my-sm-0 btn-sm"
                                        id="editButton${investment.id}">Edytuj
                                </button>&nbsp;
                                <script type="text/javascript">
                                    document.getElementById("editButton${investment.id}").onclick = function () {
                                        location.href = "../user/edit/" + ${investment.id};
                                    };
                                </script>
                                <button class="btn btn-outline-danger my-2 my-sm-0 btn-sm"
                                        id="deleteButton${investment.id}">Usuń
                                </button>&nbsp;
                                <script type="text/javascript">
                                    document.getElementById("deleteButton${investment.id}").onclick = function () {
                                        location.href = "../user/delete/" + ${investment.id};
                                    };
                                </script>
                                <button class="btn btn-outline-success my-2 my-sm-0 btn-sm"
                                        id="analysisButton${investment.id}">Pokaż analizę
                                </button>
                                <script type="text/javascript">
                                    document.getElementById("analysisButton${investment.id}").onclick = function () {
                                        location.href = "../user/results/" + ${investment.id};
                                    };
                                </script>
                            </td>
                            <td style="text-align:center">
                                <a href="/user/download/${investment.id}"><img src="../../resources/other/excel.png" height="30" width="30"></a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            <button class="btn btn-outline-success my-2 my-sm-0 btn-sm"
                    id="addNewButton">Dodaj nową
            </button>
            <script type="text/javascript">
                document.getElementById("addNewButton").onclick = function () {
                    location.href = "../user/add";
                };
            </script>
        </div>
    </div>
</div>

</body>
</html>
