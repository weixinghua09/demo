package com.bishe.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.bishe.entity.Admin;
import com.bishe.entity.Article;
import com.bishe.entity.Student;
import com.bishe.entity.Type;
import com.bishe.service.AdminServiceImpl;

@Controller
@RequestMapping("/bg_admin")
public class bg_AdminController {
	@Resource
	private AdminServiceImpl adminServiceImpl;
	
	/**
	 *登陆
	 * @author 魏兴华
	 *
	 * @return index
	 * @throws Exception 
	 */
	@RequestMapping(value="/bglogin",method=RequestMethod.POST)
	public String BgLogin(@RequestParam("bg_account")String bg_account,
							@RequestParam("bg_pwd")String bg_pwd,
							Model model,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception {
		
		return "bg_index";
	}
	
	/**
	 * @desc 添加标签
	 * @author 魏兴华
	 * @createDate 2019年3月9日
	 * @return  bg_tagList
	 */
	@RequestMapping(value="/addTag",method=RequestMethod.GET)
	public String deleteForumById(@RequestParam("tagName") String tagName,HttpSession session,Model model) throws Exception{
		System.out.println("添加标签");
		Type tag = new Type();
		tag.setName(tagName);
		adminServiceImpl.saveTag(tag);
		List<Type> tagList = this.adminServiceImpl.findAllTag();
		model.addAttribute("tagList", tagList);
		System.out.println("添加并显示列表");
		return "bg_searchTag";
	}
	
}
