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


// 设置默认先映射到("/user")路径下
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserBiz userBiz;

	// 设置映射路径和以json格式传送参数
	@RequestMapping(value = "/checkLogin", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody User checkLogin(@RequestBody User user, Model model, HttpSession session) {
		System.out.println("=============进入登录控制页面。===============");
		User user1 = userBiz.CheckLoginAndPwd(user.getUsername(), user.getPassword());
		// 登录以后添加到session中
		session.setAttribute("user1", user1);
		return user1;
	}

	// 注销
	@RequestMapping("/LogOut")
	public String LogOut(HttpSession session) {
		session.invalidate();
		return "redirect:/Login.jsp";
	}

	// 注册
	@RequestMapping(value = "/register", method = { RequestMethod.GET, RequestMethod.POST })
	public String register(User user, Model model) {
		userBiz.addUser(user);
		model.addAttribute("msg", "恭喜您,注册成功");
		return "success";
	}
	
	@RequestMapping("/queryUser")
	public String queryReposts(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		//1.引入分页插件,pn是第几页，5是每页显示多少行
		PageHelper.startPage(pn,5);
		//2.紧跟的查询就是一个分页查询
		List<User>list =userBiz.findAll();
		//3.使用PageInfo包装查询后的结果,5是连续显示的条数
		PageInfo<User> pageInfo =new PageInfo<User>(list,5);
		//4.使用model设置到前端
		model.addAttribute("pageInfo",pageInfo);
		//5.最后设置返回的jsp
		return "showUser";
		
	}
	
	@RequestMapping("/del")
	public String delUser(int id){
		userBiz.delUser(id);
		return "redirect:queryUser.action";
	}
	
	//查询单条记录
	@RequestMapping("/findOne")
	public String findOne(Model model,int id){
		User user = userBiz.findOne(id);
		model.addAttribute("user", user);
		//返给更新的方法
		return "updUser";
	}
	//修改数据
	@RequestMapping("/updUser")
	public String upd(User user){
		//修改完成以后调用更新方法
		userBiz.updUser(user);
		
		return "redirect:queryUser.action";
	}

}
