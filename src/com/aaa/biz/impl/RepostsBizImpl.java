package com.aaa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.biz.RepostsBiz;
import com.aaa.entity.Reposts;
import com.aaa.mapper.RepostsDaoMapper;

@Service
public class RepostsBizImpl implements RepostsBiz {

	@Autowired
	private RepostsDaoMapper repostsDaoMapper;

	@Override
	public Reposts findOne(int id) {
		// TODO Auto-generated method stub
		return repostsDaoMapper.findOne(id);
	}

	@Override
	public List<Reposts> findAll() {
		// TODO Auto-generated method stub
		return repostsDaoMapper.findAll();
	}

	@Override
	public void add(Reposts reposts) {
		// TODO Auto-generated method stub
		repostsDaoMapper.add(reposts);
	}

	@Override
	public void upd(Reposts reposts) {
		// TODO Auto-generated method stub
		repostsDaoMapper.upd(reposts);
	}

	@Override
	public void del(int id) {
		// TODO Auto-generated method stub
		repostsDaoMapper.del(id);
	}

}
