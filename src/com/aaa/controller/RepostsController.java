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
	
	
	//��ҳ��ѯ����
	@RequestMapping("/queryReposts")
	public String queryReposts(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		//1.�����ҳ���,pn�ǵڼ�ҳ��5��ÿҳ��ʾ������
		PageHelper.startPage(pn,5);
		//2.�����Ĳ�ѯ����һ����ҳ��ѯ
		List<Reposts>list =repostsBiz.findAll();
		//3.ʹ��PageInfo��װ��ѯ��Ľ��,5��������ʾ������
		PageInfo<Reposts> pageInfo =new PageInfo<Reposts>(list,5);
		//4.ʹ��model���õ�ǰ��
		model.addAttribute("pageInfo",pageInfo);
		//5.������÷��ص�jsp
		return "showReposts";
		
	}
	
	// �����Ʒ
	@RequestMapping("/addReposts")
	public String addReposts(Reposts reposts){
			// ��ӽ�ȥ
		repostsBiz.add(reposts);
			// �ڲ�ת��
		return "redirect:queryReposts.action";
	}
	
	//ɾ����Ʒ
	@RequestMapping("/del")
	public String del(int id){
		repostsBiz.del(id);
		return "redirect:queryReposts.action";
	}
	
	//��ѯ������¼
	@RequestMapping("/findOne")
	public String findOne(Model model,int id){
		Reposts reposts = repostsBiz.findOne(id);
		model.addAttribute("reposts", reposts);
		//�������µķ���
		return "upd";
	}
	//�޸�����
	@RequestMapping("/upd")
	public String upd(Reposts reposts){
		//�޸�����Ժ���ø��·���
		repostsBiz.upd(reposts);
		
		return "redirect:queryReposts.action";
	}
	
}
