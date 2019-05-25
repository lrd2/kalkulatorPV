<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style src="/resource/js/rangeslider.css"></style>
    <script src="/resources/js/rangeslider.min.js"></script>
    <script src="jquery.min.js"></script>
    <script>
        // Initialize a new plugin instance for all
        // e.g. $('input[type="range"]') elements.
        $('input[type="range"]').rangeslider();

        // Destroy all plugin instances created from the
        // e.g. $('input[type="range"]') elements.
        $('input[type="range"]').rangeslider('destroy');

        // Update all rangeslider instances for all
        // e.g. $('input[type="range"]') elements.
        // Usefull if you changed some attributes e.g. `min` or `max` etc.
        $('input[type="range"]').rangeslider('update', true);
    </script>
</head>
<body>
<%--<form:form method="post" modelAttribute="investmentScenario">--%>

<h3>Wprowadź parametry inwestycji</h3>
<form:form method="post" modelAttribute="investmentScenario">
    <div>
        <label>Moc instalacji w kW:</label>
        <input type="range" min="10" max="1000" step="10" value="300" data-orientation="horizontal">
        <form:input type="number" path="power"/>
        <form:errors path="power" element="div"/>
    </div>
    <div>
        <label>Koszt instalacji w przeliczeniu na 1kW (w PLN netto):</label>
        <form:input type="number" path="pricePerKwOfInvestment"/>
        <form:errors path="pricePerKwOfInvestment" element="div"/>
    </div>
    <div>
        <label>Wysokość wkładu własnego:</label>
        <form:input type="number" path="contributionPercentage"/>
        <form:errors path="contributionPercentage" element="div"/>
    </div>
    <div>
        <label>Oprocentowanie kredytu (WIBOR + marża banku):</label>
        <form:input type="number" path="loanInterestRate"/>
        <form:errors path="loanInterestRate" element="div"/>
    </div>
    <div>
        <label>Jednorazowa prowizja banku:</label>
        <form:input type="number" path="bankProvision"/>
        <form:errors path="bankProvision" element="div"/>
    </div>
    <div>
        <label>Planowana cena sprzedaży</label>
        <form:input type="number" path="sellingPrice"/>
        <form:errors path="sellingPrice" element="div"/>
    </div>
    <div>
        <label>Miesięczny koszt dzierżawy gruntu</label>
        <form:input type="number" path="estateRentalPriceMonthly"/>
        <form:errors path="estateRentalPriceMonthly" element="div"/>
    </div>
    <input type="submit" value="Przelicz">
</form:form>

</body>
</html>
