package com.oauth.ssd.config.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
	
	Logger logger = LoggerFactory.getLogger(UserController.class);
	
	   @RequestMapping(value = "/user")
	   public Principal user(Principal principal) {
		   logger.info(principal.toString());
	      return principal;
	   }
}
