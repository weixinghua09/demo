package com.bishe.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.bishe.entity.Article;
import com.bishe.entity.Student;
import com.bishe.dao.BaseDao;

@Repository
public class StuDaoImpl extends BaseDao<Student>{
	@Resource
	private SessionFactory sessionFactory;
	

		/**
		 * 添加用户角色项
		 * @param urr
		 * @return
		 * @throws Exception
		 */
		public int saveStu(Student stu)throws Exception {
			SessionFactory sessionFactory = super.getSessionFactory();
			sessionFactory.getCurrentSession().save(stu);
			return stu.getstuId();
			
		}
		
		
		/**
		 * 根据stuId查询用户
		 * @param stuId
		 * @return Student
		 * @throws Exception
		 */
		public Student findById(int stuId) throws Exception{
			return this.get(stuId);
		}

		
		public List<Article> findAllForumByStuId(int stuId) {
			SessionFactory sessionFactory = super.getSessionFactory();
			String hql ="from Article where stuId = ?";
			Query query=sessionFactory.getCurrentSession().createQuery(hql);
			query.setParameter(0, stuId);
			return query.list();
		}

		public List<Article> findAllForum() {
			// TODO 自动生成的方法存根
			SessionFactory sessionFactory = super.getSessionFactory();
			String hql ="from Article";
			Query query=sessionFactory.getCurrentSession().createQuery(hql);
			return query.list();
		}

}
