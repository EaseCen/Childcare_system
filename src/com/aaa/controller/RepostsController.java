package com.aaa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aaa.biz.RepostsBiz;
import com.aaa.entity.Reposts;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Controller
@RequestMapping("/reposts")
public class RepostsController {
	
	@Autowired
	private RepostsBiz repostsBiz;
	
	
	//分页查询数据
	@RequestMapping("/queryReposts")
	public String queryReposts(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		//1.引入分页插件,pn是第几页，5是每页显示多少行
		PageHelper.startPage(pn,5);
		//2.紧跟的查询就是一个分页查询
		List<Reposts>list =repostsBiz.findAll();
		//3.使用PageInfo包装查询后的结果,5是连续显示的条数
		PageInfo<Reposts> pageInfo =new PageInfo<Reposts>(list,5);
		//4.使用model设置到前端
		model.addAttribute("pageInfo",pageInfo);
		//5.最后设置返回的jsp
		return "showReposts";
		
	}
	
	// 添加商品
	@RequestMapping("/addReposts")
	public String addReposts(Reposts reposts){
			// 添加进去
		repostsBiz.add(reposts);
			// 内部转发
		return "redirect:queryReposts.action";
	}
	
	//删除商品
	@RequestMapping("/del")
	public String del(int id){
		repostsBiz.del(id);
		return "redirect:queryReposts.action";
	}
	
	//查询单条记录
	@RequestMapping("/findOne")
	public String findOne(Model model,int id){
		Reposts reposts = repostsBiz.findOne(id);
		model.addAttribute("reposts", reposts);
		//返给更新的方法
		return "upd";
	}
	//修改数据
	@RequestMapping("/upd")
	public String upd(Reposts reposts){
		//修改完成以后调用更新方法
		repostsBiz.upd(reposts);
		
		return "redirect:queryReposts.action";
	}
	
}
