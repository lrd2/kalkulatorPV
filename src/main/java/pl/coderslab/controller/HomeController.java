package pl.coderslab.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.InvestmentScenario;
import pl.coderslab.model.User;
import pl.coderslab.repository.InvestmentScenarioRepo;
import pl.coderslab.repository.UserRepo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(path = "/home")
public class HomeController {

    @Autowired
    InvestmentScenarioRepo invSceRepository;

    @PostMapping(path = "/edit")
    public String showEditedInvestment(@ModelAttribute InvestmentScenario investmentScenario, Model model, HttpSession session) {
        showResults(investmentScenario, model, session);
        return "homeresults";
    }

    @GetMapping(path = "/edit")
    public String editInvestment(HttpSession session, Model model) {
        model.addAttribute("investmentScenario", session.getAttribute("investmentScenario"));
        return "home";
    }

    @PostMapping(path = "/start")
    public String showResults(@ModelAttribute InvestmentScenario investmentScenario, Model model, HttpSession session) {
        investmentScenario = invSceRepository.getOutputsFromFinancialModel(investmentScenario);
        invSceRepository.save(investmentScenario);
        session.setAttribute("investmentScenario", investmentScenario);
        model.addAttribute("investmentScenario", investmentScenario);
        return "homeresults";
    }

    @GetMapping
    public String sayHello() {
        return "index";
    }

    @GetMapping(path = "/start")
    public String startAnalysis(Model model) {
        model.addAttribute("investmentScenario", new InvestmentScenario());
        return "home";
    }
}
