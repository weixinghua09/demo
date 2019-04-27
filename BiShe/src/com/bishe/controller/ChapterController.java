package com.bishe.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bishe.entity.EnglishType;
import com.bishe.entity.MathTypeChapter;
import com.bishe.entity.PoliticsType;
import com.bishe.entity.StuEngTypeGrade;
import com.bishe.entity.StuMathTypeGrade;
import com.bishe.entity.StuPoliticsTypeGrade;
import com.bishe.service.ChapterServiceImpl;
import com.bishe.service.StuServiceImpl;

@Controller
@RequestMapping("/chapter")
public class ChapterController {
	@Resource
	private ChapterServiceImpl chapterServiceImpl;
	@Resource
	private StuServiceImpl stuServiceImpl;
	
	/**
	 * @desc 通过id查询学生所考数学章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/progress")
	public String  mathChapter(@RequestParam("stuId") int stuId,Model model) throws Exception{
		int math = this.stuServiceImpl.findMathById(stuId);
		List<MathTypeChapter> ml = chapterServiceImpl.findById(math);
		model.addAttribute("ml",ml);
		model.addAttribute("stuId", stuId);
		return "progress";
	}
	
	/**
	 * @desc 通过id查询学生所考英语章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/english")
	public String  english(@RequestParam("stuId") int stuId,Model model) throws Exception{
		List<EnglishType> el = chapterServiceImpl.findEnglishById();
		model.addAttribute("el",el);
		model.addAttribute("stuId", stuId);
		return "english";
	}
	
	/**
	 * @desc 通过id查询学生所考政治章节
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/politics")
	public String  politics(@RequestParam("stuId") int stuId,Model model) throws Exception{
		List<PoliticsType> pl = chapterServiceImpl.findPoliticsById();
		model.addAttribute("pl",pl);
		model.addAttribute("stuId", stuId);
		return "politics";
	}
	
	/**
	 * @desc 学生保存数学所学章节信息
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/mathchapter",method=RequestMethod.POST)
	public String  mathChapter(StuMathTypeGrade smtg ,Model model,HttpServletRequest request) throws Exception{
		this.chapterServiceImpl.saveMathTypeGrade(smtg);
		int math = this.stuServiceImpl.findMathById(smtg.getStuId());
		List<MathTypeChapter> ml = chapterServiceImpl.findById(math);
		model.addAttribute("ml",ml);
		model.addAttribute("stuId", smtg.getStuId());
		return "progress";
	}
	
	/**
	 * @desc 学生保存英语所学章节信息
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/englishchapter",method=RequestMethod.POST)
	public String  englishChapter(StuEngTypeGrade setg ,Model model,HttpServletRequest request) throws Exception{
		this.chapterServiceImpl.saveEnglishTypeGrade(setg);
		List<EnglishType> el = chapterServiceImpl.findEnglishById();
		model.addAttribute("el",el);
		model.addAttribute("stuId", setg.getStuId());
		return "english";
	}
	
	/**
	 * @desc 学生保存政治所学章节信息
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/politicschapter",method=RequestMethod.POST)
	public String  politicsChapter(StuPoliticsTypeGrade sptg ,Model model,HttpServletRequest request) throws Exception{
		this.chapterServiceImpl.savePoliticsTypeGrade(sptg);
		List<PoliticsType> pl = chapterServiceImpl.findPoliticsById();
		model.addAttribute("pl",pl);
		model.addAttribute("stuId", sptg.getStuId());
		return "politics";
	}
	
	/**
	 * @desc 专业课
	 * @param 原源
	 * @createDate 2019年2月13日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/profession")
	public String  profession(@RequestParam("stuId") int stuId,Model model) throws Exception{
		model.addAttribute("stuId", stuId);
		return "profession";
	}
	
}
