package com.unnati.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class UserController {

	@GetMapping("/home")
	public String home() {
		return "Home";
	}
}
