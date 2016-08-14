package com.jdk2010.apply.service;

import com.jdk2010.base.security.securityuser.model.SecurityUser;

/**
 * 登录注册接口
 * Created by zhangbin on 16/8/11.
 */
public interface ISsoService {
    /**
     * 发送注册验证码
     * @param phone
     * @throws Exception
     */
    void sendRegSmsCode(String phone) throws Exception;

    /**
     * 发送登录短信验证码
     * @param phone
     * @throws Exception
     */
    void sendLoginSmsCode(String phone) throws Exception;

    /**
     * 注册新用户
     * @param securityUser
     * @throws Exception
     */
    int registerUser(SecurityUser securityUser,String smsCode) throws Exception;

    /**
     * 用户名或者手机号+密码登录
     * @param phoneOrName
     * @param password
     * @throws Exception
     */
    SecurityUser loginByPass(String phoneOrName, String password) throws Exception;

    /**
     * 手机号+验证码登录
     * @param phone
     * @param smsCode
     * @throws Exception
     */
    SecurityUser loginBySmsCode(String phone, String smsCode) throws Exception;
}
