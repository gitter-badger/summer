package org.interview.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.interview.hibernate.entity.User;

/**
 * 客户端测试调用Hibernate.
 * @author Albert
 */
public class Client
{
	public static void main(String[] args)
	{
		Configuration cfg = new Configuration().configure();

		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		User user = new User();
		
		user.setAge(23);
		user.setName("孙长浩");
		user.setLoginName("albert");
		user.setPassword("123456");
		user.setMobile("13671572607");
		
		session.save(user);
		
		session.getTransaction().commit();
		
		
//		session.beginTransaction();
//		@SuppressWarnings("unchecked")
//		List<User> users = session.createQuery("from User").list();
//		
//		for (User tempUser :users)
//		{
//			System.out.println(tempUser.getId());
//		}
//		
//		session.getTransaction().commit();
//		
//		
		session.close();
	}
}
