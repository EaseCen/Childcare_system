package com.aaa.mapper;

import java.util.List;

import com.aaa.entity.Reposts;


public interface RepostsDaoMapper {
	
	public Reposts findOne(int id);
		
	public List<Reposts> findAll();
	
	public void add (Reposts reposts);
	
	public void upd(Reposts reposts);
	
	public void del(int id);
	

}
