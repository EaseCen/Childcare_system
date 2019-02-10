<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>登录新界面</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="登录,ssm练习,web项目">
	<meta http-equiv="description" content="This is login page">
	
    <!-- 顺序：先css后jquery最好bootstrap.js -->
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap-datetimepicker.min.css" />
	<link rel="stylesheet" href="<%=basePath%>static/css/style.css">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<script type="text/javascript" src="<%=basePath%>js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap-datetimepicker.zh-CN.js"></script>
    
</head>
<body style="margin: 8%;">
    <div class="container">
        <div class="form row">
        <!-- ajax提交登录示例 -->
            <div class="form-horizontal col-md-offset-2" id="login_form">
                <h3 class="form-title">欢迎登录商品管理系统</h3>
                <div class="col-md-9">
                  <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="请输入用户名..." id="username" name="username" value="admin" autofocus="autofocus" maxlength="20"/>
                    	<span id="checkUserNameResult" style="color: red "></span>
                    </div>
                    <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <input class="form-control required" type="password" placeholder="请输入密码..." id="password" name="password" maxlength="8" value="123456"/>
                            <span id="checkPasswordResult" style="color: red "></span>
                            <label class="control-label" for="inputSuccess1" style="color: red;"id="message"></label>
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-left" name="login" id="login">登录</button>
                        <button type="button" class="btn btn-danger pull-right" name="register" id="register" data-toggle="modal" data-target="#myModal">注册</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 注册框 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">注册新用户</h4>
						</div>
				 	<!-- form表单提交注册示例 -->
						<form class="form-horizontal" role="form"
							action="${pageContext.request.contextPath}/user/register.action"
							method="post" id="form">
							<div class="modal-body">
								<!-- 表格 -->
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">用户名:</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="username"
											name="username" placeholder="请输入用户名" required autofocus>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;码:</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="password"
											name="password" placeholder="请输入密码" required autofocus>
									</div>
								</div>
								<!-- js控制以日期类型录入-->
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">出生日期:</label>
									<div class="col-sm-6">
										<input type="text" class="form-control input-lg form_datetime"
											id="birthday" name="birthday">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">居住地址:</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="address"
											name="address" placeholder="请输入现居住地址" required autofocus>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary" id="save">注册</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							</div>
						</form>
					</div>
				</div>
			</div>
    
<script type="text/javascript">

/* 以json的格式提交登录传参 */
$("#login").click(function() {
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	var checkUserNameResult = document.getElementById("checkUserNameResult"); //提示语句
	var checkPasswordResult = document.getElementById("checkPasswordResult"); //提示语句
    
	if(username.trim().length==0){
          checkUserNameResult.innerHTML = "用户名不能为空";  
          obj.focus();
    }else if(password.trim().length==0){
    	 checkUserNameResult.innerHTML = "";
    	 checkPasswordResult.innerHTML = "密码不能为空";  
         obj.focus();
    }else{
    	 checkPasswordResult.innerHTML = "";  
		 $.ajax({
			type : 'post',
			//提交路径
			url : '${pageContext.request.contextPath}/user/checkLogin.action',
			//声明为json格式
			contentType : 'application/json;charset=utf-8',
			//转为json格式
			data : JSON.stringify({
					"username" : $("#username").val(),
					"password" : $("#password").val()
				}),
					//点击登录以后拿到数据
					success : function(data) {
					//判断
					if (data == "" || data == null) {
							$("#message").html("用户名或密码错误！");
					} else {
					//正常跳转
							window.location.href = "${pageContext.request.contextPath}/posts/queryPosts.action";
							}
						}
					});
   			 }
		});
		
</script>
</body>
</html>