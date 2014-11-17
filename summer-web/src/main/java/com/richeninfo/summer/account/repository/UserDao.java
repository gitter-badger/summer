package com.richeninfo.summer.account.repository;

import org.springframework.stereotype.Repository;

import com.richeninfo.summer.account.entity.User;
import com.richeninfo.summer.core.repository.BaseDao;

@Repository
public interface UserDao extends BaseDao<User, Long> {

	/**
	 * 根据用户登录名查询当前用户。
	 * @param loginName
	 * @return
	 */
	User findByLoginName(String loginName);
	
}
