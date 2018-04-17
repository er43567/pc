package test;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
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
import cn.unclezhang.bean.Task;
import cn.unclezhang.bean.User;
import cn.unclezhang.dao.IDao;
import cn.unclezhang.dao.impl.DaoImpl;
import cn.unclezhang.relatives.RelativeHelper;
import cn.unclezhang.relatives.Relatives;
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
	
	public void testTaskSave() {
		service.saveTask("任务2", "内容2", "a1,a2,a3", 0);
	}
	
	public void testLatestTask() {
		Task t = service.loadLatestTask();
		System.out.println(t);
	}
	public void testTasks() {
		List<Task> li = service.loadTasks(0, 10);
		System.out.println(Arrays.toString(li.toArray()));
	}
 	
	public void testSaveUsers() throws Exception {
		dao.updateBySql("delete from user_tb");
		String userIds[] = new String[] {
				//1级
				"a11","a12","a13","a14","a15"
				,"a21","a22","a23","a24","a25"
				,"a31","a32","a33","a34","a35"
				,"a41","a42","a43","a44","a45"
				,"a51","a52","a53","a54","a55"
				//2级
				,"b11","b12","b13"
				,"b21"/*,"b22","b23"*/
				,"b31","b32","b33"
				,"b41","b42","b43"
				,"b51","b52","b53"
				//3级
				,"c11","c12","c13","c14"
				//4级
				,"d1","d12"
		};
		String names[] = new String[] {
				//1级 五个煤矿
				"跃进民爆库管员","跃进民爆安全员","跃进民爆爆破员","跃进民爆安全负责人","跃进民爆法人代表"
				,"潘家冲民爆库管员","潘家冲民爆安全员","潘家冲民爆爆破员","潘家冲民爆安全负责人","潘家冲民爆法人代表"
				,"五陂民爆库管员","五陂民爆安全员","五陂民爆爆破员","五陂民爆安全负责人","五陂民爆法人代表"
				,"久安民爆库管员","久安民爆安全员","久安民爆爆破员","久安民爆安全负责人","久安民爆法人代表"
				,"神威民爆库管员","神威民爆安全员","神威民爆爆破员","神威民爆安全负责人","神威民爆法人代表"
				//2级 四个派出所
				,"钟恒民","刘泉","王国生"
				,"王越明"/*,"刘泉","王国生"*/
				,"彭方根","何建","姚滨"
				,"黄干民","李俊","谢强"
				,"梁建忠","彭永","欧阳建华"
				//3级 
				,"杨建斌","褚佑晨","李柯","张卫华"
				//4级
				,"分管局领导","分管局局长"
		};
		String positions[] = new String[] {
				//1级 五个煤矿
				"库管员","安全员","爆破员","安全负责人","法人代表"
				,"库管员","安全员","爆破员","安全负责人","法人代表"
				,"库管员","安全员","爆破员","安全负责人","法人代表"
				,"库管员","安全员","爆破员","安全负责人","法人代表"
				,"库管员","安全员","爆破员","安全负责人","法人代表"
				//2级 四个派出所
				,"监管民警","分管副所长","所长"
				,"监管民警"/*,"分管副所长","所长"*/
				,"监管民警","分管副所长","所长"
				,"监管民警","分管副所长","所长"
				,"监管民警","分管副所长","所长"
				//3级 
				,"监管民警","分管副大队长","大队长","分管负责人"
				//4级
				,"分管局领导","分管局局长"
		};
		String units[] = new String[] {
				//1级 五个煤矿
				"跃进煤矿","跃进煤矿","跃进煤矿","跃进煤矿","跃进煤矿"
				,"潘家冲煤矿","潘家冲煤矿","潘家冲煤矿","潘家冲煤矿","潘家冲煤矿"
				,"五陂煤矿","五陂煤矿","五陂煤矿","五陂煤矿","五陂煤矿"
				,"久安爆破工程","久安爆破工程","久安爆破工程","久安爆破工程","久安爆破工程"
				,"神威爆破工程","神威爆破工程","神威爆破工程","神威爆破工程","神威爆破工程"
				//2级 四个派出所
				,"安源派出所","安源派出所","安源派出所"
				,"安源派出所"/*,"安源派出所","安源派出所"*/
				,"五陂派出所","五陂派出所","五陂派出所"
				,"城郊派出所","城郊派出所","城郊派出所"
				,"青山派出所","青山派出所","青山派出所"
				//3级 安源公安局
				,"安源公安分局","安源公安分局","安源公安分局","安源公安分局"
				//4级 
				,"萍乡公安局","萍乡公安局"
		};
		String parentUnits[] = new String[]{
				"安源派出所","安源派出所","安源派出所","安源派出所","安源派出所"
				,"安源派出所","安源派出所","安源派出所","安源派出所","安源派出所"
				,"五陂派出所","五陂派出所","五陂派出所","五陂派出所","五陂派出所"
				,"城郊派出所","城郊派出所","城郊派出所","城郊派出所","城郊派出所"
				,"青山派出所","青山派出所","青山派出所","青山派出所","青山派出所"
				//2级 四个派出所
				,"安源公安分局","安源公安分局","安源公安分局"
				,"安源公安分局"/*,"安源派出所","安源派出所"*/
				,"安源公安分局","安源公安分局","安源公安分局"
				,"安源公安分局","安源公安分局","安源公安分局"
				,"安源公安分局","安源公安分局","安源公安分局"
				//3级 安源公安局
				,"萍乡公安局","萍乡公安局","萍乡公安局","萍乡公安局"
				//4级 
				,"",""
		};
		int ranks[] = new int[] {
				//1级 五个煤矿
				1,1,1,1,1
				,1,1,1,1,1
				,1,1,1,1,1
				,1,1,1,1,1
				,1,1,1,1,1
				//2级 四个派出所
				,2,2,2
				,2/*,2,2*/
				,2,2,2
				,2,2,2
				,2,2,2
				//3级 
				,3,3,3,3
				//4级
				,4,4
		};
		for(int i=0;i<userIds.length;i++) {
			User user = new User();
			user.setUserId(userIds[i]);
			user.setName(names[i]);
			user.setPhone("15879447513");
			user.setPosition(positions[i]);
			user.setPsw("123");
			user.setScope("安源公安分局");
			user.setUnit(units[i]);
			user.setRank(ranks[i]);
			user.setTime(Tool.time());
			user.setParentUnit(parentUnits[i]);
			//user.setHeadImg("img/heads/" + (i%39+4) + ".jpg");
			user.setHeadImg("img/heads/common.jpg");
			dao.saveEntity(user);
		}
	}
	
	
	/*public void test2() {
		RelativeHelper rh = new RelativeHelper(dao, service);
		String rst = rh.getUserIdsByUnitNames(1, "跃进煤矿", "五陂煤矿");
		System.out.println(rst);
		rst = rh.getUserNamesByUserIds(rst);
		System.out.println(rst);
	}*/
}
