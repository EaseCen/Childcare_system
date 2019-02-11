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

	// ��ҳ��ѯ����
	@RequestMapping("/queryPosts")
	public String queryPosts(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		// 1.�����ҳ���,pn�ǵڼ�ҳ��5��ÿҳ��ʾ������
		PageHelper.startPage(pn, 5);
		// 2.�����Ĳ�ѯ����һ����ҳ��ѯ
		List<Posts> list = postsBiz.findAll();
		// 3.ʹ��PageInfo��װ��ѯ��Ľ��,5��������ʾ������
		PageInfo<Posts> pageInfo = new PageInfo<Posts>(list, 5);
		// 4.ʹ��model���õ�ǰ��
		model.addAttribute("pageInfo", pageInfo);
		// 5.������÷��ص�jsp
		return "showPosts";

	}

	@RequestMapping("/addPosts")
	public String addPosts(Posts posts) {
		// ��ӽ�ȥ
		postsBiz.add(posts);
		// �ڲ�ת��
		return "redirect:queryPosts.action";
	}

	@RequestMapping("/del")
	public String del(int id) {
		postsBiz.del(id);
		return "redirect:queryPosts.action";
	}

	// ��ѯ������¼
	@RequestMapping("/findOne")
	public String findOne(Model model, int id) {
		Posts posts = postsBiz.findOne(id);
		model.addAttribute("posts", posts);
		// �������µķ���
		return "upd";
	}

	// �޸�����
	@RequestMapping("/upd")
	public String upd(Posts posts) {
		// �޸�����Ժ���ø��·���
		postsBiz.upd(posts);

		return "redirect:queryPosts.action";
	}

}
