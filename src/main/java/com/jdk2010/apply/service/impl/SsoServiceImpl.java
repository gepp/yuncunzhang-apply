package com.jdk2010.apply.service.impl;

import com.jdk2010.apply.service.ISsoService;
import com.jdk2010.base.security.securityuser.model.SecurityUser;
import com.jdk2010.base.security.securityuser.service.ISecurityUserService;
import com.jdk2010.base.sms.ISmsService;
import com.jdk2010.base.sms.model.SmsCode;
import com.jdk2010.framework.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 登录注册相关业务实现
 * Created by zhangbin on 16/8/11.
 */
@Service
public class SsoServiceImpl implements ISsoService{

    @Autowired
    private ISmsService smsService;

    @Autowired
    private ISecurityUserService securityUserService;

    @Override
    public void sendRegSmsCode(String phone) throws Exception {
        //TODO phone发送验证码的频率检查
        //TODO 产生验证码
        String code="TODO";
        //实际发送验证码
        SmsCode smsCode=new SmsCode();
        smsCode.setType(SmsCode.TYPE_REG);
        smsCode.setCode(code);
        smsCode.setCreateTime(System.currentTimeMillis());
        smsCode.setMobile(phone);
        smsCode.setValidInterval(SmsCode.DEFAULT_INVALID);
        smsService.sendSmsCode(smsCode);
    }

    @Override
    public int registerUser(SecurityUser securityUser,String smsCode) throws Exception {
        String phone=securityUser.getPhone();
        //检查验证码
        checkRegSmsCode(phone, smsCode);
        //检查用户名是否已经注册
        checkUserName(securityUser.getUsername());
        //检查手机号是否已经注册
        checkPhone(phone);
        //保存用户
        securityUserService.save(securityUser);
        //
        securityUser=securityUserService.getByPhone(phone);
        return securityUser.getId();
    }

    private void checkPhone(String phone) throws Exception {
        SecurityUser securityUser = securityUserService.getByPhone(phone);
        if(securityUser!=null){
            throw new Exception("该手机号已被注册");
        }
    }

    private void checkUserName(String username) throws Exception {
        SecurityUser securityUser = securityUserService.getByUserName(username);
        if(securityUser!=null){
            throw new Exception("该用户名已被注册");
        }
    }

    private void checkRegSmsCode(String phone, String smsCode) throws Exception {
//        SmsCode smsCodeInfo = smsService.getSmsCode(SmsCode.TYPE_REG, phone);
//        if(smsCodeInfo==null||
//                !smsCode.equals(smsCodeInfo.getCode())||
//                (System.currentTimeMillis()-smsCodeInfo.getCreateTime())>smsCodeInfo.getValidInterval()){
//            throw new Exception("验证码无效");
//        }
        return;
    }

    @Override
    public SecurityUser loginByPass(String phoneOrName, String password) throws Exception {
        SecurityUser securityUser;
        if(StringUtil.isMobileNO(phoneOrName)){
            //优先根据手机号
            securityUser = securityUserService.getByPhone(phoneOrName);
            if(securityUser==null){
                //再根据用户名查找用户
                securityUser=securityUserService.getByUserName(phoneOrName);
            }
        }else{
            //优先根据用户名
            securityUser = securityUserService.getByUserName(phoneOrName);
            if(securityUser==null){
                //再根据手机号查找用户
                securityUser=securityUserService.getByPhone(phoneOrName);
            }
        }
        if(securityUser==null){
            throw new Exception("用户不存在");
        }
        if(!password.equals(securityUser.getUserpwd())){
            throw new Exception("密码错误");
        }
        //TODO 错误次数控制
        return securityUser;
    }

    @Override
    public void sendLoginSmsCode(String phone) throws Exception {
        //TODO phone发送验证码的频率检查
        //TODO 产生验证码
        String code="TODO";
        //实际发送验证码
        SmsCode smsCode=new SmsCode();
        smsCode.setType(SmsCode.TYPE_LOGIN);
        smsCode.setCode(code);
        smsCode.setCreateTime(System.currentTimeMillis());
        smsCode.setMobile(phone);
        smsCode.setValidInterval(SmsCode.DEFAULT_INVALID);
        smsService.sendSmsCode(smsCode);
    }

    @Override
    public SecurityUser loginBySmsCode(String phone, String smsCode) throws Exception {
        //检查验证码
        checkLoginSmsCode(phone,smsCode);
        //TODO 错误次数控制
        //优先根据手机号
        SecurityUser securityUser = securityUserService.getByPhone(phone);
        if(securityUser==null){
            throw new Exception("用户不存在");
        }
        return securityUser;
    }

    private void checkLoginSmsCode(String phone, String smsCode) throws Exception {
        SmsCode smsCodeInfo = smsService.getSmsCode(SmsCode.TYPE_REG, phone);
        if(smsCodeInfo==null||
                !smsCode.equals(smsCodeInfo.getCode())||
                (System.currentTimeMillis()-smsCodeInfo.getCreateTime())>smsCodeInfo.getValidInterval()){
            throw new Exception("验证码无效");
        }
    }
}
