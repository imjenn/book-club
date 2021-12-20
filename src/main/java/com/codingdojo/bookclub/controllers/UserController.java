package com.codingdojo.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.bookclub.models.LoginUser;
import com.codingdojo.bookclub.models.User;
import com.codingdojo.bookclub.services.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userServ;
	
	// Login and Registration
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
	}
	
	// Register - action route
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
		userServ.register(newUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "login.jsp";
		}
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/books";
	}
	
	// Login - action route
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
			BindingResult result, Model model, HttpSession session) {
		User user = userServ.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}
		session.setAttribute("user_id", user.getId());
		session.setAttribute("userName", user.getUserName());
		return "redirect:/books";
	}
	
	// Home page
//	@GetMapping("/books")
//	public String home(@ModelAttribute("newUser") User newUser, HttpSession session, Model model) {
//		if(session.getAttribute("user_id") == null) {
//			return "redirect:/";
//		}
//		return "home.jsp";
//	}
	
	// Log out 
	@GetMapping("/logout")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		return "redirect:/";
	}
}
