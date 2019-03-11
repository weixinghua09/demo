package com.bishe.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.bishe.entity.Article;
import com.bishe.entity.ArticleCollection;
import com.bishe.dao.BaseDao;

@Repository
public class ForumDaoImpl extends BaseDao<Article>{
	@Resource
	private SessionFactory sessionFactory;
	
	
	/**
	 * 新增文章
	 * @author 魏兴华
	 * @param article
	 */
	public void saveArticle(Article article) {
		this.sessionFactory.getCurrentSession().save(article);
	}
	
	/** 
	 * @desc 收藏文章(未实现)
	 * @author 魏兴华
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
	 * @desc 查询stuId所有文章
	 * @author 魏兴华
	 * @createDate 2018年3月6日
	 * @return
	 * @throws Exception
	 */
	public List<Article> findAllForum(int stuId) {
		SessionFactory sessionFactory = super.getSessionFactory();
		String hql ="from Article where stuId = ?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, stuId);
		return query.list();
	}
	/** 
	 * @desc 删除单个文章
	 * @author 魏兴华
	 * @createDate 2019年3月6日
	 * @return
	 * @throws Exception
	 */
	public void deleteArticleById(Article article) {
		// TODO 自动生成的方法存根
		this.sessionFactory.getCurrentSession().delete(article);
	}
	/** 
	 * @desc 根据id查询文章
	 * @author 魏兴华
	 * @createDate 2019年3月7日
	 * @return Article
	 * @throws Exception
	 */
	public Article findArticleById(int id) {
		// TODO 自动生成的方法存根
		SessionFactory sessionFactory = super.getSessionFactory();
		String hql ="from Article where id = ?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, id);
		return (Article) query.uniqueResult();
	}
	/** 
	 * @desc 查询所有文章
	 * @author 魏兴华
	 * @createDate 2019年3月8日
	 * @return List<Article>
	 * @throws Exception
	 */
	public List<Article> findAllForum() {
		SessionFactory sessionFactory = super.getSessionFactory();
		String hql ="from Article";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	/** 
	 * @desc 根据关键字查询所有文章
	 * @author 魏兴华
	 * @createDate 2019年3月8日
	 * @return List<Article>
	 * @throws Exception
	 */
	public List<Article> findAllForumByWord(String search) {
		// TODO 自动生成的方法存根FROM 
		SessionFactory sessionFactory = super.getSessionFactory();
		String hql ="from Article where title like ?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter(0, "%"+search+"%");
		return query.list();
	}

	public void updateArticleById(Article article) throws Exception {
		// TODO 自动生成的方法存根
		this.sessionFactory.getCurrentSession().update(article);
	}
}
