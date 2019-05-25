<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kalkulator PV | ${user.login} - dodaj nową inwestycję</title>
    <link rel="stylesheet" href="/resources/css/rangeslider.css">
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">
    <meta charset="UTF-8">
</head>

<body>
<%@ include file="headers/header_logged.jspf" %>
<div class="container">
    <header>Wprowadź parametry inwestycji</header>
    <form:form method="post" modelAttribute="investmentScenario">
        <div class="card mt-2 card text-white bg-dark mb-1 transparent">
            <div class="card-header font-weight-bold">
                Nazwij instalację</span>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <form:input class="form-control" id="insestmentScenarioName" type="text" path="name"
                                placeholder="Wpisz nazwę"/>
                    <p class="card-text font-weight-lighter">Podaj nazwę, po której będziesz mógł wrócić do kalkulacji i
                        ją modyfikować.</p>
                        <%--<form:errors path="power" element="div"/>--%>
                </div>
            </div>
        </div>
        <div class="card mt-3 card text-white bg-dark mb-1 transparent">
            <div class="card-header font-weight-bold">
                1. Moc instalacji:
                <span class="badge badge-success">
                <label id="rangePower">
                       <fmt:formatNumber maxFractionDigits="0">${investmentScenario.power}</fmt:formatNumber> kW
                </label>
            </span>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <form:input class="form-control" id="rangePower" min="50" max="1000" step="1" type="range"
                                path="power"
                                oninput="document.getElementById('rangePower').innerHTML = this.value + '&nbsp;kW'"/>
                    <p class="card-text font-weight-lighter">Zakres mocy dostępnej do kalkulacji jest ograniczony do
                        przedziału 50 - 1000 kW w celu maksymalizacji dokładności analizy.</p>
                        <%--<form:errors path="power" element="div"/>--%>
                </div>
            </div>
        </div>
        <div class="card mt-3 card text-white bg-dark mb-1 transparent">
            <div class="card-header font-weight-bold">
                2. Koszt instalacji:
                <span class="badge badge-success">
                    <label id="rangePrice">
                        <fmt:formatNumber
                                maxFractionDigits="0">${investmentScenario.pricePerKwOfInvestment}</fmt:formatNumber> zł
                    </label>
                </span>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <form:input class="form-control" type="range" path="pricePerKwOfInvestment" min="3000" max="4500"
                                oninput="document.getElementById('rangePrice').innerHTML = this.value + '&nbsp;zł / kW'"/>
                    <form:errors path="pricePerKwOfInvestment" element="div"/>
                    <p class="card-text font-weight-lighter">Wprowadź koszt budowy instalacji w złotych przeliczeniu na
                        1 kW
                        mocy zainstalowanej. Dostępny zakres jest ograniczony zgodnie z aktualnymi ofertami
                        rynkowymi.</p>
                </div>
            </div>
        </div>

        <div class="card mt-3 card text-white bg-dark mb-1 transparent">
            <div class="card-header font-weight-bold">
                3. Wkład własny:
                <span class="badge badge-success">
                    <label id="rangeContribution">
                <fmt:formatNumber maxFractionDigits="0"
                                  type="percent">${investmentScenario.contributionPercentage}</fmt:formatNumber>
                    </label>
                </span>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <form:input class="form-control" min="0.01" max="1" step="0.01" type="range"
                                path="contributionPercentage"
                                oninput="document.getElementById('rangeContribution').innerHTML = (this.value*100).toFixed(0) + '%'"/>
                    <form:errors path="contributionPercentage" element="div"/>
                    <p class="card-text font-weight-lighter">Określ jaką część nakładów inwestycyjnych chcesz pokryć
                        własnymi środkami. Analiza założy, że pozostała część będzie pokryta kredytem bankowym.</p>
                </div>
            </div>
        </div>
        <div class="card mt-3 card text-white bg-dark mb-1 transparent">
            <div class="card-header font-weight-bold">
                4. Oprocentowanie kredytu:
                <span class="badge badge-success">
                    <label id="rangeInterestRate">
                <fmt:formatNumber type="percent"
                                  minFractionDigits="1">${investmentScenario.loanInterestRate}</fmt:formatNumber>
                    </label>
                </span>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <div>
                        <form:input class="form-control" min="0.001" step="0.001" max="0.3" type="range"
                                    path="loanInterestRate"
                                    oninput="document.getElementById('rangeInterestRate').innerHTML = (this.value*100).toFixed(1) + '%'"/>
                        <form:errors path="loanInterestRate" element="div"/>
                        <p class="card-text font-weight-lighter">Określ całkowite oprocentowanie kredytu inwestycyjnego,
                            tj. zawierające WIBOR i marżę banku. Jeżeli wkład własny wynosi 100%, pozostaw pole z
                            dowolną wartością. </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="card mt-3 card text-white bg-dark mb-1 transparent">
            <div class="card-header font-weight-bold">
                5. Prowizja banku
                <span class="badge badge-success">
                    <label id="rangeProvision">
                <fmt:formatNumber type="percent"
                                  maxFractionDigits="1">${investmentScenario.bankProvision}</fmt:formatNumber>
                    </label>
                </span>
            </div>
            <div class="card-body">
                <div>
                    <div class="form-group">
                        <form:input class="form-control" min="0.001" step="0.001" max="0.3" type="range"
                                    path="bankProvision"
                                    oninput="document.getElementById('rangeProvision').innerHTML = (this.value*100).toFixed(1) + '%'"/>
                        <form:errors path="bankProvision" element="div"/>
                        <p class="card-text font-weight-lighter">Określ wysokość jednorazowej prowizji banku. Jeżeli
                            wkład własny wynosi 100%, pozostaw pole z dowolną wartością. </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="card mt-3 card text-white bg-dark mb-1 transparent">
            <div class="card-header font-weight-bold">
                6. Planowana cena sprzedaży:
                <span class="badge badge-success">
                    <label id="rangeSellingPrice">
                <fmt:formatNumber
                        maxFractionDigits="0">${investmentScenario.sellingPrice}</fmt:formatNumber> zł
                    </label>
                </span>
            </div>
            <div class="card-body">
                <div>
                    <div class="form-group">
                        <div>
                            <form:input class="form-control" min="150" step="1" max="500" type="range"
                                        path="sellingPrice"
                                        oninput="document.getElementById('rangeSellingPrice').innerHTML = this.value + 'zł / mWh'"/>
                            <form:errors path="sellingPrice" element="div"/>
                            <p class="card-text font-weight-lighter">Określ planowaną cenę sprzedaży energii
                                wyprodukowanej
                                w instalacji.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card mt-3 card text-white bg-dark mb-1 transparent">
            <div class="card-header font-weight-bold">
                7. Koszt dzierżawy gruntu:
                <span class="badge badge-success">
                    <label id="rangeRental">
                        <fmt:formatNumber
                                maxFractionDigits="0">${investmentScenario.estateRentalPriceMonthly}</fmt:formatNumber> zł
                    </label>
                </span>
            </div>
            <div class="card-body">
                <div>
                    <div class="form-group">
                        <div>
                            <form:input class="form-control" min="0" step="1" max="5000" type="range"
                                        path="estateRentalPriceMonthly"
                                        oninput="document.getElementById('rangeRental').innerHTML = this.value + 'zł'"/>
                            <form:errors path="estateRentalPriceMonthly" element="div"/>

                            <p class="card-text font-weight-lighter">Określ miesięczny koszt dzierżawy gruntu, na którym
                                posadowiona będzie instalacja.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="submit" value="Przelicz" class="btn btn-secondary btn-lg btn-block btn-success mt-3">
    </form:form>
</div>
</body>
</html>
