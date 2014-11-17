package org.interview.hibernate.dao;

import org.interview.hibernate.entity.User;

public interface IUserDao
{
	User get(String id);
}
