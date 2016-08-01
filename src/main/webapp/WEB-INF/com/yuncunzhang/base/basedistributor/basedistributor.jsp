<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商户</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
	<link href="${ contextpath }/res/css/page.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/layer/layer.js"></script>

</head>
<body>

<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">商户</a></li>
		</ul>
</div>
<div class="rightinfo">
		
					
							 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 			
																																																																																																																																																																																																																																	 <div class="tools">
			<ul class="toolbar">
			<li class="click" id="table_add"><span><img src="${ contextpath }/res/images/t01.png" /></span>添加</li>
	        <li id="table_delete" ><span><img src="${ contextpath }/res/images/t03.png" /></span>删除</li>
	        <li  id="table_refresh"><span><img src="${ contextpath }/res/images/t04.png" /></span>查询</li>
			</ul>
		</div>
				
			 		<div class="formtitle1">
			<span>商户</span>
		</div>
		<table class="tablelist">
		<thead>
				<tr>
				<th><input type="checkbox" width="15px"  id="checkAll"/></th>
				
														   <th>id</th>
																			   <th>顺序身份号码，系统自动生成8位以a打头后接7位顺序阿拉伯数字从a0000001开始往后顺序排列该值作为用户的登录名写入用户表</th>
																			   <th>公司全称</th>
																			   <th>三证合一图片地址</th>
																			   <th>法人姓名</th>
																			   <th>法人身份证照片正面</th>
																			   <th>法人身份证照片反面</th>
																			   <th>公司地址</th>
																			   <th>公司电话</th>
																			   <th>公司开户行</th>
																			   <th>公司开户行账号</th>
																			   <th>公司email</th>
																			   <th>公司传真</th>
																			   <th>联系人姓名</th>
																			   <th>联系人电话</th>
																			   <th>联系人电子邮件</th>
																			   <th>注册时间</th>
																			   <th>激活时间</th>
																			   <th>状态，枚举字符串NORMAL (正常)CANCELED (注销)LOCKED (锁定)AUDITED (已审核)UNAUDITED (未审核)</th>
																			   <th>代理商现金汇总账户</th>
																			   <th>行业名称</th>
																			   <th>行业经营许可证图片</th>
																			   <th>创建时间</th>
																			   <th>操作员id</th>
													<th>操作</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageList.list}" var="item">
				 	
			       <tr>
						<td><input type="checkbox" name="subBox" value="${item.id}" /></td>
												 						<td>
															${ item.id}
													</td>	

						 												 						<td>
															${ item.companyNumber}
													</td>	

						 												 						<td>
															${ item.companyName}
													</td>	

						 												 						<td>
															${ item.threeinoneLicencePic}
													</td>	

						 												 						<td>
															${ item.legalPerson}
													</td>	

						 												 						<td>
															${ item.legalPersonIdCardPicAhead}
													</td>	

						 												 						<td>
															${ item.legalPersonIdCardPicBack}
													</td>	

						 												 						<td>
															${ item.companyAddress}
													</td>	

						 												 						<td>
															${ item.companyTelephone}
													</td>	

						 												 						<td>
															${ item.companyBankAddress}
													</td>	

						 												 						<td>
															${ item.companyBankAccount}
													</td>	

						 												 						<td>
															${ item.companyEmail}
													</td>	

						 												 						<td>
															${ item.companyFax}
													</td>	

						 												 						<td>
															${ item.companyPerson1}
													</td>	

						 												 						<td>
															${ item.companyPerson1Telephone}
													</td>	

						 												 						<td>
															${ item.companyPerson1Email}
													</td>	

						 												 						<td>
															${ item.registerTime}
													</td>	

						 												 						<td>
															${ item.activeTime}
													</td>	

						 												 						<td>
															${ item.status}
													</td>	

						 												 						<td>
															${ item.cashAccount}
													</td>	

						 												 						<td>
															${ item.tradeName}
													</td>	

						 												 						<td>
															${ item.tradeLicencePic}
													</td>	

						 												 						<td>
															${ item.ctime}
													</td>	

						 												 						<td>
															${ item.oUid}
													</td>	

						 													<td>
							<a href="${ contextpath }/basedistributor/modify.htm?id=${item.id}" class="tablelink">编辑</a> 
							<a href="${ contextpath }/basedistributor/view.htm?id=${item.id}"  class="tablelink">查看</a>
 				   </tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page href="${ contextpath}/basedistributor/list?" data="pageList" />
		
</div>
</body>
</html>

<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			table_init("${ contextpath}/basedistributor","${ contextpath}/basedistributor/list?");
		});
</script>

 