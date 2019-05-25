<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kalkulator PV | wyniki kalkulacji inwestycji</title>
    <link rel="stylesheet" href="/resources/css/rangeslider.css">
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">
    <script src="../../resources/charts/Chart.js"></script>
</head>
<body>
<%@ include file="headers/header_anonymus.jspf" %>
<br>
<div class="container">
    <div class="container">
        <div class="row">
            <div class="card col-md-4 mt-5 card text-white bg-dark transparent">
                <div class="card-header font-weight-bold text-center">Zwrot z inwestycji</div>
                <h1 class="display-1 text-center">
                    <fmt:formatNumber type="percent" minFractionDigits="1">
                        ${investmentScenario.roiAfter15Years}</fmt:formatNumber>
                </h1>
                <p class="card-text font-weight-lighter text-center mb-3">Średnioroczny zwrot z zainwestowanego kapitału
                    w
                    15-letnim okresie trwania inwestycji</p>
            </div>
            <div class="card col-md-8 mt-5 card text-white bg-dark transparent">
                <div class="card-header font-weight-bold text-center">Nakłady finansowe i FCFE</div>
                <canvas id="chart" width="400" height="100"></canvas>
                <script>
                    var ctx = document.getElementById('chart');
                    var myChart = new Chart(ctx, {
                        type: 'horizontalBar',
                        data: {
                            labels: ['Wysokość kredytu', 'Wkład własny', 'FCFE po 15 latach'],
                            datasets: [{
                                label: 'wartości w PLN',
                                data: [${investmentScenario.loan}, ${investmentScenario.contributionCash}, ${investmentScenario.fcfeAfter15Years}],
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(48, 165, 74, 0.2)'
                                ],
                                borderColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(48, 165, 74, 1)'
                                ],
                                borderWidth: 2
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        }
                    });
                </script>
            </div>
        </div>
    </div>
    <div class="card mt-2 card text-white bg-dark mb-1 transparent">
        <div class="card-header font-weight-bold text-center">Wprowadzone parametry</div>
        <div class="card-body">
            <table border="2" class="table table-striped table-dark table-hover  table-borderless">
                <tr>
                    <td>Moc elektrowni</td>
                    <td><fmt:formatNumber
                            maxFractionDigits="0">${investmentScenario.power}</fmt:formatNumber> kW
                    </td>
                </tr>
                <tr>
                    <td>Koszt instalacji w przeliczeniu na 1kW (w PLN
                        netto):
                    </td>
                    <td><fmt:formatNumber
                            maxFractionDigits="0">${investmentScenario.pricePerKwOfInvestment}</fmt:formatNumber> zł
                    </td>
                </tr>
                <tr>
                    <td>Wysokość wkładu własnego:</td>
                    <td><fmt:formatNumber maxFractionDigits="0"
                                          type="percent">${investmentScenario.contributionPercentage}</fmt:formatNumber>
                    </td>
                </tr>
                <tr>
                    <td>Oprocentowanie kredytu (WIBOR + marża banku):
                    </td>
                    <td><fmt:formatNumber type="percent"
                                          minFractionDigits="1">${investmentScenario.loanInterestRate}</fmt:formatNumber>
                    </td>
                </tr>
                <tr>
                    <td>Jednorazowa prowizja banku:</td>
                    <td><fmt:formatNumber type="percent"
                                          maxFractionDigits="1">${investmentScenario.bankProvision}</fmt:formatNumber></td>
                </tr>
                <tr>
                    <td>Planowana cena sprzedaży</td>
                    <td><fmt:formatNumber
                            maxFractionDigits="0">${investmentScenario.sellingPrice}</fmt:formatNumber> zł
                    </td>
                </tr>
                <tr>
                    <td>Miesięczny koszt dzierżawy gruntu</td>
                    <td><fmt:formatNumber
                            maxFractionDigits="0">${investmentScenario.estateRentalPriceMonthly}</fmt:formatNumber> zł
                    </td>
                </tr>
            </table>
            <button class="btn btn-outline-success my-2 my-sm-0 btn-sm" id="editButton">Edytuj parametry</button>
            <script type="text/javascript">
                document.getElementById("editButton").onclick = function () {
                    location.href = "../home/edit";
                };
            </script>
        </div>
    </div>
</div>
</body>
</html>
