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
    <li><a href="#tab1" class="selected">商户添加</a></li> 
  	</ul>
</div> 
<div id="tab1" class="tabson">
  <ul class="forminfo">
  	<form action="" method="post"  id="baseDistributorForm">
									 
					 			   <li><label>id<b></b></label>
 			   <input  type="text" class="dfinput" id="id" name="baseDistributor.id" placeholder="请输入id"  />
 			   </li>
 				       			 			   <li><label>顺序身份号码，系统自动生成8位以a打头后接7位顺序阿拉伯数字从a0000001开始往后顺序排列该值作为用户的登录名写入用户表<b></b></label>
 			   <input  type="text" class="dfinput" id="companyNumber" name="baseDistributor.companyNumber" placeholder="请输入顺序身份号码，系统自动生成8位以a打头后接7位顺序阿拉伯数字从a0000001开始往后顺序排列该值作为用户的登录名写入用户表"  />
 			   </li>
 				       			 			   <li><label>公司全称<b></b></label>
 			   <input  type="text" class="dfinput" id="companyName" name="baseDistributor.companyName" placeholder="请输入公司全称"  />
 			   </li>
 				       			 			   <li><label>三证合一图片地址<b></b></label>
 			   <input  type="text" class="dfinput" id="threeinoneLicencePic" name="baseDistributor.threeinoneLicencePic" placeholder="请输入三证合一图片地址"  />
 			   </li>
 				       			 			   <li><label>法人姓名<b></b></label>
 			   <input  type="text" class="dfinput" id="legalPerson" name="baseDistributor.legalPerson" placeholder="请输入法人姓名"  />
 			   </li>
 				       			 			   <li><label>法人身份证照片正面<b></b></label>
 			   <input  type="text" class="dfinput" id="legalPersonIdCardPicAhead" name="baseDistributor.legalPersonIdCardPicAhead" placeholder="请输入法人身份证照片正面"  />
 			   </li>
 				       			 			   <li><label>法人身份证照片反面<b></b></label>
 			   <input  type="text" class="dfinput" id="legalPersonIdCardPicBack" name="baseDistributor.legalPersonIdCardPicBack" placeholder="请输入法人身份证照片反面"  />
 			   </li>
 				       			 			   <li><label>公司地址<b></b></label>
 			   <input  type="text" class="dfinput" id="companyAddress" name="baseDistributor.companyAddress" placeholder="请输入公司地址"  />
 			   </li>
 				       			 			   <li><label>公司电话<b></b></label>
 			   <input  type="text" class="dfinput" id="companyTelephone" name="baseDistributor.companyTelephone" placeholder="请输入公司电话"  />
 			   </li>
 				       			 			   <li><label>公司开户行<b></b></label>
 			   <input  type="text" class="dfinput" id="companyBankAddress" name="baseDistributor.companyBankAddress" placeholder="请输入公司开户行"  />
 			   </li>
 				       			 			   <li><label>公司开户行账号<b></b></label>
 			   <input  type="text" class="dfinput" id="companyBankAccount" name="baseDistributor.companyBankAccount" placeholder="请输入公司开户行账号"  />
 			   </li>
 				       			 			   <li><label>公司email<b></b></label>
 			   <input  type="text" class="dfinput" id="companyEmail" name="baseDistributor.companyEmail" placeholder="请输入公司email"  />
 			   </li>
 				       			 			   <li><label>公司传真<b></b></label>
 			   <input  type="text" class="dfinput" id="companyFax" name="baseDistributor.companyFax" placeholder="请输入公司传真"  />
 			   </li>
 				       			 			   <li><label>联系人姓名<b></b></label>
 			   <input  type="text" class="dfinput" id="companyPerson1" name="baseDistributor.companyPerson1" placeholder="请输入联系人姓名"  />
 			   </li>
 				       			 			   <li><label>联系人电话<b></b></label>
 			   <input  type="text" class="dfinput" id="companyPerson1Telephone" name="baseDistributor.companyPerson1Telephone" placeholder="请输入联系人电话"  />
 			   </li>
 				       			 			   <li><label>联系人电子邮件<b></b></label>
 			   <input  type="text" class="dfinput" id="companyPerson1Email" name="baseDistributor.companyPerson1Email" placeholder="请输入联系人电子邮件"  />
 			   </li>
 				       			 			   <li><label>注册时间<b></b></label>
 			   <input  type="text" class="dfinput" id="registerTime" name="baseDistributor.registerTime" placeholder="请输入注册时间"  />
 			   </li>
 				       			 			   <li><label>激活时间<b></b></label>
 			   <input  type="text" class="dfinput" id="activeTime" name="baseDistributor.activeTime" placeholder="请输入激活时间"  />
 			   </li>
 				       			 			   <li><label>状态，枚举字符串NORMAL (正常)CANCELED (注销)LOCKED (锁定)AUDITED (已审核)UNAUDITED (未审核)<b></b></label>
 			   <input  type="text" class="dfinput" id="status" name="baseDistributor.status" placeholder="请输入状态，枚举字符串NORMAL (正常)CANCELED (注销)LOCKED (锁定)AUDITED (已审核)UNAUDITED (未审核)"  />
 			   </li>
 				       			 			   <li><label>代理商现金汇总账户<b></b></label>
 			   <input  type="text" class="dfinput" id="cashAccount" name="baseDistributor.cashAccount" placeholder="请输入代理商现金汇总账户"  />
 			   </li>
 				       			 			   <li><label>行业名称<b></b></label>
 			   <input  type="text" class="dfinput" id="tradeName" name="baseDistributor.tradeName" placeholder="请输入行业名称"  />
 			   </li>
 				       			 			   <li><label>行业经营许可证图片<b></b></label>
 			   <input  type="text" class="dfinput" id="tradeLicencePic" name="baseDistributor.tradeLicencePic" placeholder="请输入行业经营许可证图片"  />
 			   </li>
 				       			 			   <li><label>创建时间<b></b></label>
 			   <input  type="text" class="dfinput" id="ctime" name="baseDistributor.ctime" placeholder="请输入创建时间"  />
 			   </li>
 				       			 			   <li><label>操作员id<b></b></label>
 			   <input  type="text" class="dfinput" id="oUid" name="baseDistributor.oUid" placeholder="请输入操作员id"  />
 			   </li>
 				        			<li><label>&nbsp;</label><input name="" type="submit" class="btn" value=" 确定"/>
    			&nbsp;&nbsp;
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

 
 <script type="text/javascript">

 
 	$(document).ready(
 		function(){
 		  $(".select1").uedSelect({
				width : 345			  
			});
 			$('#baseDistributorForm').on("click", ".doSubmit", function(e){
 				var a=$(e.delegateTarget).trigger("validate");
 			})
 			.validator({
 			    fields: {
 			    	 			    		 			    			'baseDistributor.id':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.companyNumber':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.companyName':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.threeinoneLicencePic':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.legalPerson':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.legalPersonIdCardPicAhead':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.legalPersonIdCardPicBack':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.companyAddress':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.companyTelephone':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.companyBankAddress':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.companyBankAccount':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.companyEmail':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.companyFax':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.companyPerson1':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.companyPerson1Telephone':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.companyPerson1Email':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.registerTime':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.activeTime':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.status':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.cashAccount':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.tradeName':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.tradeLicencePic':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.ctime':'required;',
 			    	     			    	 			    		 			    			'baseDistributor.oUid':'required;',
 			    	     			    	 			        
 			    },
 			   valid: function(form){
 				  var me = this;
 			        // 提交表单之前，hold住表单，防止重复提交
 			        me.holdSubmit();
 			        $.ajax({
 			            url:"${ contextpath}/basedistributor/addaction",
 			            data: $(form).serialize(),
 			            type: "POST",
 			            success: function(data){
 			                // 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
 			                me.holdSubmit(false);
 			                if(data.status=='success'){
 			                	parent.layer.alert('当前操作成功', {
								closeBtn: 0
								}, function(index){
									window.location.href='${ contextpath}/basedistributor/list';
									 parent.layer.close(index);
								});
 			                	 
 			                }else{
 			                	sAlert('当前操作失败');
 			                }
 			               
 			            }
 			        });
 			    }
 			})
 			;
 		 
 		}		
 	);
 </script>
 