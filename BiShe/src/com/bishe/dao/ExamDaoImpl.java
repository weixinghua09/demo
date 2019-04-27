package com.bishe.dao;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.bishe.entity.ProfessionGrade;
import com.bishe.entity.StuEngGrade;
import com.bishe.entity.StuMathGrade;
import com.bishe.entity.StuPoliticsGrade;
import com.bishe.entity.StuPoliticsTypeGrade;

@Repository
public class ExamDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	/**
	 * @desc 学生保存专业课成绩
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  saveProfessionGrade(ProfessionGrade pg) throws Exception{
		this.sessionFactory.getCurrentSession().save(pg);
	}
	
	/**
	 * @desc 学生保存数学成绩
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  saveMathGrade(StuMathGrade smg) throws Exception{
		this.sessionFactory.getCurrentSession().save(smg);
	}
	
	/**
	 * @desc 学生保存英语成绩
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  saveEnglishGrade(StuEngGrade seg) throws Exception{
		this.sessionFactory.getCurrentSession().save(seg);
	}
	
	/**
	 * @desc 学生保存政治成绩
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  savePoliticsGrade(StuPoliticsGrade spg) throws Exception{
		this.sessionFactory.getCurrentSession().save(spg);
	}
}
