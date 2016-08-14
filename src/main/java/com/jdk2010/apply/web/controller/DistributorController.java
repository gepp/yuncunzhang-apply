package com.jdk2010.apply.web.controller;

import com.jdk2010.apply.web.RequestContext;
import com.jdk2010.base.basedistributor.model.BaseDistributor;
import com.jdk2010.base.basedistributor.service.IBaseDistributorService;
import com.jdk2010.base.security.securityuser.model.SecurityUser;
import com.jdk2010.base.security.securityuser.service.ISecurityUserService;
import com.jdk2010.framework.constant.Constants;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.util.DbKit;
import com.jdk2010.framework.util.Page;
import com.jdk2010.framework.util.ReturnData;
import com.jdk2010.framework.util.StringUtil;
import org.apache.commons.logging.Log;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.Date;

/**
 * 商家相关接口
 */
@Controller
@RequestMapping(value="/distributor")
public class DistributorController extends BaseController{

    @Autowired
    IBaseDistributorService baseDistributorService;

    @Autowired
    private ISecurityUserService securityUserService;

    /**
     * 添加商户view
     * @return
     * @throws Exception
     */
    @RequestMapping("/addview")
    public String addView() throws Exception {

        return "/com/yuncunzhang/base/basedistributor/basedistributor_add";
    }

    /**
     * 添加商户
     * @param response
     * @throws Exception
     */
    @RequestMapping("/add")
    public void  add(HttpServletResponse response) throws Exception {
        try {
            int userId=RequestContext.getUserId();
            //查询用户绑定的信息
            SecurityUser securityUser=securityUserService.findById(userId, SecurityUser.class);
            if(securityUser!=null){
                BaseDistributor baseDistributor=getModel(BaseDistributor.class);
                baseDistributor.setRegisterTime(new Date());
                baseDistributor.setCtime(new Date());
                //number生成
                String newNumber=getDistributorNumber();
                baseDistributor.setCompanyNumber(newNumber);
                baseDistributorService.save(baseDistributor);
                //查询出最新生成的ID
                BaseDistributor newBaseDistributor = baseDistributorService.getByNumber(newNumber);
                Integer newBaseDistributorId = newBaseDistributor.getId();
                //绑定到用户
                securityUser.setDistributorid(newBaseDistributorId);

                securityUserService.update(securityUser);

                ReturnData returnData=new ReturnData(Constants.SUCCESS,"操作成功");
                renderJson(response, returnData);
            }else {
                throw new Exception("用户不存在");
            }
        }catch (Exception ex){
            ReturnData returnData=new ReturnData(Constants.ERROR,ex.getMessage());
            renderJson(response,returnData);
        }
    }

    private String getDistributorNumber(){
        //查询最新的number
        String topNumber;
        BaseDistributor maxIdDistributor = baseDistributorService.getMaxId();
        if(maxIdDistributor==null){
            topNumber="A0000000";
        }else{
            topNumber=maxIdDistributor.getCompanyNumber();
        }
        //
        String numberIdStr = topNumber.substring(1);
        int maxNumberId = Integer.parseInt(numberIdStr);
        maxNumberId++;
        //
        DecimalFormat df = new DecimalFormat("0000000");
        return "A"+df.format(maxNumberId);
    }
    /**
     * 商户列表信息
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/index")
    public String  index(HttpServletRequest request,HttpServletResponse response) throws Exception {
        int userId=RequestContext.getUserId();
        //查询用户绑定的信息
        SecurityUser securityUser=securityUserService.findById(userId, SecurityUser.class);
        if(securityUser!=null){
            Integer distributorId=securityUser.getDistributorid();
            if(distributorId != null && distributorId!=0){
                BaseDistributor baseDistributor=baseDistributorService.findById(distributorId, BaseDistributor.class);
                setAttr("baseDistributor", baseDistributor);
            }
            setAttr("securityUser", securityUser);
        }
        return "/com/yuncunzhang/base/basedistributor/basedistributor";
    }

    /**
     * 商户入驻信息修改view
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateview")
    public String updateView() throws Exception {
        int userId=RequestContext.getUserId();
        //查询用户绑定的信息
        SecurityUser securityUser=securityUserService.findById(userId, SecurityUser.class);
        if(securityUser!=null){
            Integer distributorId=securityUser.getDistributorid();
            if(distributorId != null && distributorId!=0){
                BaseDistributor baseDistributor=baseDistributorService.findById(distributorId, BaseDistributor.class);
                setAttr("baseDistributor", baseDistributor);
            }
            setAttr("securityUser", securityUser);
        }
        return "/com/yuncunzhang/base/basedistributor/basedistributor_view";
    }

    /**
     *  商户入驻信息修改
     * @return
     * @throws Exception
     */
    @RequestMapping("/update")
    public void update(HttpServletResponse response) throws Exception {
        int userId=RequestContext.getUserId();
        BaseDistributor baseDistributor=getModel(BaseDistributor.class);
        //
        try {
            //查询用户绑定的信息
            SecurityUser securityUser=securityUserService.findById(userId, SecurityUser.class);
            if(securityUser==null||securityUser.getDistributorid()!=baseDistributor.getId()){
                throw new Exception("没有修改权限");
            }
            baseDistributorService.update(baseDistributor);

            ReturnData returnData=new ReturnData(Constants.SUCCESS,"操作成功");
            renderJson(response,returnData);
        }catch (Exception ex){
            ReturnData returnData=new ReturnData(Constants.ERROR,"操作失败");
            renderJson(response,returnData);
        }
    }
}
