package com.bishe.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.bishe.entity.Article;
import com.bishe.entity.Student;
import com.bishe.service.ForumServiceImpl;
import com.bishe.service.StuServiceImpl;


@Controller
@RequestMapping("/forum")
public class ForumController {
	@Resource
	private ForumServiceImpl forumServiceImpl;
	/**
	 * @desc 发布文章
	 * @author 魏兴华
	 * @createDate 2019年3月4日
	 * @return  forum-article
	 */
	@RequestMapping(value="/publish",method=RequestMethod.GET)
	public String publishForum(@RequestParam("stuId") int stuId,@RequestParam("title")String title,@RequestParam("content")String content,@RequestParam("tag") int tag,
			Model model) throws Exception{
		System.out.println("正在发布"+stuId);
		Article article = new Article();
		article.setstuId(stuId);
		article.setContent(content);
		article.setTitle(title);
		article.setTag(tag);
		article.setLikes(0);
		article.setCollections(0);
	 //设置 创建时间
		article.setDate(new Date()); 
		//写入数据库
		  try {
			this.forumServiceImpl.addArticle(article);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		model.addAttribute("artdetail",article);
		System.out.println("发布成功");
		return "forum-article";
	}
	
	/**
	 * @desc 用户删除单个文章
	 * @author 魏兴华
	 * @createDate 2019年3月4日
	 * @return  forum-article
	 */
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String deleteForumById(@RequestParam("id") int id,HttpSession session,Model model) throws Exception{
		System.out.println("正在删除");
		System.out.println(id);
		Article article = new Article();
		//数据库查询
		try {
			article = this.forumServiceImpl.findArticleById(id);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		//数据库中删除
		  try {
			this.forumServiceImpl.deleteArticle(article);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		List<Article> articleList = forumServiceImpl.findAllForumByStuId(article.getstuId());
		model.addAttribute("articleList",articleList);
		System.out.println("删除成功");
		return "person_article";
	}
	

	/**
	 * @desc 收藏文章
	 * @author 魏兴华
	 * @createDate 2019年3月4日
	 * @return  forum-article
	 */
	@RequestMapping(value="/collect",method=RequestMethod.GET)
	public String collectForumById(@RequestParam("id") int id,@RequestParam("search") String search,HttpSession session,Model model) throws Exception{
		System.out.println(id);
		System.out.println(search);
		Article article = new Article();
		//数据库查询
		try {
			article = this.forumServiceImpl.findArticleById(id);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		article.setCollections(article.getCollections()+1);
		//更新数据库
		  try {
			this.forumServiceImpl.updateArticle(article);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		List<Article> articleList = forumServiceImpl.findAllForumByWord(search);
		model.addAttribute("articleList",articleList);
		System.out.println("收藏成功");
		return "content";
	}
	/**
	 * @desc 点赞文章
	 * @author 魏兴华
	 * @createDate 2019年3月4日
	 * @return  forum-article
	 */
	@RequestMapping(value="/like",method=RequestMethod.GET)
	public String likeForumById(@RequestParam("id") int id,@RequestParam("search") String search,HttpSession session,Model model) throws Exception{
		System.out.println(id);
		System.out.println(search);
		Article article = new Article();
		//数据库查询
		try {
			article = this.forumServiceImpl.findArticleById(id);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		article.setLikes(article.getLikes()+1);
		//更新数据库
		  try {
			this.forumServiceImpl.updateArticle(article);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		List<Article> articleList = forumServiceImpl.findAllForumByWord(search);
		model.addAttribute("articleList",articleList);
		System.out.println("点赞成功");
		return "content";
	}
	

}


