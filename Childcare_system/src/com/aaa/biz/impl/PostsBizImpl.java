package com.aaa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.biz.PostsBiz;
import com.aaa.entity.Posts;
import com.aaa.mapper.PostsDaoMapper;

@Service
public class PostsBizImpl implements PostsBiz {

	@Autowired
	private PostsDaoMapper postsDaoMapper;

	@Override
	public Posts findOne(int id) {
		// TODO Auto-generated method stub
		return postsDaoMapper.findOne(id);
	}

	@Override
	public List<Posts> findAll() {
		// TODO Auto-generated method stub
		return postsDaoMapper.findAll();
	}

	@Override
	public void add(Posts posts) {
		// TODO Auto-generated method stub
		postsDaoMapper.add(posts);
	}

	@Override
	public void upd(Posts posts) {
		// TODO Auto-generated method stub
		postsDaoMapper.upd(posts);
	}

	@Override
	public void del(int id) {
		// TODO Auto-generated method stub
		postsDaoMapper.del(id);
	}

}
