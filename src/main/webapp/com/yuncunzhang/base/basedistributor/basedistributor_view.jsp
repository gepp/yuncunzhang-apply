<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商户</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">商户</a></li>
    </ul>
</div>
<div class="formbody">
<div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">商户查看</a></li> 
  	</ul>
</div> 
<div id="tab1" class="tabson">
  <ul class="forminfo">
  <form action="" method="POST"  id="baseDistributorForm">
									 
					 			   <li><label>id<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.id}
   				</div>
 			   </li>
 				       			 			   <li><label>顺序身份号码，系统自动生成8位以a打头后接7位顺序阿拉伯数字从a0000001开始往后顺序排列该值作为用户的登录名写入用户表<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.companyNumber}
   				</div>
 			   </li>
 				       			 			   <li><label>公司全称<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.companyName}
   				</div>
 			   </li>
 				       			 			   <li><label>三证合一图片地址<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.threeinoneLicencePic}
   				</div>
 			   </li>
 				       			 			   <li><label>法人姓名<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.legalPerson}
   				</div>
 			   </li>
 				       			 			   <li><label>法人身份证照片正面<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.legalPersonIdCardPicAhead}
   				</div>
 			   </li>
 				       			 			   <li><label>法人身份证照片反面<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.legalPersonIdCardPicBack}
   				</div>
 			   </li>
 				       			 			   <li><label>公司地址<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.companyAddress}
   				</div>
 			   </li>
 				       			 			   <li><label>公司电话<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.companyTelephone}
   				</div>
 			   </li>
 				       			 			   <li><label>公司开户行<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.companyBankAddress}
   				</div>
 			   </li>
 				       			 			   <li><label>公司开户行账号<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.companyBankAccount}
   				</div>
 			   </li>
 				       			 			   <li><label>公司email<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.companyEmail}
   				</div>
 			   </li>
 				       			 			   <li><label>公司传真<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.companyFax}
   				</div>
 			   </li>
 				       			 			   <li><label>联系人姓名<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.companyPerson1}
   				</div>
 			   </li>
 				       			 			   <li><label>联系人电话<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.companyPerson1Telephone}
   				</div>
 			   </li>
 				       			 			   <li><label>联系人电子邮件<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.companyPerson1Email}
   				</div>
 			   </li>
 				       			 			   <li><label>注册时间<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.registerTime}
   				</div>
 			   </li>
 				       			 			   <li><label>激活时间<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.activeTime}
   				</div>
 			   </li>
 				       			 			   <li><label>状态，枚举字符串NORMAL (正常)CANCELED (注销)LOCKED (锁定)AUDITED (已审核)UNAUDITED (未审核)<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.status}
   				</div>
 			   </li>
 				       			 			   <li><label>代理商现金汇总账户<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.cashAccount}
   				</div>
 			   </li>
 				       			 			   <li><label>行业名称<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.tradeName}
   				</div>
 			   </li>
 				       			 			   <li><label>行业经营许可证图片<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.tradeLicencePic}
   				</div>
 			   </li>
 				       			 			   <li><label>创建时间<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.ctime}
   				</div>
 			   </li>
 				       			 			   <li><label>操作员id<b></b></label>
 			     <div class="control-group">
   			 		${ baseDistributor.oUid}
   				</div>
 			   </li>
 				        			<li><label>&nbsp;</label>
   			 <input name="" type="button" class="btn" value="返回" onclick="window.location='${ contextpath}/basedistributor/list'"/></li>
 	</form>
  </ul>
 </div>
 </div>  
</div>
</body>
</html>
  <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

 
 