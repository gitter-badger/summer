package com.richeninfo.summer.account.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.richeninfo.summer.core.domain.IdEntity;


/**
 * 角色.
 */
@Entity
@Table(name = "SRS_ROLE")
public class Role extends IdEntity{

	private static final long serialVersionUID = 2552305071189787157L;
	
	private String code;
	private String name;
	
	private Set<User> users = new HashSet<User>(0);

	@Column(name = "CODE", length = 20)
	public String getCode() {
		return code;
	}

	@Column(name = "NAME", length = 50)
	public String getName() {
		return name;
	}

	@ManyToMany(cascade={CascadeType.MERGE,CascadeType.PERSIST}, fetch = FetchType.LAZY)
	@JoinTable(
			name = "SRS_USER_ROLE", 
			joinColumns = { @JoinColumn(name = "ROLE_ID", nullable = false, updatable = false) }, 
			inverseJoinColumns = { @JoinColumn(name = "USER_ID", nullable = false, updatable = false) })
	public Set<User> getUsers() {
		return users;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}
}
