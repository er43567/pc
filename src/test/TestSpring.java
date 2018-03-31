package test;

import java.math.BigInteger;
import java.util.Arrays;
import java.util.List;

import junit.framework.TestCase;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.lrxzl.lib.java.tool.Tool;
import cn.unclezhang.bean.Reply;
import cn.unclezhang.bean.Report;
import cn.unclezhang.bean.User;
import cn.unclezhang.dao.IDao;
import cn.unclezhang.dao.impl.DaoImpl;
import cn.unclezhang.service.impl.ServiceImpl;

public class TestSpring extends TestCase {
	
	public void getDaoInstance() {
		// 1. 实例化IoC容器
		BeanFactory bf = new ClassPathXmlApplicationContext("applicationContext.xml");
		// 2. 获得HibernateTemplate对象.
		
		// bf.getBean("hibernateTemplate");
		
		HibernateTemplate hibernateTemplate =  (HibernateTemplate) bf.getBean("hibernateTemplate");
		
		ServiceImpl asi = new ServiceImpl();
		
		DaoImpl adi = new DaoImpl();
		adi.setHibernateTemplate(hibernateTemplate);
		
		asi.setDao(adi);
		
		//adi.updateByHql("update User set user_name=? where user_id=?" ,new Object[]{"管理员","admin"});
		//adi.deletePostById(493);
		
		//Post user = adi.findPostById(493);
		
		//System.out.println(user);
	}
	
	BeanFactory bf;
	HibernateTemplate hibernateTemplate;
	ServiceImpl service;
	DaoImpl dao;
	
	public TestSpring () {
		bf = new ClassPathXmlApplicationContext("applicationContext.xml");
		hibernateTemplate =  (HibernateTemplate) bf.getBean("hibernateTemplate");
		
		dao = new DaoImpl();
		dao.setHibernateTemplate(hibernateTemplate);
		System.out.println("======");
		service = new ServiceImpl(); 
		service.setDao((IDao) dao);
	}
	
	public void testSave() {
		//di.updateField("user_tb", "", "");
		System.out.println("test");
		
		User user = new User();
		user.setName("名" + Math.random());
		user.setUserId(Math.random()+"");
		user.setPsw("psw");
		user.setTime(Tool.time());
		try {
			dao.saveEntity(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void testFind() throws Exception {
		User user = dao.findOneByHql("from User where userId=?", new Object[]{"admin"});
		System.out.println(user);
	}
	
	public void testPush() throws Exception {
		/*Push push = new Push();
		push.setContent("sdfasd");
		dao.saveEntity(push);
		Report r = new Report();
		r.setType("sdfasdf");
		dao.saveEntity(r);
		User u = new User();
		u.setUserId("sdfs");
		dao.saveEntity(u);*/
		Reply re = new Reply();
		re.setContent("sdfs");
		dao.saveEntity(re);/**/
	}
	
	public void testTemp() {
		//service.updateUserFiled("admin", "psw", "12321321");
		try {
			List<User> users = dao.findByHql("from User");
			System.out.println(users.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void testReport() throws Exception {
		Report r = new Report();
		r.setItems(new String[]{"","sdfasd","多少了空间"});
		r.setUserId("admin");
		dao.saveEntity(r);
	}
	
	public void testLocate() throws Exception {
		/*Session session = hibernateTemplate.getSessionFactory().openSession();
		org.hibernate.Transaction tx = session.beginTransaction(); 
		SQLQuery query = session.createSQLQuery("SELECT LOCATE( 'Peter', 'Peter Steve Tom' ) limit 1");
		try {
			tx.commit();
			List li = query.list();
			System.out.println(li.get(0));
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			throw e;
		} finally {
			session.close(); 
		}*/
		List li = dao.findBySql("SELECT LOCATE( 'Peter', 'Peter Steve Tom' )");
		BigInteger bi = (BigInteger) li.get(0);
		System.out.println(bi.intValue());
	}
	
	public void testColors() {
		try {
			List<String> li = dao.findBySql("select concat(time,'=',(locate('0', choices)>0 or locate('2', choices)>0 or locate('3', choices)>0 or locate('4', choices)>0 or locate('5', choices)>0))"
					+ " from report_tb");
			System.out.println(Arrays.toString(li.toArray()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void testReport1() {
		List<Report> li = service.loadReportsByDate("HotalReport", "2018-03-31");
		System.out.println(Arrays.toString(li.toArray()));
	}
}
