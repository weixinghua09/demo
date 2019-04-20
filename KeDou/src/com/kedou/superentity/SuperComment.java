package com.kedou.superentity;

import com.kedou.entity.Answer;
import com.kedou.entity.Comment;

public class SuperComment {

	private Comment comment;
	private Answer answer;
	
	public SuperComment(Comment c,Answer a) {
		this.comment = c;
		this.answer =a;
	}
	
	public Comment getComment() {
		return comment;
	}
	public Answer getAnswer() {
		return answer;
	}
	
	
	
	
}
