package com.richeninfo.summer.account.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	@RequestMapping("/user/register")
	public ModelAndView toRegisterUser(){
		ModelAndView mv = new ModelAndView("user/register");
		
		return mv;
	}
	
	/**
	 * 验证用户是否存在.
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/user/validate")
	public @ResponseBody String toValidateUser(String user){
		boolean isExists = false;
		if("admin".equals(user)){
			isExists = true;
		} else {
////			User u = userManager.getUserByName(user);
//			if(u != null){
//				isExists = true;
//			}
		}
	    
	    return isExists +""; 
	}
	

}
