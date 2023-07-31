package com.infotran.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BaseController {
	@GetMapping("/")
	public String home() {
		System.out.println("haha2");
		return "index";
	}
	
	@GetMapping("/_01_customer/index")
	public String mod06_home() {
		return "_01_customer/index";
	}
	
}
