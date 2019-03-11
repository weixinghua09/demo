package com.bishe.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bishe.dao.StuDaoImpl;
import com.bishe.entity.Article;
import com.bishe.entity.Student;


@Service
@Transactional(readOnly=false)
public class StuServiceImpl {

	@Resource
	private StuDaoImpl stuDaoImpl;
	
	public int registerUser(Student u) throws Exception{
		this.stuDaoImpl.save(u);
		return u.getstuId();
	}
	
	public Student findById(int stuId) throws Exception{
		System.out.println("service");
		return stuDaoImpl.findById(stuId);
		
	}

	public List<Article> findAllForumByStuId(int stuId) {
		List<Article> articleList = stuDaoImpl.findAllForumByStuId(stuId);
		// TODO 自动生成的方法存根
		return articleList;
	}
	
	public List<Article> findAllForum() {
		List<Article> articleList = stuDaoImpl.findAllForum();
		// TODO 自动生成的方法存根
		return articleList;
	}
	
}
