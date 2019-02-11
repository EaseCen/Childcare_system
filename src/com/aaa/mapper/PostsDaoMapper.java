package com.aaa.mapper;

import java.util.List;

import com.aaa.entity.Posts;


public interface PostsDaoMapper {
	
	public Posts findOne(int id);
		
	public List<Posts> findAll();
	
	public void add (Posts posts);
	
	public void upd(Posts posts);
	
	public void del(int id);
	

}
