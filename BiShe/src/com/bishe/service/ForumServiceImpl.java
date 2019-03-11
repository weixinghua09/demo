package com.bishe.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bishe.dao.ForumDaoImpl;
import com.bishe.entity.Answer;
import com.bishe.entity.Article;
import com.bishe.entity.Comment;

@Service
@Transactional(readOnly=false)
public class ForumServiceImpl  {
	
	@Resource
	private ForumDaoImpl forumDaoImpl;	
	
	
	
	/**
	 * 添加文章
	 * @author 魏兴华
	 * @param article
	 * @throws Exception
	 */
	public void addArticle(Article article) throws Exception {
		this.forumDaoImpl.saveArticle(article);
	}
	
	/**
	 * 删除单个文章
	 * @author 魏兴华
	 * @param article
	 * @throws Exception
	 */
	public void deleteArticle(Article article) {
		this.forumDaoImpl.deleteArticleById(article);
		// TODO 自动生成的方法存根
		
	}
	
	/**
	 * 根据stuId查询文章
	 * @author 魏兴华
	 * @param stuId
	 * @throws Exception
	 */
	public List<Article> findAllForumByStuId(int stuId) {
		// TODO 自动生成的方法存根
		List<Article> articleList = forumDaoImpl.findAllForum(stuId);
		return articleList;
	}
	/**
	 * 根据id查询文章
	 * @author 魏兴华
	 * @param id
	 * @throws Exception
	 */
	public Article findArticleById(int id) {
		// TODO 自动生成的方法存根
		Article article = forumDaoImpl.findArticleById(id);
		return article;
	}
	/**
	 * 查询所有文章
	 * @author 魏兴华
	 * @param id
	 * @throws Exception
	 */
	public List<Article> findAllForum() {
		// TODO 自动生成的方法存根
		List<Article> articleList = forumDaoImpl.findAllForum();
		return articleList;
	}

	/**
	 * 根据关键字查询所有文章
	 * @author 魏兴华
	 * @param id
	 * @throws Exception
	 */
	public List<Article> findAllForumByWord(String search) {
		// TODO 自动生成的方法存根
		List<Article> articleList = forumDaoImpl.findAllForumByWord(search);
		return articleList;
	}

	public void updateArticle(Article article)throws Exception  {
		this.forumDaoImpl.updateArticleById(article);
	}
	
}
