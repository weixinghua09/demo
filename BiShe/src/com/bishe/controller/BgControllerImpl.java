package com.bishe.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bishe.entity.Comment;
import com.bishe.entity.EnglishType;
import com.bishe.entity.MathTypeChapter;
import com.bishe.entity.PoliticsType;
import com.bishe.service.BgServiceImpl;
import com.bishe.service.StuServiceImpl;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
@RequestMapping("/bg")
public class BgControllerImpl {
	@Resource
	private BgServiceImpl bgServiceImpl;
	
	/**
	 * @desc 查询评论
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/comment")
	public String  comment(Model model) throws Exception{
		List<Comment> cl = this.bgServiceImpl.findComment();
		Gson g=new Gson();
		model.addAttribute("list", null);
		model.addAttribute("list", cl);
		return "bg_searchClass";
	}
	
	/**
	 * @desc 删除评论
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteComment")
	public String  deleteComment(@RequestParam("str")String str,Model model) throws Exception{
		if(str != null){
			Gson g = new Gson();
			List<Comment> l = g.fromJson(str, new TypeToken<List<Comment>>() {}.getType());
			for(Comment c:l){
				this.bgServiceImpl.deleteComment(c.getId());
			}
		}
		List<Comment> cl = this.bgServiceImpl.findComment();
		Gson g=new Gson();
		model.addAttribute("list", null);
		model.addAttribute("list", cl);
		return "bg_searchClass"; 
	}
	
	/**
	 * @desc 查询章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/chapter")
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
