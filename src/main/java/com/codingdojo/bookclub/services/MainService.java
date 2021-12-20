package com.codingdojo.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.repositories.BookRepo;
import com.codingdojo.bookclub.repositories.UserRepo;



@Service
public class MainService {
	
	@Autowired
	private final BookRepo bookRepo;
//	private final UserRepo userRepo;
	
	public MainService(BookRepo bookRepo, UserRepo userRepo) {
		this.bookRepo = bookRepo;
//		this.userRepo = userRepo;
	}
	
	// Create book
	public Book createBook(Book book) {
		return bookRepo.save(book);
	}
	
	// Retrieve all books
	public List<Book> allBooks() {
		return bookRepo.findAll();
	}
	
	// Retrieve one book
	public Book findBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		}
		return null;
	}
	
}
