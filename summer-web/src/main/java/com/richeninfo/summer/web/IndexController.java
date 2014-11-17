package com.richeninfo.summer.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.richeninfo.summer.Constants;
import com.richeninfo.summer.account.entity.User;


@Controller
public class IndexController {
	
	@RequestMapping("/index")
    public ModelAndView execute(HttpServletRequest request) {
    	Object userObj = request.getSession().getAttribute(Constants.CUR_USER_OBJ);
    	ModelAndView m = new ModelAndView();
    	m.setViewName("index");
    	if(userObj !=null && userObj instanceof User){
    		User u = (User)userObj;
    		m.addObject("user", u.getName());
    		/*Object userName = request.getSession().getAttribute(Constants.CUR_USER_NAME);
    		if(u.getName().equals(userName)){
    			
    		} else {
    			
    		}*/
    	}else{
    		m.setViewName("redirect:/login");
    	}
    	return m;
    }
}
