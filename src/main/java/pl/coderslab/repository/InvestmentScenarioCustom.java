package pl.coderslab.repository;

import pl.coderslab.model.InvestmentScenario;

import java.util.List;

public interface InvestmentScenarioCustom {
    InvestmentScenario getOutputsFromFinancialModel(InvestmentScenario investmentScenario);
}
