package com.richeninfo.summer.account.repository;

import org.springframework.stereotype.Repository;

import com.richeninfo.summer.account.entity.Role;
import com.richeninfo.summer.core.repository.BaseDao;

@Repository
public interface RoleDao extends BaseDao<Role, Long> {
	
	/**
	 * 根据角色编号查询对应的角色信息.
	 * @param code
	 * @return
	 */
	Role findByCode(String code);

}
