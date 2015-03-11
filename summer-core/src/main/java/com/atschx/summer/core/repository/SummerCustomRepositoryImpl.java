package com.atschx.summer.core.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class SummerCustomRepositoryImpl implements SummerCustomRepository
{
	@PersistenceContext
	private EntityManager em;

	/**
	 * Configure the entity manager to be used.
	 * 
	 * @param em the {@link EntityManager} to set.
	 */
	public void setEntityManager(EntityManager em) {
		this.em = em;
	}
	
	public EntityManager getEntityManager()
	{
		return this.em;
	}
}
