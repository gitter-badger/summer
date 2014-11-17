package com.richeninfo.summer.account.service;


/**
 * 账号管理.
 * @author Albert
 *
 */
public interface AccountService {
	
	/**
	 * 注册账号.
	 * @param signUpRequest
	 */
    void signUp(SignUpRequest signUpRequest);
    
    /**
     * 通过用户名判断用户是否存在.
     * @param userName
     * @return
     */
    boolean isAccountExist(String userName);

}
