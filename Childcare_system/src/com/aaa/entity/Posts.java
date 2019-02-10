package com.aaa.entity;

import java.util.Date;

public class Posts {
	private Integer id;
	private String name;// 帖子标题
	private String text;// 帖子正文
	private Date time;// 发帖时间
	private String author;// 帖子作者id

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getTime() {
		return time;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}


	public void setTime(Date time) {
		this.time = time;
	}
	
	public Posts(int id, String name, String text,Date time, String author) {
		super();
		this.id = id;
		this.name = name;
		this.text = text;
		this.time = time;
		this.author = author;
	}

	public Posts() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	@Override
	public String toString() {
		return "Posts [id=" + id + ", name=" + name + ", text=" + text + ", time=" + time + ", author=" + author + "]";
	}
}
