package com.bishe.dao;

import java.util.List;

import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.bishe.entity.EnglishType;
import com.bishe.entity.MathTypeChapter;
import com.bishe.entity.PoliticsType;
import com.bishe.entity.StuEngTypeGrade;
import com.bishe.entity.StuMathTypeGrade;
import com.bishe.entity.StuPoliticsTypeGrade;
import com.bishe.entity.Student;


@Repository
public class ChapterDaoImpl extends BaseDao<StuMathTypeGrade> {
	@Resource
	private SessionFactory sessionFactory;
	
	/**
	 * @desc 通过id查询学生所考数学章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public List<MathTypeChapter> findById(int math) throws Exception{
		String hql = null;
		if(math == 1){
		    hql = " from MathTypeChapter  where math1 = 1";
		}if(math == 2){
			hql = " from MathTypeChapter  where math2 = 1";
		}if(math == 3){
			hql = " from MathTypeChapter  where math3 = 1";
		}
		@SuppressWarnings("rawtypes")
		Query query = (Query)this.sessionFactory.getCurrentSession().createQuery(hql);
	    @SuppressWarnings("unchecked")
		List<MathTypeChapter> ml = query.list();
	    return ml;
	}
	
	/**
	 * @desc 通过id查询学生所考英语章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public List<EnglishType> findEnglishById() throws Exception{
		String hql = " from EnglishType";
		@SuppressWarnings("rawtypes")
		Query query = (Query)this.sessionFactory.getCurrentSession().createQuery(hql);
	    @SuppressWarnings("unchecked")
		List<EnglishType> el = query.list();
	    return el;
	}
	
	/**
	 * @desc 通过id查询学生所考政治章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public List<PoliticsType> findPoliticsById() throws Exception{
		String hql = " from PoliticsType";
		@SuppressWarnings("rawtypes")
		Query query = (Query)this.sessionFactory.getCurrentSession().createQuery(hql);
	    @SuppressWarnings("unchecked")
		List<PoliticsType> pl = query.list();
	    return pl;
	}
	
	/**
	 * @desc 学生保存数学学习章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public void  saveMathTypeGrade( StuMathTypeGrade smtg) throws Exception{
		this.save(smtg);
	}
	
	/**
	 * @desc 学生保存英语学习章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public void  saveEngTypeGrade( StuEngTypeGrade setg) throws Exception{
		this.sessionFactory.getCurrentSession().save(setg);
	}
	
	/**
	 * @desc 学生保存政治学习章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public void  savePoliticsTypeGrade( StuPoliticsTypeGrade sptg) throws Exception{
		this.sessionFactory.getCurrentSession().save(sptg);
	}
}
