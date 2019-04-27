package com.bishe.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bishe.dao.ChapterDaoImpl;
import com.bishe.entity.EnglishType;
import com.bishe.entity.MathTypeChapter;
import com.bishe.entity.PoliticsType;
import com.bishe.entity.StuEngTypeGrade;
import com.bishe.entity.StuMathTypeGrade;
import com.bishe.entity.StuPoliticsTypeGrade;

@Service
@Transactional(readOnly=false)
public class ChapterServiceImpl {
	@Resource
	private ChapterDaoImpl chapterDaoImpl;
	
	/**
	 * @desc 通过id查询学生所考数学章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public List<MathTypeChapter> findById( int math) throws Exception{
		return chapterDaoImpl.findById(math);		
	}
	
	/**
	 * @desc 通过id查询学生所考英语章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public List<EnglishType> findEnglishById() throws Exception{
		return chapterDaoImpl.findEnglishById();		
	}
	
	/**
	 * @desc 通过id查询学生所考政治章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public List<PoliticsType> findPoliticsById() throws Exception{
		return chapterDaoImpl.findPoliticsById();		
	}
	
	/**
	 * @desc 学生保存数学学习章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public void saveMathTypeGrade( StuMathTypeGrade smtg ) throws Exception{
		this.chapterDaoImpl.saveMathTypeGrade(smtg);	
	}
	
	/**
	 * @desc 学生保存英语学习章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public void saveEnglishTypeGrade( StuEngTypeGrade setg ) throws Exception{
		this.chapterDaoImpl.saveEngTypeGrade(setg);	
	}
	
	/**
	 * @desc 学生保存政治学习章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public void savePoliticsTypeGrade( StuPoliticsTypeGrade sptg ) throws Exception{
		this.chapterDaoImpl.savePoliticsTypeGrade(sptg);	
	}
}
