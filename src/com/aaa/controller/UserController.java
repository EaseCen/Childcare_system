package com.aaa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.aaa.biz.UserBiz;
import com.aaa.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


// ����Ĭ����ӳ�䵽("/user")·����
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserBiz userBiz;

	// ����ӳ��·������json��ʽ���Ͳ���
	@RequestMapping(value = "/checkLogin", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody User checkLogin(@RequestBody User user, Model model, HttpSession session) {
		System.out.println("=============�����¼����ҳ�档===============");
		User user1 = userBiz.CheckLoginAndPwd(user.getUsername(), user.getPassword());
		// ��¼�Ժ���ӵ�session��
		session.setAttribute("user1", user1);
		return user1;
	}

	// ע��
	@RequestMapping("/LogOut")
	public String LogOut(HttpSession session) {
		session.invalidate();
		return "redirect:/Login.jsp";
	}

	// ע��
	@RequestMapping(value = "/register", method = { RequestMethod.GET, RequestMethod.POST })
	public String register(User user, Model model) {
		userBiz.addUser(user);
		model.addAttribute("msg", "��ϲ��,ע��ɹ�");
		return "success";
	}
	
	@RequestMapping("/queryUser")
	public String queryReposts(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		//1.�����ҳ���,pn�ǵڼ�ҳ��5��ÿҳ��ʾ������
		PageHelper.startPage(pn,5);
		//2.�����Ĳ�ѯ����һ����ҳ��ѯ
		List<User>list =userBiz.findAll();
		//3.ʹ��PageInfo��װ��ѯ��Ľ��,5��������ʾ������
		PageInfo<User> pageInfo =new PageInfo<User>(list,5);
		//4.ʹ��model���õ�ǰ��
		model.addAttribute("pageInfo",pageInfo);
		//5.������÷��ص�jsp
		return "showUser";
		
	}
	
	@RequestMapping("/del")
	public String delUser(int id){
		userBiz.delUser(id);
		return "redirect:queryUser.action";
	}
	
	//��ѯ������¼
	@RequestMapping("/findOne")
	public String findOne(Model model,int id){
		User user = userBiz.findOne(id);
		model.addAttribute("user", user);
		//�������µķ���
		return "updUser";
	}
	//�޸�����
	@RequestMapping("/updUser")
	public String upd(User user){
		//�޸�����Ժ���ø��·���
		userBiz.updUser(user);
		
		return "redirect:queryUser.action";
	}

}
