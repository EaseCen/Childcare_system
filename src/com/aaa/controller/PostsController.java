package com.aaa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aaa.biz.PostsBiz;
import com.aaa.entity.Posts;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/posts")
public class PostsController {

	@Autowired
	private PostsBiz postsBiz;

	// 分页查询数据
	@RequestMapping("/queryPosts")
	public String queryPosts(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		// 1.引入分页插件,pn是第几页，5是每页显示多少行
		PageHelper.startPage(pn, 5);
		// 2.紧跟的查询就是一个分页查询
		List<Posts> list = postsBiz.findAll();
		// 3.使用PageInfo包装查询后的结果,5是连续显示的条数
		PageInfo<Posts> pageInfo = new PageInfo<Posts>(list, 5);
		// 4.使用model设置到前端
		model.addAttribute("pageInfo", pageInfo);
		// 5.最后设置返回的jsp
		return "showPosts";

	}

	@RequestMapping("/addPosts")
	public String addPosts(Posts posts) {
		// 添加进去
		postsBiz.add(posts);
		// 内部转发
		return "redirect:queryPosts.action";
	}

	@RequestMapping("/del")
	public String del(int id) {
		postsBiz.del(id);
		return "redirect:queryPosts.action";
	}

	// 查询单条记录
	@RequestMapping("/findOne")
	public String findOne(Model model, int id) {
		Posts posts = postsBiz.findOne(id);
		model.addAttribute("posts", posts);
		// 返给更新的方法
		return "upd";
	}

	// 修改数据
	@RequestMapping("/upd")
	public String upd(Posts posts) {
		// 修改完成以后调用更新方法
		postsBiz.upd(posts);

		return "redirect:queryPosts.action";
	}

}
