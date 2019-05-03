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
import com.bishe.entity.Comment;
import com.bishe.entity.EnglishType;
import com.bishe.entity.MathTypeChapter;
import com.bishe.entity.PoliticsType;
import com.bishe.entity.Student;
import com.bishe.entity.Type;
import com.bishe.service.AdminServiceImpl;
import com.bishe.service.BgServiceImpl;

@Controller
@RequestMapping("/bg_admin")
public class bg_AdminController {
	@Resource
	private AdminServiceImpl adminServiceImpl;
	@Resource
	private BgServiceImpl bgServiceImpl;
	
	/**
	 *登陆后台
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
	 * @desc 查询用户列表
	 * @param 魏兴华
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/searchUser")
	public String findUser(Model model) throws Exception{
		List<Student> studentList = this.bgServiceImpl.findAllUser();
		model.addAttribute("studentList", studentList);
		return "bg_searchUser";
	}
	
	/**
	 * @desc 添加管理员跳转
	 * @author 魏兴华
	 * @createDate 2019年3月9日
	 * @return  bg_addAdmin
	 */
	@RequestMapping(value="/toAddAdmin",method=RequestMethod.GET)
	public String toAddAdmin(HttpServletRequest request,HttpSession session,Model model) throws Exception{
		System.out.println("跳转");
		return "bg_addAdmin";
	}
	
	/**
	 * @desc 添加管理员
	 * @author 魏兴华
	 * @createDate 2019年3月9日
	 * @return  bg_tagList
	 */
	@RequestMapping(value="/addAdmin",method=RequestMethod.GET)
	public String addAdmin(HttpServletRequest request,HttpSession session,Model model) throws Exception{
		System.out.println("添加管理员");
		String name = request.getParameter("name");
		String adminPwd = request.getParameter("adminPwd");
		Admin admin = new Admin();
		admin.setName(name);
		admin.setAdminPwd(adminPwd);
		adminServiceImpl.saveAdmin(admin);
		List<Admin> adminList = this.adminServiceImpl.findAlladmin();
		model.addAttribute("adminList", adminList);
		System.out.println("添加并显示列表");
		return "bg_searchAdmin";
	}
	
	/**
	 * @desc 查看管理员列表
	 * @author 魏兴华
	 * @createDate 2019年3月9日
	 * @return  bg_tagList
	 */
	@RequestMapping(value="/searchAdmin",method=RequestMethod.GET)
	public String searchAdmin(HttpSession session,Model model) throws Exception{
		List<Admin> adminList = this.adminServiceImpl.findAlladmin();
		model.addAttribute("adminList", adminList);
		return "bg_searchAdmin";
	}
	
	/**
	 * @desc 添加标签
	 * @author 魏兴华
	 * @createDate 2019年3月9日
	 * @return  bg_tagList
	 */
	@RequestMapping(value="/addTag",method=RequestMethod.GET)
	public String addForumById(@RequestParam("tagName") String tagName,HttpSession session,Model model) throws Exception{
		System.out.println("添加标签");
		Type tag = new Type();
		tag.setName(tagName);
		adminServiceImpl.saveTag(tag);
		List<Type> tagList = this.adminServiceImpl.findAllTag();
		model.addAttribute("tagList", tagList);
		System.out.println("添加并显示列表");
		return "bg_searchTag";
	}
	
	/**
	 * @desc 删除单个标签
	 * @author 魏兴华
	 * @createDate 2019年3月9日
	 * @return  bg_tagList
	 */
	@RequestMapping(value="/deleteTag",method=RequestMethod.GET)
	public String deleteTagById(@RequestParam("id") int id,HttpSession session,Model model) throws Exception{
		System.out.println("删除标签");
		Type tag = new Type();
		tag.setId(id);
		adminServiceImpl.deleteTag(tag);
		List<Type> tagList = this.adminServiceImpl.findAllTag();
		model.addAttribute("tagList", tagList);
		System.out.println("显示列表");
		return "bg_searchTag";
	}
	

	/**
	 * @desc 查询评论列表
	 * @param 魏兴华
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/comment")
	public String comment(Model model) throws Exception{
		List<Comment> commentList = this.bgServiceImpl.findComment();
		model.addAttribute("commentList", null);
		model.addAttribute("commentList", commentList);
		return "bg_searchComment";
	}
	
	/**
	 * @desc 删除单个评论
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteComment")
	public String  deleteComment(@RequestParam("id") int id,Model model) throws Exception{
		
		System.out.println("删除单个评论");
		Comment c  = new Comment(); 
		c.setId(id);
		bgServiceImpl.deleteComment(c);
		List<Comment> cl = this.bgServiceImpl.findComment();
		model.addAttribute("commentList", cl);
		System.out.println("显示评论列表");
		return "bg_searchComment"; 
	}
	
	/**
	 * @desc 查询章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/searchChapter")
	public String  chapter(Model model) throws Exception{
		
		List<MathTypeChapter> mcl = this.bgServiceImpl.findMathChapter();
		List<EnglishType> ecl = this.bgServiceImpl.findEnglishChapter();
		List<PoliticsType> pcl = this.bgServiceImpl.findPoliticsChapter();
		Gson g=new Gson();
		model.addAttribute("list", null);
		model.addAttribute("mlist", mcl);
		model.addAttribute("elist", ecl);
		model.addAttribute("plist", pcl);
		return "bg_searchClassType";
	}
	
	/**
	 * @desc 删除章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteChapter")
	public String  deleteChapter(@RequestParam("str")String str,Model model) throws Exception{
		if(str != null){
			Gson g = new Gson();
			if(str.contains("数学")){
				List<MathTypeChapter> mtpl = g.fromJson(str, new TypeToken<List<MathTypeChapter>>() {}.getType());
				for(MathTypeChapter mtp:mtpl){
					this.bgServiceImpl.deleteMathChapter(mtp.getId());
				}
			}if(str.contains("英语")){
				List<EnglishType> etl = g.fromJson(str, new TypeToken<List<EnglishType>>() {}.getType());
				for(EnglishType et:etl){
					this.bgServiceImpl.deleteEnglishChapter(et.getId());
				}
			}if(str.contains("政治")){
				List<PoliticsType> ptl = g.fromJson(str, new TypeToken<List<PoliticsType>>() {}.getType());
				for(PoliticsType pt:ptl){
					this.bgServiceImpl.deletePoliticsChapter(pt.getId());
				}
			}
		}
		List<MathTypeChapter> mcl = this.bgServiceImpl.findMathChapter();
		List<EnglishType> ecl = this.bgServiceImpl.findEnglishChapter();
		List<PoliticsType> pcl = this.bgServiceImpl.findPoliticsChapter();
		Gson g=new Gson();
		model.addAttribute("list", null);
		model.addAttribute("mlist", mcl);
		model.addAttribute("elist", ecl);
		model.addAttribute("plist", pcl);
		return "bg_searchClassType";
	}
	
	/**
	 * @desc 跳转到添加章节页面
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/tiaozhuan")
	public String  add(Model model) throws Exception{
		return "bg_addClassType";
	}
	
	/**
	 * @desc 添加章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/addChapter",method=RequestMethod.POST)
	public String  addChapter(@RequestParam("a")String a,@RequestParam("type")String type,Model model,HttpServletRequest request) throws Exception{
		if(a.equals("1")){
			MathTypeChapter mtp = new MathTypeChapter();
			mtp.setType(type);
			mtp.setMath1(1);
			mtp.setMath2(1);
			mtp.setMath3(1);
			this.bgServiceImpl.saveMathType(mtp);
		}if(a.equals("2")){
			EnglishType et = new EnglishType();
			et.setType(type);
			this.bgServiceImpl.saveEngType(et);
		}if(a.equals("3")){
			PoliticsType pt = new PoliticsType();
			pt.setType(type);
			this.bgServiceImpl.savePoliticsType(pt);
		}
		return "bg_addClassType";
	}
	
}
