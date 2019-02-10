package com.aaa.entity;

import java.util.Date;

public class Reposts {
	private Integer id;// �ظ�id
	private String repost_id;// �ظ����ӵ�id
	private String text;// �ظ�����
	private String repost_user;// �ظ���
	private Date time;// h�ظ�ʱ��

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRepost_id() {
		return repost_id;
	}

	public void setRepost_id(String repost_id) {
		this.repost_id = repost_id;
	}

	public String getRepost_user() {
		return repost_user;
	}

	public void setRepost_user(String repost_user) {
		this.repost_user = repost_user;
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

	public void setTime(Date time) {
		this.time = time;
	}

	public Reposts(int id, String repost_id, String text, String repost_user, Date time) {
		super();
		this.id = id;
		this.repost_id = repost_id;
		this.text = text;
		this.repost_user = repost_user;
		this.time = time;

	}

	public Reposts() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Posts [id=" + id + ", repost_id=" + repost_id + ", text=" + text + ", repost_user=" + repost_user + ", time=" + time + "]";
	}
}
