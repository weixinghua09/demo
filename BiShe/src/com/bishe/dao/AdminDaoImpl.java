package com.bishe.dao;


import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.bishe.entity.Student;
import com.bishe.entity.Type;
import com.bishe.dao.BaseDao;
import com.bishe.entity.Admin;
import com.bishe.entity.Student;
@Repository
public class AdminDaoImpl extends BaseDao<Admin>{
/**
 * 按id查询并锁定相应的用户
 * @param id
 * @throws Exception
 */
	public void lockUser(int id)throws Exception{
		SessionFactory sessionFactory =super.getSessionFactory();
		String hql="update User user set user.state=:state where user.userId=:id";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("state", 2);
		query.setParameter("id", id);
		query.executeUpdate();
		
	}
	
	
/**
 * 查找单一管理员
 * @author 宋亚楼
 * @question 不能使用BaseDao的findOne方法 怀疑是hql语句
 */
	public Admin findAdmin(String account)throws Exception{
		SessionFactory sessionFactory = super.getSessionFactory();
		String hql="from Admin where adminAccount = :account";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("account", account);
		Object o = query.uniqueResult();
		if(o==null) {
			return null;
		} else {
			return (Admin)o;
		}
		
	}
	/**
	 * 按用户名和email查找用户
	 * @param account
	 * @return
	 * @throws Exception
	 * @author 宋亚楼
	 */
	
	public Student findStudent(String account)throws Exception{
		SessionFactory sessionFactory=super.getSessionFactory();
		String hql="from User as user where user.userName like :name or user.userEmail like :email";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("name", "%"+account+"%");
		query.setParameter("email", "%"+account+"%");
		if(query.list().size()!=0) {
		 return (Student) query.list().get(0);
		}else {
			return null;
		}
	}
	/**
	 * 更新管理员登录信息 （登陆时间 上次登录时间 登录次数）
	 * @param u
	 * @return 更新成功 返回 用户ID 否则 返回 -1
	 */
	public void updateLoginInfo(Object [] params) throws Exception{
		String hql = "update Admin as ad set ad.loginTime= ? , ad.lastLoginTime= ?,ad.loginCount= ?,ad.lastLoginIp= ?,ad.loginIp= ? where ad.adminId=?";
		
			super.updateByProperty(hql, params);
	}


	public Student findAllStudent(String account) {
		// TODO 自动生成的方法存根
		return null;
	}

	/**
	 * 添加标签
	 * @param u
	 * @return 
	 */
	public void saveTag(Type tag) {
		SessionFactory sessionFactory = super.getSessionFactory();
		sessionFactory.getCurrentSession().save(tag);
	}


	public List<Type> findAllTag() {
		SessionFactory sessionFactory = super.getSessionFactory();
		String hql ="from Type";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	

}
