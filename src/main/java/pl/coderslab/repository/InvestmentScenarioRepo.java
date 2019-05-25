package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.InvestmentScenario;

import java.util.List;

public interface InvestmentScenarioRepo extends JpaRepository<InvestmentScenario, Long>, InvestmentScenarioCustom {
    List<InvestmentScenario> findByUserId(Long id);
    InvestmentScenario findById(Long id);
}
