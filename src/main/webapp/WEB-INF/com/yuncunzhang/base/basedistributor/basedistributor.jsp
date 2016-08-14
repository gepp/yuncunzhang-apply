<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style type="text/css">
		*{padding: 0; margin: 0; outline: none;}
		html,body{font-family: "微软雅黑"; color: #666;}
		.settled-banner{width: 100%; height: 146px; background: url(${contextpath}/res/images/banner_bg.png) no-repeat center center; background-size:auto 100%;}
		.settled-banner-cont{width: 1200px; margin: 0 auto;}
		.settled-banner-cont h5{display: block; float: left; font-size: 24px; color: #fff;margin: 60px 0 0 300px;}
		.settled-banner-cont p{display: block; float: right; font-size: 16px; color: #fff; margin-top: 60px;}
		.settled-banner-cont p a{color: #fff; margin-left: 10px;}
		.main-cont{width: 1200px; margin: 30px auto 30px auto;}
		.tip{width: 1200px; padding: 10px; background: #fffae5; border: 1px solid #eee; font-size: 14px; color: #ea8010;}
		.tip img{width: 20px; vertical-align: middle; margin-right: 10px;}
		.main-cont-title{margin: 30px 0 20px 0px;}
		.main-cont-title:before,.main-cont-title:after{display: block; clear: both; content: "";}
		.main-cont-title h5{font-size: 18px; color: #333; float: left; }
		.main-cont-title h5:after{ display: block; content: ""; float: left; width: 3px; height: 18px; background: #1fb8bd; margin-right: 6px; margin-top: 4px;}
		.main-cont table{border-top: 1px solid #eee;}
		.main-cont table th,.main-cont table td{border-bottom: 1px solid #eee; text-align: center;}
		.main-cont table th{padding: 10px 0; background: #fafafa;}
		.main-cont table td{padding: 25px 0; color: #999;}
		.main-cont table td a{ color: #188bca;}
		.btn{width: 100px; height: 34px; text-align: center; line-height: 34px; border: none; background: url(${contextpath}/res/images/btnbg.png); background-size: 100% 100%; color: #fff;  font-size: 14px; border-radius: 4px; cursor: pointer; float: right;}
		.btn:hover{color: #fff; background: #05B7BE;}
	</style>
	<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
</head>
	<title>商户</title>
</head>
<body>
<div class="settled-banner">
	<div class="settled-banner-cont">
		<h5>欢迎使用商家入驻平台</h5>
		<p>${securityUser.username}<a href="${contextpath}/sso/logout">[退出]</a></p>
	</div>
</div>
<!--=====================-->
<div class="main-cont">
	<div class="tip"><img src="${contextpath}/res/images/tip.png"><strong>重要提示：</strong>这里是提示区域，页面有错误信息将会展示在这个地方，前面所写的文字全部是屁话！</div>
	<div class="main-cont-title">
		<h5>我的入驻信息</h5>
		<c:if test="${empty baseDistributor}">
			<button class="btn" id="addBtn">我要入驻</button>
		</c:if>
	</div>
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr>
			<th>商户号</th>
			<th>商户名称</th>
			<th>法人</th>
			<th>联系人</th>
			<th>联系方式</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		<c:if test="${not empty baseDistributor}">
			<tr>
				<td>${baseDistributor.companyNumber}</td>
				<td>${baseDistributor.companyName}</td>
				<td>${baseDistributor.legalPerson}</td>
				<td>${baseDistributor.companyPerson1}</td>
				<td>${baseDistributor.companyPerson1Telephone}</td>
				<td></td>
				<td><a href="${contextpath}/distributor/updateview">编辑资料</a></td>
			</tr>
		</c:if>
	</table>
	<div class="main-cont-title">
		<h5>我的商城</h5>
	</div>
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr>
			<th>商城名称</th>
			<th>商城域名</th>
			<th>商城类型</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		<tr>
			<td>葛大爷与海公公成人云村长商城</td>
			<td>www.yuncunzhanggaoji.com</td>
			<td>小商品批发</td>
			<td>正常</td>
			<td><button class="btn">商城管理</button></td>
		</tr>
	</table>
</div>
</body>
</html>
<script type="text/javascript">
	$(document).ready(
			function(){
				$('#addBtn').click(function(e){
					window.location.href='${ contextpath}/distributor/addview';
				});
			}
	);
</script>