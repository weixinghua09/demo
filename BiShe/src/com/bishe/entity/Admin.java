package com.bishe.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="admin")
/**
 * 管理员实体
 * @author 魏兴华
 * */
public class Admin {
	@Id
	@GeneratedValue(generator="increment_generator")
	@GenericGenerator(name="increment_generator", strategy="increment")
	private int id;				//管理员Id
	private String name;		//管理员账户
	private String adminPwd;			//管理员密码
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAdminPwd() {
		return adminPwd;
	}
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	
	
	
	
}
