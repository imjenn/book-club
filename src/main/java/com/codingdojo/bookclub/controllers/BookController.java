package com.codingdojo.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.models.User;
import com.codingdojo.bookclub.services.MainService;
import com.codingdojo.bookclub.services.UserService;

@Controller
public class BookController {
	public BookController(MainService mainServ) {
		this.mainServ = mainServ;
	}
	
	@Autowired
	MainService mainServ;
	
	@Autowired 
	UserService userServ;
	
	// Create a new book - Display
	@GetMapping("/books/new")
	public String newBook(@ModelAttribute("book") Book book) {
		return "new.jsp";
	}
	
	// Create a new book - Action 
	@PostMapping(value="/books/new")
	public String create(@Valid @ModelAttribute("book") Book book, HttpSession session, BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<User> users = userServ.allUsers();
			model.addAttribute("users", users);
			model.addAttribute("books", mainServ.allBooks());
			return "new.jsp";
		} else {
			User user = new User();
			model.addAttribute("user", user);
			mainServ.createBook(book);
			System.out.println(book);
			System.out.println(book.getTitle());
			System.out.println(book.getAuthor());
			System.out.println(book.getUser());
			System.out.println(session.getAttribute("user_id"));
			return "redirect:/books";
		}
	}
	
	// Retrieve all books
	@GetMapping("/books")
//	@ModelAttribute("books") Book book, 
	public String allBooks(HttpSession session, Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		User user = new User();
		model.addAttribute("user", user);
		List<Book> books = mainServ.allBooks();
		model.addAttribute("books", books);
		return "home.jsp";
	}
	
	// Retrieve one book
	@GetMapping("/books/{id}")
	public String show(Model model, @PathVariable("id") Long id) {
		Book book = mainServ.findBook(id);
		model.addAttribute("book", book);
		return "show.jsp";
	}
}
