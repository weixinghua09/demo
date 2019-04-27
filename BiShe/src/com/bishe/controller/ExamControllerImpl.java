package com.bishe.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bishe.entity.EnglishType;
import com.bishe.entity.MathTypeChapter;
import com.bishe.entity.PoliticsType;
import com.bishe.entity.ProfessionGrade;
import com.bishe.entity.StuEngGrade;
import com.bishe.entity.StuMathGrade;
import com.bishe.entity.StuPoliticsGrade;
import com.bishe.service.ChapterServiceImpl;
import com.bishe.service.ExamServiceImpl;
import com.bishe.service.StuServiceImpl;

@Controller
@RequestMapping("/exam")
public class ExamControllerImpl {
	@Resource
	private ExamServiceImpl examServiceImpl;
	@Resource
	private StuServiceImpl stuServiceImpl;
	@Resource
	private ChapterServiceImpl chapterServiceImpl;
	
	/**
	 * @desc 学生保存专业课成绩
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/profession",method=RequestMethod.POST)
	public String  professionExam(ProfessionGrade pg,Model model,HttpServletRequest request) throws Exception{
		this.examServiceImpl.saveProfessionGrade(pg);
		model.addAttribute("stuId", pg.getStuId());
		return "profession";
	}
	/**
	 * @desc 学生保存数学成绩
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/progress",method=RequestMethod.POST)
	public String  mathExam(StuMathGrade smg,Model model,HttpServletRequest request) throws Exception{
		this.examServiceImpl.saveMathGrade(smg);
		int math = this.stuServiceImpl.findMathById(smg.getStuId());
		List<MathTypeChapter> ml = chapterServiceImpl.findById(math);
		model.addAttribute("ml",ml);
		model.addAttribute("stuId", smg.getStuId());
		return "progress";
	}
	/**
	 * @desc 学生保存英语成绩
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/english",method=RequestMethod.POST)
	public String  englishExam(StuEngGrade seg,Model model,HttpServletRequest request) throws Exception{
		this.examServiceImpl.saveEnglishGrade(seg);
		List<EnglishType> el = chapterServiceImpl.findEnglishById();
		model.addAttribute("el",el);
		model.addAttribute("stuId", seg.getStuId());
		return "english";
	}
	/**
	 * @desc 学生保存政治成绩
	 * @param 原源
	 * @createDate 2019年2月17日
	 * @return List
	 * @throws Exception
	 */
	@RequestMapping(value="/politics",method=RequestMethod.POST)
	public String  ppoliticsExam(StuPoliticsGrade spg,Model model,HttpServletRequest request) throws Exception{
		this.examServiceImpl.savePoliticsGrade(spg);
		List<PoliticsType> pl = chapterServiceImpl.findPoliticsById();
		model.addAttribute("pl",pl);
		model.addAttribute("stuId", spg.getStuId());
		return "politics";
	}
}
