package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.model.Investment;
import pl.coderslab.model.InvestmentScenario;

@Controller
@RequestMapping(path="/investment")
public class InvestmentController {

    @GetMapping(path="/add")
    public String addScenario(Model model) {
        model.addAttribute("investment", new Investment());
        model.addAttribute("investmentScenario", new InvestmentScenario());
        return "basicinputs";
    }

}
