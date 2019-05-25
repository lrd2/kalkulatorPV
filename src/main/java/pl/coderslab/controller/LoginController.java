package pl.coderslab.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;
import pl.coderslab.model.User;
import pl.coderslab.repository.UserRepo;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
@SessionAttributes("user")
public class LoginController {

    @Autowired
    UserRepo userRepo;

    @GetMapping(path = "logout")
    public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        session.setAttribute("user", null);
        Cookie sessionCookie = WebUtils.getCookie(request, "JSESSIONID");
        sessionCookie.setMaxAge(0);
        sessionCookie.setPath("/");
        response.addCookie(sessionCookie);
        return "redirect:/home";
    }

    @GetMapping(path = "/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping(path = "/register")
    public String registerUser(@ModelAttribute User user, HttpSession session, HttpServletRequest request) {
//        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
//        userRepo.save(user);
//        session.setAttribute("user", user);
//        return "redirect:/user/investments";
        if (userRepo.findByLogin(user.getLogin()) == null) {
            user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
            userRepo.save(user);
            session.setAttribute("user", user);
            return "redirect:/user/investments";
        }
        request.setAttribute("message", "Użytkownik o takim loginie już istnieje.");
        return "register";
    }

    @GetMapping(path = "/login")
    public String getCredentials() {
        return "login";
    }

    @PostMapping(path = "/login")
    public String checkCredentials(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
        User user = userRepo.findByLogin(request.getParameter("login"));
        if (user == null) {
            request.setAttribute("message", "Nie ma użytkownika o takim loginie");
            return "login";
        }
        if (BCrypt.checkpw(request.getParameter("password"), user.getPassword())) {
            session.setAttribute("user", user);
            return "redirect:/user/investments";
        }
        request.setAttribute("message", "Niepoprawne hasło.");
        return "login";
    }
}
