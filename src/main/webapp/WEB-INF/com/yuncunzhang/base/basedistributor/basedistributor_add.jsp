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
		.main-cont{width: 800px; margin: 0px auto 50px auto;}
		.main-cont-title{margin: 50px 0 50px 30px;}
		.main-cont-title h5{font-size: 18px; color: #333;}
		.main-cont-title h5:after{ display: block; content: ""; float: left; width: 3px; height: 18px; background: #1fb8bd; margin-right: 6px; margin-top: 4px;}
		.main-cont-form-group{margin-bottom:20px; margin-left: 100px;}
		.main-cont-form-group:before,.main-cont-form-group:after{content: ""; display: block; clear: both;}
		.main-cont-form-group label{width: 120px; text-align: right; font-size: 14px; display: block; float: left; line-height: 34px; margin-right: 10px;}
		.main-cont-form-group input{height: 34px; border: 1px solid #eee; padding: 0 10px; width: 300px; font-size: 14px; display: block; float: left; box-sizing: border-box;}
		.main-cont-form-group span{display: block; float: left; font-size: 14px; line-height: 34px;}
		.main-cont-form-group font{display: block; float: left; font-size: 12px; line-height: 34px; color: #ff0000; margin-left: 20px;}
		.main-cont-form-group .upload{ position: relative; width: 120px; height: 120px;border: 1px solid #eee;display: block; float: left; box-sizing: border-box; background: url(${contextpath}/res/images/upload_button.png) no-repeat; background-size:100% 100%;}
		.main-cont-form-group .upload_input{opacity: 0; width: 120px; height: 120px; position: absolute; top: 0; left: 0; cursor: pointer;}
		.btn{width: 180px; height: 50px; text-align: center; line-height: 50px; border: none; background: #eee; color: #333; font-size: 16px; border-radius: 4px; cursor: pointer;}
		.btn:hover{color: #fff; background: #05B7BE;}
		.submit{background: url(${contextpath}/res/images/btnbg.png); background-size: 100% 100%; color: #fff; margin: 0 10px;}
		.button{margin-left: 220px;}
	</style>
	<title>商户</title>
	<link href="${ contextpath }/res/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
	<script type="text/javascript" src="${ contextpath }/res/js/layer/layer.js"></script>
	<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
	<link rel="stylesheet" href="${ contextpath }/res/js/validator-0.7.3/jquery.validator.css">
	<script type="text/javascript" src="${ contextpath }/res/js/validator-0.7.3/jquery.validator.js"></script>
	<script type="text/javascript" src="${ contextpath }/res/js/validator-0.7.3/local/zh_CN.js"></script>
	<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ contextpath }/res/js/select-ui.min.js"></script>
	<script type="text/javascript"
			src="${ contextpath }/res/js/jquery.idTabs.min.js"></script>
</head>
<body>
<div class="settled-banner">
	<div class="settled-banner-cont">
		<h5>欢迎使用商家入驻平台</h5>
		<p>${securityUser.username}<a href="${contextpath}/sso/logout">[退出]</a></p>
	</div>
</div>
<div class="main-cont">
	<div class="main-cont-title">
		<h5>我的入驻信息</h5>
	</div>
	<div class="main-cont-form">
		<form action="" method="post"  id="baseDistributorForm">
			<div class="main-cont-form-group">
				<label>公司名称：</label>
				<input type="text" name="baseDistributor.companyName" id="companyName" value="" placeholder="请输入公司全称" />
			</div>
			<div class="main-cont-form-group">
				<label>法人名称：</label>
				<input type="text" name="baseDistributor.legalPerson" id="legalPerson" value="" placeholder="请输入法人名称" />
			</div>
			<div class="main-cont-form-group">
				<label>公司地址：</label>
				<input type="text" name="baseDistributor.companyAddress" id="companyAddress" value="" placeholder="请输入公司地址" />
			</div>
			<div class="main-cont-form-group">
				<label>公司电话：</label>
				<input type="text" name="baseDistributor.companyTelephone" id="companyTelephone" value="" placeholder="请输入公司电话" />
			</div>
			<div class="main-cont-form-group">
				<label>开户行：</label>
				<input type="text" name="baseDistributor.companyBankAddress" id="companyBankAddress" value="" placeholder="请输入开户行" />
			</div>
			<div class="main-cont-form-group">
				<label>开户行账号：</label>
				<input type="text" name="baseDistributor.companyBankAccount" id="companyBankAccount" value="" placeholder="请输入开户行账号" />
			</div>
			<div class="main-cont-form-group">
				<label>公司邮箱：</label>
				<input type="text" name="baseDistributor.companyEmail" id="companyEmail" value="" placeholder="请输入公司邮箱" />
			</div>
			<div class="main-cont-form-group">
				<label>公司传真：</label>
				<input type="text" name="baseDistributor.companyFax" id="companyFax" value="" placeholder="请输入公司传真" />
			</div>
			<div class="main-cont-form-group">
				<label>联系人：</label>
				<input type="text" name="baseDistributor.companyPerson1" id="companyPerson1" value="" placeholder="请输入公司联系人" />
			</div>
			<div class="main-cont-form-group">
				<label>联系人电话：</label>
				<input type="text" name="baseDistributor.companyPerson1Telephone" id="companyPerson1Telephone" value="" placeholder="请输入公司联系人电话" />
			</div>
			<div class="main-cont-form-group">
				<label>联系人邮箱：</label>
				<input type="text" name="baseDistributor.companyPerson1Email" id="companyPerson1Email" value="" placeholder="请输入公司联系人邮箱" />
			</div>
			<div class="main-cont-form-group">
				<label>行业名称：</label>
				<input type="text" name="baseDistributor.tradeName" id="tradeName" value="" placeholder="请输入公司行业" />
			</div>
			<div class="main-cont-form-group">
				<label>三证合一副本：</label>
				<div class="upload">
					<input type="file" name="baseDistributor.threeinoneLicencePic" id="threeinoneLicencePic" value="" class="upload_input"/>
				</div>
			</div>
			<div class="main-cont-form-group">
				<label>法人身份证照片正面：</label>
				<div class="upload">
					<input type="file" name="baseDistributor.legalPersonIdCardPicAhead" id="legalPersonIdCardPicAhead" value="" class="upload_input"/>
				</div>
			</div>
			<div class="main-cont-form-group">
				<label>法人身份证照片反面：</label>
				<div class="upload">
					<input type="file" name="baseDistributor.legalPersonIdCardPicBack" id="legalPersonIdCardPicBack" value="" class="upload_input"/>
				</div>
			</div>
			<div class="main-cont-form-group">
				<label>行业经营许可证图片：</label>
				<input type="text" name="baseDistributor.tradeLicencePic" id="tradeLicencePic" value="" placeholder="请输入行业经营许可证图片" />
			</div>
			<div id="tab2" class="tabson">
				<div class="formtitle1">
					<span>商品详细介绍</span>
				</div>
					<textarea id="brief" name="productProduct.brief" cols="100"
							  rows="18" style="width: 100%; height: 400px; visibility: hidden;">
					 </textarea>
			</div>
			<div id="tab3" class="tabson">
				<div class="formtitle1">
					<span>批量上传商品图片</span>
				</div>
				<ul class="toolbar">
					<li class="click" id="selectImage"><span><img
							src="${ contextpath }/res/images/t01.png" /></span>批量上传图片</li>
				</ul>
				<br/>
				<div id="imageView">
					<ul class="imglist" id="productImageList">

					</ul>
				</div>
			</div>
			<div class="button">
				<button class="btn submit" type="submit">提交审核</button>
				<button class="btn">返回</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>

<script type="text/javascript">
	$(document).ready(
			function(){
				$('#baseDistributorForm').on("click", ".doSubmit", function(e){
					var a=$(e.delegateTarget).trigger("validate");
				}).validator({
					fields: {
						'baseDistributor.companyName':'required;',
						'baseDistributor.legalPerson':'required;',
						'baseDistributor.companyAddress':'required;',
						'baseDistributor.companyTelephone':'required;',
						'baseDistributor.companyBankAddress':'required;',
						'baseDistributor.companyBankAccount':'required;',
						'baseDistributor.companyEmail':'required;',
						'baseDistributor.companyFax':'required;',
						'baseDistributor.companyPerson1':'required;',
						'baseDistributor.companyPerson1Telephone':'required;',
						'baseDistributor.companyPerson1Email':'required;',
						'baseDistributor.tradeName':'required;',
						'baseDistributor.tradeLicencePic':'required;',
						'baseDistributor.legalPersonIdCardPicAhead':'required;',
						'baseDistributor.legalPersonIdCardPicBack':'required;',
						'baseDistributor.threeinoneLicencePic':'required;'
					},
					valid: function(form){
						var me = this;
						// 提交表单之前，hold住表单，防止重复提交
						me.holdSubmit();
						$.ajax({
							url:"${ contextpath}/distributor/add",
							data: $(form).serialize(),
							type: "POST",
							success: function(data){
								// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
								me.holdSubmit(false);
								if(data.status=='success'){
									parent.layer.alert('当前操作成功', {
										closeBtn: 0
									}, function(index){
										window.location.href='${ contextpath}/distributor/index';
										parent.layer.close(index);
									});

								}else{
									sAlert('当前操作失败');
								}

							}
						});
					}
				});
			}
	);
</script>