package com.aaa.biz;

import java.util.List;

import com.aaa.entity.User;


public interface UserBiz {
	
	public User CheckLoginAndPwd(String name, String pwd);

	public void addUser(User user);
	
	public void delUser(int id);
	
	public void updUser(User user);
	
	public User findOne(int id);
	
	public List<User> findAll();
}
