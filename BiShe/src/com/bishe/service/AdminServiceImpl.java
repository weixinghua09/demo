package com.bishe.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bishe.dao.AdminDaoImpl;
import com.bishe.dao.StuDaoImpl;
import com.bishe.entity.Admin;
import com.bishe.entity.Student;
import com.bishe.entity.Type;
@Service
@Transactional(readOnly=false)
public class AdminServiceImpl {


	@Resource
	private AdminDaoImpl adminDaoImpl;
	@Resource
	private StuDaoImpl stuDaoImpl;
	
	
	
	/**
	 * 锁定用户
	 * @param array
	 */
	@Transactional
	public void lockUser(int[] array) {
		for(int i=0;i<array.length;i++) {
			try {
				adminDaoImpl.lockUser(array[i]);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	
	
	/**
	 * 查询所有User的数据
	 * @return
	 */
	@Transactional
	public List<Student> searchAllUser(){
		List<Student> list;
		try {
			list = stuDaoImpl.findAll();
			return list;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	/**
	 * 编辑用户
	 * @param u
	 */
	@Transactional
	public void editStudent(Student stu) {
		try {		
			stuDaoImpl.update(stu);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 查找用户
	 * @param account
	 * @return
	 */
	@Transactional
	public Student findStudent(String account) {
		try {
			return adminDaoImpl.findAllStudent(account);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 储存管理员
	 * @param ad
	 * @throws Exception
	 * @author 宋亚楼
	 */
	public void saveAdmin(Admin ad) throws Exception {
		adminDaoImpl.save(ad);
	}
	
	
	
	/**
	 * 登录
	 * @param ad
	 * @param pwd
	 * @return
	 * @throws Exception 
	 */
	@Transactional
	public Admin adminLogin(Admin ad) throws Exception {

				 //设置登录次数
				     ad.setLoginCount(ad.getLoginCount()+1);
				 //设置用户上次登录时间
				     ad.setLastLoginTime(ad.getLoginTime());
				 //设置用户登录时间
				     ad.setLoginTime(new Date());
				    this.updateLoginInfo(ad);
				return ad;//可以登陆
		
	}
	/**
	 * 更新管理员登录信息 （登陆时间 上次登录时间 登录次数）
	 * @param u
	 * @return  返回 用户ID 
	 */
	public int updateLoginInfo(Admin ad) throws Exception{
		Object [] params = {ad.getLoginTime(),ad.getLastLoginTime(),ad.getLoginCount(),ad.getLastLoginIp(),ad.getLoginIp(),ad.getAdminId()};
			this.adminDaoImpl.updateLoginInfo(params);
		return ad.getAdminId();
	}

	/**
	 * 添加标签
	 * @return tagList
	 * @throws Exception 
	 */
	public void saveTag(Type tag) throws Exception {
		this.adminDaoImpl.saveTag(tag);
	}


	public List<Type> findAllTag() throws Exception {
		List<Type> tagList = this.adminDaoImpl.findAllTag();
		return tagList;
	}
	
}
