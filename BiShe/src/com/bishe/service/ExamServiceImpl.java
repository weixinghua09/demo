package com.bishe.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bishe.dao.ChapterDaoImpl;
import com.bishe.dao.ExamDaoImpl;
import com.bishe.entity.ProfessionGrade;
import com.bishe.entity.StuEngGrade;
import com.bishe.entity.StuMathGrade;
import com.bishe.entity.StuPoliticsGrade;

@Service
@Transactional(readOnly=false)
public class ExamServiceImpl {
	@Resource
	private ExamDaoImpl examDaoImpl;
	
	/**
	 * @desc 学生保存专业课成绩
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  saveProfessionGrade(ProfessionGrade pg) throws Exception{
		this.examDaoImpl.saveProfessionGrade(pg);
	}
	
	/**
	 * @desc 学生保存数学成绩
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  saveMathGrade(StuMathGrade smg) throws Exception{
		this.examDaoImpl.saveMathGrade(smg);
	}
	
	/**
	 * @desc 学生保存英语成绩
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  saveEnglishGrade(StuEngGrade seg) throws Exception{
		this.examDaoImpl.saveEnglishGrade(seg);
	}
	
	/**
	 * @desc 学生保存政治成绩
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  savePoliticsGrade(StuPoliticsGrade spg) throws Exception{
		this.examDaoImpl.savePoliticsGrade(spg);
	}
}
