package pl.coderslab.controller;

import com.sun.net.httpserver.HttpPrincipal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.InvestmentScenario;
import pl.coderslab.model.User;
import pl.coderslab.repository.InvestmentScenarioRepo;
import pl.coderslab.repository.UserRepo;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Objects;

@SessionAttributes("user")
@Controller
@RequestMapping(path="/user")
public class UserController {

    @Autowired
    InvestmentScenarioRepo invSceRepository;

    @Autowired
    UserRepo userRepo;

    @GetMapping(path="/download/{id}")
    public String generateAndDownloadBusinessPlan(@PathVariable("id") Long id) {
        invSceRepository.getOutputsFromFinancialModel(invSceRepository.findById(id));
        return "redirect:../../generated_files/model_finansowy.xlsx";
    }

    @GetMapping(path="/results/{id}")
    public String showResultsByInvestmentId(@PathVariable("id") Long id, Model model) {
        InvestmentScenario investmentScenario = invSceRepository.findById(id);
        model.addAttribute("investmentScenario", investmentScenario);
        return "user_results";
    }

    @GetMapping(path="/delete/{id}")
    public String deleteInvestment(@PathVariable("id") Long id) {
        invSceRepository.delete(id);
        return "redirect:/user/investments";
    }

    @PostMapping(path="/edit/{id}")
    public String updateInvestment(@ModelAttribute @Valid InvestmentScenario investmentScenario, Model model, HttpSession session) {
        investmentScenario = invSceRepository.getOutputsFromFinancialModel(investmentScenario);
        User user = (User) session.getAttribute("user");
        investmentScenario.setUser(user);
        if (investmentScenario.getName().equals("")) {
            investmentScenario.setName("Inwestycja nr " + (invSceRepository.findByUserId(user.getId()).size()+1));
        }
        invSceRepository.save(investmentScenario);
        model.addAttribute("investmentScenario", investmentScenario);
        return "user_results";
    }

    @GetMapping(path="/edit/{id}")
    public String editInvestment(HttpSession session, @PathVariable("id") Long id, Model model) {
        InvestmentScenario investmentScenario = invSceRepository.findById(id);
        model.addAttribute("investmentScenario", investmentScenario);
        return "user_add";
    }


    @GetMapping(path="/investments")
    public String showInvestments(HttpSession session, Model model){
        User user = (User) session.getAttribute("user");
        Long userId = user.getId();
        List<InvestmentScenario> investments = invSceRepository.findByUserId(userId);
        model.addAttribute("investments", investments);
        return "user_investments";
    }

    @PostMapping(path="/add")
    public String showResults(@ModelAttribute @Valid InvestmentScenario investmentScenario, Model model, HttpSession session) {
        investmentScenario = invSceRepository.getOutputsFromFinancialModel(investmentScenario);
        User user = (User) session.getAttribute("user");
        investmentScenario.setUser(user);
        if (investmentScenario.getName().equals("")) {
            investmentScenario.setName("Inwestycja nr " + (invSceRepository.findByUserId(user.getId()).size()+1));
        }

        invSceRepository.save(investmentScenario);
        model.addAttribute("investmentScenario", investmentScenario);
        return "user_results";
    }

    @GetMapping(path="/add")
    public String sayHello(Model model) {
        model.addAttribute("investmentScenario", new InvestmentScenario());
        return "user_add";
    }



}
