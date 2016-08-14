package com.jdk2010.apply.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.jdk2010.apply.common.Constants;
import com.jdk2010.apply.service.ISsoService;
import com.jdk2010.apply.util.EncodeUtils;
import com.jdk2010.base.security.securityuser.model.SecurityUser;
import com.jdk2010.base.security.securityuser.service.ISecurityUserService;
import com.jdk2010.framework.controller.BaseController;
import com.jdk2010.framework.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录相关的WEB接口
 * Created by zhangbin on 16/8/10.
 */
@Controller
@RequestMapping(value = "/sso")
public class SsoController extends BaseController {

    @Autowired
    private ISsoService ssoService;

    /**
     * 注册用户
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/reg")
    public void register(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            //用户名
            String userName=getPara("userName");
            if(StringUtil.isBlank(userName)){
                throw new Exception("用户名不可为空");
            }
            //手机号
            String phone=getPara("phone");
            if(StringUtil.isBlank(phone)||!StringUtil.isMobileNO(phone)){
                throw new Exception("手机号格式不支持");
            }
            //密码
            String password=getPara("password");
            if(StringUtil.isBlank(password)){
                throw new Exception("密码不可为空");
            }
            //验证码
            String smsCode=getPara("smsCode");
            if(StringUtil.isBlank(smsCode)){
                throw new Exception("验证码不可为空");
            }
            //TODO 其他属性
            SecurityUser securityUser=new SecurityUser();
            securityUser.setPhone(phone);
            securityUser.setUsername(userName);
            securityUser.setUserpwd(password);

            int userId=ssoService.registerUser(securityUser, smsCode);

            //生成cookie信息
            String loginInfo=userId+"#"+securityUser.getPhone()+"#"+System.currentTimeMillis();
            setCookie(response, "token", EncodeUtils.aesEncrypt(loginInfo, Constants.TOKEN_KEY), 60 * 60 * 1000);

            JSONObject jsonObject=new JSONObject();
            jsonObject.put("success", true);
            jsonObject.put("msg", "登录成功");
            renderJson(response, jsonObject);

        }catch (Exception ex){
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("success",false);
            jsonObject.put("msg",ex.getMessage());
            renderJson(response, jsonObject);
        }
    }

    /**
     * 用户名或者手机号+密码登录
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/login/bypass")
    public void loginWithPass(HttpServletResponse response) throws Exception {
        try {
            //手机号
            String userKey=getPara("userKey");
            if(StringUtil.isBlank(userKey)){
                throw new Exception("用户名或手机号不能为空");
            }
            //密码
            String password=getPara("password");
            if(StringUtil.isBlank(password)){
                throw new Exception("密码不可为空");
            }
            //校验登录
            SecurityUser securityUser = ssoService.loginByPass(userKey, password);

            //生成cookie信息
            String loginInfo=securityUser.getId()+"#"+securityUser.getPhone()+"#"+System.currentTimeMillis();
            setCookie(response,"token", EncodeUtils.aesEncrypt(loginInfo, Constants.TOKEN_KEY),60*60*1000);

            JSONObject jsonObject=new JSONObject();
            jsonObject.put("success",true);
            jsonObject.put("msg","登录成功");
            renderJson(response, jsonObject);

        }catch (Exception ex){
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("success",false);
            jsonObject.put("msg",ex.getMessage());
            renderJson(response, jsonObject);
        }
    }
    /**
     * 手机号+验证码登录
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/login/bycode")
    public void loginWithSmsCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            //手机号
            String phone=getPara("phone");
            if(StringUtil.isBlank(phone)){
                throw new Exception("手机号不能为空");
            }
            //密码
            String smsCode=getPara("smsCode");
            if(StringUtil.isBlank(smsCode)){
                throw new Exception("验证码不可为空");
            }
            //校验登录
            SecurityUser securityUser = ssoService.loginBySmsCode(phone, smsCode);

            //生成cookie信息
            String loginInfo=securityUser.getId()+"#"+securityUser.getPhone()+"#"+System.currentTimeMillis();
            setCookie(response,"token", EncodeUtils.aesEncrypt(loginInfo,Constants.TOKEN_KEY), 60 * 60 * 1000);

            JSONObject jsonObject=new JSONObject();
            jsonObject.put("success",true);
            jsonObject.put("msg","登录成功");
            renderJson(response, jsonObject);

        }catch (Exception ex){
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("success",false);
            jsonObject.put("msg",ex.getMessage());
            renderJson(response, jsonObject);
        }
    }

    /**
     * 发送登录验证码
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/code/login")
    public void sendCodeForLogin(HttpServletResponse response) throws Exception {
        try {
            //参数检查
            String phone=getPara("phone");
            if(StringUtil.isBlank(phone)||!StringUtil.isMobileNO(phone)){
                throw new Exception("手机号格式不支持");
            }
            //发送注册验证码
            ssoService.sendLoginSmsCode(phone);

            JSONObject jsonObject=new JSONObject();
            jsonObject.put("success",true);
            jsonObject.put("msg","现在没有实际发送验证码");
            renderJson(response,jsonObject);
        }catch (Exception ex){
            //TODO 所有ajax的异常可以独立出来
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("success",false);
            jsonObject.put("msg",ex.getMessage());
            renderJson(response,jsonObject);
        }
    }

    /**
     * 发送注册验证码
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/code/reg")
    public void sendCodeForReg(HttpServletResponse response) throws Exception {
        try {
            //参数检查
            String phone=getPara("phone");
            if(StringUtil.isBlank(phone)||!StringUtil.isMobileNO(phone)){
                throw new Exception("手机号格式不支持");
            }
            //发送注册验证码
            ssoService.sendRegSmsCode(phone);

            JSONObject jsonObject=new JSONObject();
            jsonObject.put("success",true);
            jsonObject.put("msg","现在没有实际发送验证码");
            renderJson(response,jsonObject);
        }catch (Exception ex){
            //TODO 所有ajax的异常可以独立出来
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("success",false);
            jsonObject.put("msg",ex.getMessage());
            renderJson(response,jsonObject);
        }
    }

    /**
     * 退出登录
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/logout")
    public String logout(HttpServletResponse response) throws Exception {
        //
        removeCookie(response, "token");
        //登录页面
        return "/com/yuncunzhang/base/sso/login";
    }

    /**
     * 登录页面
     * @return
     * @throws Exception
     */
    @RequestMapping("/login")
    public String login() throws Exception {
        //登录页面
        return "/com/yuncunzhang/base/sso/login";
    }
}
