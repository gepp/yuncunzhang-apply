package com.jdk2010.base.basedistributor.controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jdk2010.base.basedistributor.model.BaseDistributor;
import com.jdk2010.base.basedistributor.service.IBaseDistributorService;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.util.ReturnData;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.util.Page;
import com.jdk2010.framework.util.DbKit;
@Controller
@RequestMapping(value="/basedistributor")
public class BaseDistributorController extends BaseController{
	
	@Resource
	IBaseDistributorService baseDistributorService;
	
	@RequestMapping("/list")
	public String  list(HttpServletRequest request,HttpServletResponse response) throws Exception {
		 DbKit dbKit=new DbKit("select * from base_distributor  where 1=1 ");
		 		String searchSQL="";
		String orderSQL="";
			    		    			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     			     		     	dbKit.append(orderSQL);
		 Page pageList=baseDistributorService.queryForPageList(dbKit, getPage(),BaseDistributor.class);
		 setAttr("pageList", pageList);
		 return "/com/jdk2010/base/basedistributor/basedistributor";
	}

	@RequestMapping("/add")
	public String  add(HttpServletRequest request,HttpServletResponse response) throws Exception {
		return "/com/jdk2010/base/basedistributor/basedistributor_add";
	}
	@RequestMapping("/addaction")
	public void  addaction(HttpServletRequest request,HttpServletResponse response) throws Exception {
 		BaseDistributor baseDistributor=getModel(BaseDistributor.class);
  		baseDistributorService.save(baseDistributor);
 		ReturnData returnData=new ReturnData(Constants.SUCCESS,"操作成功");
		renderJson(response,returnData);
	}
	
	
	@RequestMapping("/modify")
	public String  modify(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String id=getPara("id");
		BaseDistributor baseDistributor=baseDistributorService.findById(id, BaseDistributor.class);
					 setAttr("baseDistributor", baseDistributor);
		return "/com/jdk2010/base/basedistributor/basedistributor_modify";
	}
	@RequestMapping("/modifyaction")
	public void  modifyaction(HttpServletRequest request,HttpServletResponse response) throws Exception {
 		BaseDistributor baseDistributor=getModel(BaseDistributor.class);
  		baseDistributorService.update(baseDistributor);
 		ReturnData returnData=new ReturnData(Constants.SUCCESS,"操作成功");
		renderJson(response,returnData);
	}
	
	@RequestMapping("/delete")
	public void  delete(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String ids=getPara("ids");
		baseDistributorService.deleteByIDS(ids,BaseDistributor.class);
		ReturnData returnData=new ReturnData(Constants.SUCCESS,"操作成功");
		renderJson(response,returnData);
	}
	
	@RequestMapping("/view")
	public String  view(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String id=getPara("id");
		BaseDistributor baseDistributor=baseDistributorService.findById(id, BaseDistributor.class);
					 setAttr("baseDistributor", baseDistributor);
		return "/com/jdk2010/base/basedistributor/basedistributor_view";
	}
	
}
