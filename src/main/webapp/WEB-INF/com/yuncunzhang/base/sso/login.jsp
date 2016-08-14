<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>登录</title>
	<style type="text/css">
		*{padding: 0; margin: 0; outline: none;}
		html,body{font-family: "微软雅黑"; color: #666;}
		.settled_login{width: 800px; margin: 50px auto;}
		.settled_login_input{position: relative;width: 400px; height: 50px; margin: 0 auto 20px auto;}
		.settled_login input{width: 400px; height: 50px; display: block; padding-left: 50px; font-size: 16px;  border: 1px solid #eee; border-radius: 25px; box-sizing: border-box;}
		.btn{width: 400px; height: 50px; display: block; font-size: 16px;  border-radius: 25px;background: url(${contextpath}/res/images/button_bg.png); background-size: 100%; border: 0; color: #fff;}
		.btn:hover{color: #fff; background: #05B7BE; cursor: pointer;}
		.settled_login_input:before{ content: ""; display: block; width: 30px; height: 30px;   position: absolute; left: 10px; top: 10px;}
		.user_icon:before{background: url(${contextpath}/res/images/user_icon.png);background-size: 100%;}
		.password_icon:before{background: url(${contextpath}/res/images/password_icon.png);background-size: 100%;}
	</style>
	<link href="${ contextpath }/res/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
	<script type="text/javascript" src="${ contextpath }/res/js/layer/layer.js"></script>
	<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
	<link rel="stylesheet" href="${ contextpath }/res/js/validator-0.7.3/jquery.validator.css">
	<script type="text/javascript" src="${ contextpath }/res/js/validator-0.7.3/jquery.validator.js"></script>
	<script type="text/javascript" src="${ contextpath }/res/js/validator-0.7.3/local/zh_CN.js"></script>
	<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ contextpath }/res/js/select-ui.min.js"></script>
</head>
<body>
<div class="settled_login">
	<form action="" method="post"  id="loginForm">
		<div class="settled_login_input user_icon">
			<input id="userKey" name="userKey" type="text" placeholder="请输入手机号或用户名"/>
		</div>
		<div class="settled_login_input password_icon">
			<input id="password" name="password" type="password" placeholder="请输入密码"/>
		</div>
		<div class="settled_login_input">
			<button class="btn">登录</button>
		</div>
	</form>
</div>
</body>
</html>
<script type="text/javascript">
	$(document).ready(
			function(){
				$('#loginForm').on("click", ".doSubmit", function(e){
					var a=$(e.delegateTarget).trigger("validate");
				}).validator({
					fields: {
						'phone':'required;',
						'password':'required;'
					},
					valid: function(form){
						var me = this;
						// 提交表单之前，hold住表单，防止重复提交
						me.holdSubmit();
						$.ajax({
							url:"${ contextpath}/sso/login/bypass",
							data: $(form).serialize(),
							type: "POST",
							success: function(data){
								// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
								me.holdSubmit(false);
								if(data.success){
									window.location.href='${contextpath}/distributor/index';
								}else{
									sAlert(data.msg);
								}
							}
						});
					}
				});
			}
	);
</script>