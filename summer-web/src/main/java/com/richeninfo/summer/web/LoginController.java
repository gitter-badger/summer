package com.richeninfo.summer.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.richeninfo.summer.Constants;
import com.richeninfo.summer.account.entity.User;
import com.richeninfo.summer.account.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	
	/**
	 * 跳转至登陆页面.
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request,HttpServletResponse response){
		//Session TimeOut.
		sessionTimeOut(request,response);
		return "login";
	}
	
	/**
	 * 清除Session.
	 */
	private void sessionTimeOut(HttpServletRequest request,HttpServletResponse response){
		request.getSession().invalidate();
		response.setCharacterEncoding("UTF-8");
	}

	
	
	/**
	 * 登陆验证.
	 * 
	 * @param uname
	 * @param upswd
	 * @return
	 */
	@RequestMapping(value="/login/validate", method=RequestMethod.POST)
    public String validate(HttpServletRequest request,String uname,String upswd) {
		
    	if("admin".equals(uname)){
    		if("admin".equals(upswd)){
//	    		User u = new User(uname,upswd);
	    		request.getSession().setAttribute(Constants.CUR_USER_NAME, uname);
//	    		request.getSession().setAttribute(Constants.CUR_USER_OBJ, u);
    		}
    	}
    	//真实登录
//    	} else {
//    		User u = userManager.getUserByName(uname);
//    		String mp = MD5Util.MD5(upswd);
//    		if(u != null && u.getPswd().equals(mp)){
//    			request.getSession().setAttribute(Constants.CUR_USER_NAME, uname);
//	    		request.getSession().setAttribute(Constants.CUR_USER_OBJ, u);
//    		}
//    	} 
    	
    	//跳转至主页
        return "redirect:/index";
    }
	
}
