<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
	<title>后台管理系统</title>
	
    <link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.zh-CN.js"></script>

<script type="text/javascript">
<!-- 添加模态框（Modal）插件 -->
	$("#myModal").modal({
		keyboard : false,
		backdrop : true
	});
	$(function() {

		$(".form_datetime").datetimepicker({
			format : "yyyy-mm-dd hh:ii",
			autoclose : true,
			todayBtn : true,
			todayHighlight : true,
			showMeridian : true,
			pickerPosition : "bottom-left",
			language : 'zh-CN',//中文，需要引用zh-CN.js包
			startView : 2,//月视图
			minView : 2
		//日期时间选择器所能够提供的最精确的时间选择视图
		});
	});
</script>
</head>

 <body>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#" style="height:92px;">
                        <img src="<%=path %>/images/a.jpg" height="100%" />
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="example-navbar-collapse">
                    <ul class="nav navbar-nav navbar" style="margin:1% 0 1% 34%;">
                        <li class="active">
                        <a class="icon-bar" href="#" style="background-color:#087b71">
                        	<font  style="font-size:31px;font-weight:bold;font-style:italic;">欢迎来到管理系统</font></a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right" style="margin:1% 0 1% 0%;">
                        <li><h4 style="color:red;">
					欢迎您:&nbsp;&nbsp;<span class="glyphicon glyphicon-user"></span>
					<strong>${user1.username }</strong><small>
					<a href="${pageContext.request.contextPath }/user/LogOut.action">注销</a></small>
					</h4></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2">
                    <a href="#" class="list-group-item active"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;菜单
                    </a>
                    <a href="${pageContext.request.contextPath}/user/queryUser.action" class="list-group-item">
                        <span class="glyphicon glyphicon-search" aria-hidden="true">
                    </span>&nbsp;帖子管理</a>
                    <a href="${pageContext.request.contextPath}/user/queryReuser.action" class="list-group-item">
                        <span class="glyphicon glyphicon-user" aria-hidden="true">
                    </span>&nbsp;回复管理</a>
                    <a href="${pageContext.request.contextPath}/user/queryUser.action" class="list-group-item">
                        <span class="glyphicon glyphicon-user" aria-hidden="true">
                    </span>&nbsp;用户管理</a>
                </div>
                <!--左边菜单栏-->
                <div class="col-sm-10">
                    <ol class="breadcrumb">
                        <li class="active">菜单
                        </li>
                        <li class="active">帖子信息
                        </li>
                        <li class="active">
                        </li>
                    </ol>
                    <div class="panel panel-default">
                        <div class="panel-heading">搜索
                        </div>
                        <div class="panel-body">
                            <form role="form" class="form-inline">
                                <div class="form-group">
                                    <label for="name">名称</label>
                                    <input type="text" class="form-control" id="name" placeholder="请输入名称">
                                </div>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <div class="form-group">
                                    <button type="submit" class="btn btn-default">开始搜索</button>
                                </div>
                            </form>
                             <!-- 按钮-->
								<div class="row">
									<div class="col-md-6 col-md-offset-10">
										<button type="button" class="btn btn-primary btn-lg"
											data-toggle="modal" data-target="#myModal">
											<span class="glyphicon glyphicon-plus"></span>添加帖子
										</button>
									</div>
								</div>
                        </div>
                    </div>
                    <!-- 列表展示 -->
                    <div class="table-responsive">
                    	<form action="${pageContext.request.contextPath }/user/addCar.action" method="post">
                        <table class="table table-striped">
                                <tr align="center">
                                    <th>帖子标题</th>
									<th>帖子内容</th>
									<th>发帖时间</th>
									<th>发帖人</th>
									<th colspan="3">操作</th>
                                </tr>
                                	<c:forEach items="${pageInfo.list}" var="post">
								<tr align="center">
									<td>${user.name }</td>
									<td>${user.password }</td>
									<td>${user.address}</td>
									<td>${user.state }</td>
									<!-- 删除操作-带id参数 -->
									<td><a
										href="${pageContext.request.contextPath }/user/del.action?id=${user.id}"><button
												type="button" class="btn btn-success btn-lg"
												onclick="return confirm('确定要删除信息吗？') ">
												<span class="glyphicon glyphicon-trash"></span> 删除
											</button></a></td>
									<!-- 修改操作 -->	
									<td><a
										href="${pageContext.request.contextPath }/user/findOne.action?id=${user.id}"><button
												type="button" class="btn btn-success btn-lg">
												<span class="glyphicon glyphicon-edit"></span> 修改
											</button></a></td>
								</tr>
						</c:forEach>
                        </table>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 分页 -->
		<div class="row">
			<!-- 分页信息 -->
			<div class="col-md-6">
				<h4 style="margin: 0 0 0 38%;">当前第${pageInfo.pageNum }页，共${pageInfo.pages }页，共${pageInfo.total }条记录数</h4>
			</div>
			<!-- 分页条 -->
			<div class="col-md-6">
				<ul class="pagination pagination-lg">
					<li><a
						href="${pageContext.request.contextPath }/user/queryUser.action?pn=1">首页</a></li>
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a
							href="${pageContext.request.contextPath }/user/queryUser.action?pn=${pageInfo.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach items="${pageInfo.navigatepageNums }" var="nav">
						<c:if test="${nav==pageInfo.pageNum }">
							<li class="active"><a
								href="${pageContext.request.contextPath }/user/queryUser.action?pn=${nav}">${nav }</a></li>
						</c:if>
						<c:if test="${nav!=pageInfo.pageNum }">
							<li><a
								href="${pageContext.request.contextPath }/user/queryUser.action?pn=${nav}">${nav }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage}">
						<li><a
							href="${pageContext.request.contextPath }/user/queryUser.action?pn=${pageInfo.pageNum+1}"
							aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<li><a
						href="${pageContext.request.contextPath }/user/queryUser.action?pn=${pageInfo.pages}">末页</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 添加帖子的模态框-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			<!-- 模态框的标题 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加帖子</h4>
				</div>
				<!-- 模态框的主体-表单头部 -->
				<form class="form-horizontal" role="form"
					action="${pageContext.request.contextPath }/user/addUser.action"
					method="post" id="form" enctype="multipart/form-data">
					<div class="modal-body">
						<div class="form-group  form-group-lg">
							<label for="firstname" class="col-sm-3 control-label">帖子名称:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-lg" id="name"
									name="name" placeholder="请输入帖子名字" required autofocus>
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">帖子内容:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-lg" id="text"
									name="text" placeholder="请输入帖子内容" required autofocus>
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">发帖时间:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-lg form_datetime"
									id="time" name="time">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">发帖人:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-lg" id="author"
									name="author" placeholder="请输入发帖人" required autofocus>
							</div>
						</div>
					</div>
					<!-- 模态框的尾部 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary" id="save">保存</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>