package com.bishe.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.bishe.entity.Comment;
import com.bishe.entity.EnglishType;
import com.bishe.entity.MathTypeChapter;
import com.bishe.entity.PoliticsType;
import com.bishe.entity.StuEngTypeGrade;
import com.bishe.entity.StuPoliticsTypeGrade;
import com.bishe.entity.Student;

@Repository
public class BgDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	/**
	 * @desc  查询评论
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public List<Comment>  findComment() throws Exception{
		String hql = " from Comment";
		@SuppressWarnings("rawtypes")
		Query query = (Query)this.sessionFactory.getCurrentSession().createQuery(hql);
	    @SuppressWarnings("unchecked")
		List<Comment> cl = query.list();
	    return cl;
	}
	
	/**
	 * @desc  删除评论
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  deleteComment(Comment c) throws Exception{
		int id = c.getId();
		String hql ="delete Comment where id = :id";
		@SuppressWarnings("rawtypes")
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id",id);
		query.executeUpdate();
	}
	
	/**
	 * @desc  查询数学章节
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public List<MathTypeChapter>  findMathChapter() throws Exception{
		String hql = " from MathTypeChapter";
		@SuppressWarnings("rawtypes")
		Query query = (Query)this.sessionFactory.getCurrentSession().createQuery(hql);
	    @SuppressWarnings("unchecked")
		List<MathTypeChapter> mtcl = query.list();
	    return mtcl;
	}
	
	/**
	 * @desc  查询英语章节
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public List<EnglishType>  findEnglishChapter() throws Exception{
		String hql = " from EnglishType";
		@SuppressWarnings("rawtypes")
		Query query = (Query)this.sessionFactory.getCurrentSession().createQuery(hql);
	    @SuppressWarnings("unchecked")
		List<EnglishType> etl = query.list();
	    return etl;
	}
	
	/**
	 * @desc  查询政治章节
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public List<PoliticsType>  findPoliticsChapter() throws Exception{
		String hql = " from PoliticsType";
		@SuppressWarnings("rawtypes")
		Query query = (Query)this.sessionFactory.getCurrentSession().createQuery(hql);
	    @SuppressWarnings("unchecked")
		List<PoliticsType> ptl = query.list();
	    return ptl;
	}
	
	/**
	 * @desc  删除数学章节
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  deleteMathChapter(int id) throws Exception{
		String hql ="delete MathTypeChapter  where id = :id";
		@SuppressWarnings("rawtypes")
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id",id);
		query.executeUpdate();
	}
	
	/**
	 * @desc  删除英语章节
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  deleteEnglishChapter(int id) throws Exception{
		String hql ="delete EnglishType  where id = :id";
		@SuppressWarnings("rawtypes")
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id",id);
		query.executeUpdate();
	}
	
	/**
	 * @desc  删除政治章节
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  deletePoliticsChapter(int id) throws Exception{
		String hql ="delete PoliticsType  where id = :id";
		@SuppressWarnings("rawtypes")
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id",id);
		query.executeUpdate();
	}
	
	/**
	 * @desc 添加数学章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public void  saveMathType( MathTypeChapter mtp) throws Exception{
		this.sessionFactory.getCurrentSession().save(mtp);
	}
	
	/**
	 * @desc 添加英语学习章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public void  saveEngType( EnglishType et) throws Exception{
		this.sessionFactory.getCurrentSession().save(et);
	}
	
	/**
	 * @desc 添加政治学习章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public void  savePoliticsType(PoliticsType pt ) throws Exception{
		this.sessionFactory.getCurrentSession().save(pt);
	}

	public List<Student> findAllUser() {
		String hql = " from Student";
		@SuppressWarnings("rawtypes")
		Query query = (Query)this.sessionFactory.getCurrentSession().createQuery(hql);
	    @SuppressWarnings("unchecked")
		List<Student> studentList = query.list();
	    return studentList;
	}
	
	
	
}
