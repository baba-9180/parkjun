package com.parkjun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainpageController {
	@RequestMapping("/")
	public String root() {
		return "Mainpage/Mainpage";
	}
}
