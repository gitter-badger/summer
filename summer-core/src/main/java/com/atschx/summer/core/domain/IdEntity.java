package com.atschx.summer.core.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * JPA 基类.
 * <p>
 * &nbsp;&nbsp;&nbsp;&nbsp;统一定义id的entity基类.<br>
 * </p>
 * 
 * @author Albert
 */
@MappedSuperclass
public abstract class IdEntity implements Serializable {
	private static final long serialVersionUID = 124556662821478249L;
	protected long id;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID", unique = true, nullable = false)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
}
