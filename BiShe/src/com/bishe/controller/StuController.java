package com.bishe.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bishe.entity.Student;
import com.bishe.entity.Type;
import com.bishe.service.AdminServiceImpl;
import com.bishe.service.ForumServiceImpl;
import com.bishe.service.StuServiceImpl;
import com.bishe.entity.Article;

@Controller
@RequestMapping("/student")
public class StuController {
	@Resource
	private StuServiceImpl stuServiceImpl;
	@Resource
	private AdminServiceImpl adminServiceImpl;
	@Resource
	private ForumServiceImpl forumServiceImpl;
	
	/**
	 * 
	 * @desc 注册
	 * @author 原源
	 * @createDate 2019年2月2日
	 * @return 
	 */
	@RequestMapping(value="/registe",method=RequestMethod.POST)
	public void  regist(Model model) throws Exception{
		Student stu = null;
		stuServiceImpl.registerUser(stu);
		model.addAttribute("info", "registeErro");
	}
	
	/**
	 * 
	 * @desc 个人中心
	 * @author 原源
	 * @createDate 2019年2月2日
	 * @return person
	 */
	@RequestMapping(value="/person")
	public String  index(@RequestParam("stuId") int stuId,Model model) throws Exception{
		System.out.println("controller1");
		Student stu = stuServiceImpl.findById(stuId);
		System.out.println("controller1");
		model.addAttribute("stu",stu);
		return "person";
	}
	
	/**
	 * 
	 * @desc 跳转写文章页
	 * @author 魏兴华
	 * @createDate 2019年3月4日
	 * @return forum-edit
	 */
	@RequestMapping(value="/editForum")
	public String editForum(@RequestParam("stuId") int stuId,Model model) throws Exception{
		System.out.println("正在跳转编辑页");
		Student stu = stuServiceImpl.findById(stuId);
		System.out.println(stu.getstuId());
		List<Type> tagList = this.adminServiceImpl.findAllTag();
		System.out.println("跳转完成");
		model.addAttribute("stu",stu);
		model.addAttribute("tagList", tagList);
		return "forum-edit";
	}
	
	/**
	 * 
	 * @desc 查看自己发布的帖子
	 * @author 魏兴华
	 * @createDate 2019年3月5日
	 * @return person
	 */
	@RequestMapping(value="/allMyForum")
	public String allMyForum(@RequestParam("stuId") int stuId,Model model) throws Exception{
		System.out.println("查询用户所有文章");
		List<Article> articleList = stuServiceImpl.findAllForumByStuId(stuId);
		Student stu = stuServiceImpl.findById(stuId);
		System.out.println("查询完成");
		model.addAttribute("stu",stu);
		model.addAttribute("articleList", articleList);
		return "person_article";
	}
	
	/**
	 * 
	 * @desc 搜索文章
	 * @author 魏兴华
	 * @createDate 2019年3月5日
	 * @return person
	 */
	@RequestMapping(value="/searchForum")
	public String searchForum(@RequestParam("stuId") int stuId,@RequestParam("search") String search,Model model) throws Exception{
		System.out.println("根据关键字查询用户所有文章");
		System.out.println(search);
		System.out.println(stuId);
		List<Article> articleList = forumServiceImpl.findAllForumByWord(search);
		Student stu = stuServiceImpl.findById(stuId);
		model.addAttribute("search",search);
		model.addAttribute("stu",stu);
		model.addAttribute("articleList", articleList);
		return "content";
	}
	
}