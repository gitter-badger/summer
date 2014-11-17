package com.richeninfo.summer.account.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.richeninfo.summer.account.service.AccountService;
import com.richeninfo.summer.account.service.SignUpRequest;
import com.richeninfo.summer.account.service.UserService;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	UserService userService;

	@Override
	public void signUp(SignUpRequest signUpRequest) {
		
	}

	@Override
	public boolean isAccountExist(String userName) {
		return false;
	}
}
