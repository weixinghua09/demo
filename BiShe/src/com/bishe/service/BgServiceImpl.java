package com.bishe.service;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.query.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bishe.dao.BgDaoImpl;
import com.bishe.dao.ChapterDaoImpl;
import com.bishe.entity.Comment;
import com.bishe.entity.EnglishType;
import com.bishe.entity.MathTypeChapter;
import com.bishe.entity.PoliticsType;
import com.bishe.entity.Student;

@Service
@Transactional(readOnly=false)
public class BgServiceImpl {
	@Resource
	private BgDaoImpl bgDaoImpl;
	
	/**
	 * @desc  查询评论
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public List<Comment>  findComment() throws Exception{
		return this.bgDaoImpl.findComment();
	}
	
	/**
	 * @desc  删除评论
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void deleteComment(Comment c) throws Exception{
		this.bgDaoImpl.deleteComment(c);
	}
	
	/**
	 * @desc  查询数学章节
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public List<MathTypeChapter>  findMathChapter() throws Exception{
		return this.bgDaoImpl.findMathChapter();
	}
	
	/**
	 * @desc  查询政治章节
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public List<PoliticsType>  findPoliticsChapter() throws Exception{
		return this.bgDaoImpl.findPoliticsChapter();
	}
	
	/**
	 * @desc  查询英语章节
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public List<EnglishType>  findEnglishChapter() throws Exception{
		return this.bgDaoImpl.findEnglishChapter();
	}
	
	/**
	 * @desc  删除数学章节
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  deleteMathChapter(int id) throws Exception{
		this.bgDaoImpl.deleteMathChapter(id);
	}
	
	/**
	 * @desc  删除英语章节
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  deleteEnglishChapter(int id) throws Exception{
		this.bgDaoImpl.deleteEnglishChapter(id);
	}
	
	/**
	 * @desc  删除政治章节
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	public void  deletePoliticsChapter(int id) throws Exception{
		this.bgDaoImpl.deletePoliticsChapter(id);
	}
	
	/**
	 * @desc 添加数学章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public void  saveMathType( MathTypeChapter mtp) throws Exception{
		this.bgDaoImpl.saveMathType(mtp);
	}
	
	/**
	 * @desc 添加英语学习章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public void  saveEngType( EnglishType et) throws Exception{
		this.bgDaoImpl.saveEngType(et);
	}
	
	/**
	 * @desc 添加政治学习章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	public void  savePoliticsType(PoliticsType pt ) throws Exception{
		this.bgDaoImpl.savePoliticsType(pt);
	}

	public List<Student> findAllUser() {
		return this.bgDaoImpl.findAllUser();
	}
	
}
