package com.bishe.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="answer")
/**
 * 回复 实体
 * @author 时自虎
 *
 */
public class Answer implements java.io.Serializable{
	@Id
	@GeneratedValue(generator="increment_generator")
	@GenericGenerator(name="increment_generator", strategy="increment")
	private int anId;
	
	private int comId;//评论Id
	private String answers;//回复
	private String userName;//用户名称
	private String userIcon;//用户头像
	public int getAnId() {
		return anId;
	}
	public void setAnId(int anId) {
		this.anId = anId;
	}
	public int getComId() {
		return comId;
	}
	public void setComId(int comId) {
		this.comId = comId;
	}
	public String getAnswers() {
		return answers;
	}
	public void setAnswers(String answers) {
		this.answers = answers;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserIcon() {
		return userIcon;
	}
	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}
}
