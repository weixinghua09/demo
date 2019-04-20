package com.kedou.dao.forum;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedou.dao.framework.BaseDao;
import com.kedou.entity.Answer;
import com.kedou.entity.Article;
import com.kedou.entity.ArticleCollection;
import com.kedou.entity.Collection;
import com.kedou.entity.Comment;
import com.kedou.entity.HotSpot;

@Repository
public class ForumDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	
	/**
	 * 新增文章
	 * @author 张天润
	 * @param article
	 */
	public void saveArticle(Article article) {
		this.sessionFactory.getCurrentSession().save(article);
	}
	
	/** 
	 * @desc 论坛轮播图展示
	 * @author 于越明
	 * @createDate 2018年5月22日
	 * @return
	 * @throws Exception
	 */
	public List<Article> findAllPic(){
		List<Article> forumpic = new ArrayList<Article>();
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select f from Article f where f.likes > 1000");
		forumpic = query.list();
		return forumpic;
	}
	
	/** 
	 * @desc 论坛热点展示
	 * @author 于越明
	 * @createDate 2018年5月22日
	 * @return
	 * @throws Exception
	 */
	public List<HotSpot> findAllSpot(){
		List<HotSpot> HotSpot = new ArrayList<HotSpot>();
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from HotSpot");
		HotSpot = query.list();
		return HotSpot;
	}
	
	/** 
	 * @desc 论坛文章展示
	 * @author 于越明
	 * @createDate 2018年5月22日
	 * @return
	 * @throws Exception
	 */
	public List<Article> findAllArticle(){
		List<Article> Article = new ArrayList<Article>();
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Article");
		Article = query.list();
		return Article;
	}
	
	/** 
	 * @desc 论坛推荐文章展示
	 * @author 于越明
	 * @createDate 2018年5月22日
	 * @return
	 * @throws Exception
	 */
	public List<Article> findRecommendArticle(){
		List<Article> forumpic = new ArrayList<Article>();
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select f from Article f where f.likes > 200");
		forumpic = query.list();
		return forumpic;
	}
	
	/** 
	 * @desc 收藏文章
	 * @author 于越明
	 * @createDate 2018年5月22日
	 * @return
	 * @throws Exception
	 */	
	public int collectArticle(int key,int userid){
		Session session = sessionFactory.getCurrentSession();
		ArticleCollection ac = new ArticleCollection();
		ac.setArticleId(key);
		ac.setUserId(userid);
		int id = (int) session.save(ac);
		Article a = session.get(Article.class, key);
		int collect = a.getCollections();
		collect = collect+1;
		a.setCollections(collect);
		session.update(a);
		return id;
	}
	
	/** 
	 * @desc 通过id查询文章
	 * @author 于越明
	 * @createDate 2018年5月22日
	 * @return
	 * @throws Exception
	 */	
	public Article getArticleById(int id){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select a from Article a where a.id=?");
		query.setParameter(0,id);
		Article a = (Article)query.uniqueResult();
		return a;
	}
	
	/** 
	 * @desc 通过文章id查询文章热点标签
	 * @author 于越明
	 * @createDate 2018年5月22日
	 * @return
	 * @throws Exception
	 */	
	public ArrayList<HotSpot> getHotSpotByArticleId(int id){
		ArrayList<HotSpot> hotspots = new ArrayList<HotSpot>();
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select a from Article a where a.id=?");
		query.setParameter(0,id);
		Article a = (Article)query.uniqueResult();
		String hotspot = a.getHotspots();
		System.out.println(hotspot);
		String [] result = hotspot.split(",");
		for(String p:result){
			int spot = Integer.parseInt(p);
			Query query1 = session.createQuery("select h from HotSpot h where h.id=?");
			query1.setParameter(0,spot);
			HotSpot s = (HotSpot)query1.uniqueResult();
			hotspots.add(s);
		}
		return hotspots;
		
	}
	
	/**
	 * 
	 * @desc 将评论内容存储进入数据库
	 * @author 时自虎
	 * @createDate 2018年5月30日
	 * @return
	 * @throws Exception
	 */
	public void saveComment(Comment comment)throws Exception{
		this.sessionFactory.getCurrentSession().save(comment);
	}
	/**
	 * 
	 * @desc 查询数据库中所有关于此文章的评论
	 * @author 时自虎
	 * @return 
	 * @createDate 2018年5月31日
	 * @return
	 * @throws Exception
	 */
	public List<Comment> findComment(int articleId)throws Exception{
		List<Comment> allcomment = new ArrayList<Comment>();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("select c from Comment c where c.articleId = ?");
		query.setParameter(0, articleId);
		allcomment = query.list();
		
		session.close();
		
		return allcomment;
	}
	
	/**
	 * 
	 * @desc 删除一条数据库中关于此文章的评论
	 * @author 时自虎
	 * @return 
	 * @createDate 2018年5月31日
	 * @return
	 * @throws Exception
	 */
	public void deleteComment(int commentId)throws Exception{
		Session session = sessionFactory.openSession();
		Transaction ts = session.beginTransaction();
		Query query = session.createQuery("select c from Comment c where c.comId = ?");
		query.setParameter(0, commentId);
		Comment delc = (Comment) query.uniqueResult();
		session.delete(delc);
		
		ts.commit();
		session.close();
	}
	
	/**
	 * 
	 * @desc 对一条数据库中关于此文章的评论做出回复
	 * @author 时自虎
	 * @return 
	 * @createDate 2018年5月31日
	 * @return
	 * @throws Exception
	 */
	public void answerToComment(int commentId,String answers,String userName,String userIcon)throws Exception{
		Session session = sessionFactory.openSession();
		Transaction ts = session.beginTransaction();
		Answer ans = new Answer();
		ans.setAnswers(answers);
		ans.setComId(commentId);
		ans.setUserName(userName);
		ans.setUserIcon(userIcon);
		session.save(ans);
		
		ts.commit();
		session.close();
	}
	/**
	 * 
	 * @desc 对一条数据库中关于此文章的评论做出的回复进行遍历
	 * @author 时自虎
	 * @return 
	 * @return 
	 * @createDate 2018年5月31日
	 * @return
	 * @throws Exception
	 */
	public List<Answer> findanswer(int comId)throws Exception{
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("select a from Answer a where a.comId = ?");
		query.setParameter(0, comId);
		List<Answer> allanswer = query.list();
		
		session.close();
		
		return allanswer;
	}
	
	public Map<Integer,Answer> findMapByCourseList(List<Integer> comIdList) {
		String hql = "from Answer where comId in (:idList) ";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
			query.setParameterList("idList", comIdList);
			 List<Answer> answerList = query.list();
			 
			 Map<Integer,Answer> answerMap = new HashMap<Integer,Answer>();
			 
			 if(answerList !=null&&answerList.size()!=0) {
				
				 for(Answer a:answerList) {
					 answerMap.put(a.getComId(), a);
				 }
			 }
			 return  answerMap ;
	}
}
