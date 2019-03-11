package com.bishe.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.bishe.entity.Article;
import com.bishe.entity.Student;
import com.bishe.service.AdminServiceImpl;
import com.bishe.service.ForumServiceImpl;


@Controller
@RequestMapping("/bg_common")
public class bg_CommonController {
	@Resource
	private AdminServiceImpl adminServiceImpl;
	@Resource
	private ForumServiceImpl forumServiceImpl;
	
	@RequestMapping(value="/tobglogin")
	private String openview() {
		return "bg_login";
	}
	
	/**
	 * 检索数据库中所有文章
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/bggoSearchArticle")
	public String goSearchArticle(Model model) {
		List <Article> articleList= forumServiceImpl.findAllForum();
		for(int i = 0;i < articleList.size(); i ++){
			System.out.println(articleList.get(i));
		}
		model.addAttribute("articleList", articleList);
		return "bg_searchArticle";
	}
	
	/**
	 * @desc 管理员删除单个文章
	 * @author 魏兴华
	 * @createDate 2019年3月4日
	 * @return  bg_searchArticle
	 */
	@RequestMapping(value="/deleteForum",method=RequestMethod.GET)
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
		List<Article> articleList = forumServiceImpl.findAllForum();
		model.addAttribute("articleList",articleList);
		System.out.println("删除成功");
		return "bg_searchArticle";
	}
	
	/** 添加标签
	 * @desc 
	 * @author 魏兴华
	 * @createDate 2019年3月9日
	 * @return  bg_searchArticle
	 */
	@RequestMapping(value="/bggoAddTag")
	public String goAddTag() {
		return "bg_addTag";
	}	

}
