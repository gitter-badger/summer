/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.atschx.summer.quickstart.web.account;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atschx.summer.quickstart.entity.User;
import com.atschx.summer.quickstart.service.account.AccountService;

/**
 * 用户注册的Controller.
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = "/register")
public class RegisterController {

  private static Logger logger = LoggerFactory.getLogger(RegisterController.class);

  @Autowired
  private AccountService accountService;

  /**
   * Ajax请求校验loginName是否唯一。
   */
  @RequestMapping(value = "checkLoginName")
  @ResponseBody
  public String checkLoginName(@RequestParam("loginName") String loginName) {
    logger.debug("前端传入登录名称:" + loginName);
    if (accountService.findUserByLoginName(loginName) == null) {
      return "true";
    } else {
      return "false";
    }
  }

  @RequestMapping(method = RequestMethod.POST)
  public String register(@Valid User user, RedirectAttributes redirectAttributes) {
    accountService.registerUser(user);
    redirectAttributes.addFlashAttribute("username", user.getLoginName());
    return "redirect:/login";
  }

  @RequestMapping(method = RequestMethod.GET)
  public String registerForm() {
    return "account/register";
  }
}
