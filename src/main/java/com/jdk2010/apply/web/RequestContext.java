package com.jdk2010.apply.web;


/**
 * 当前请求的上下文
 * 包括当前请求的开始执行时间、异常
 */
public class RequestContext {

    //当前请求SID
    private static ThreadLocal<Integer> userIdThreadLocal=new ThreadLocal<>();

    public static Integer getUserId() {
        return userIdThreadLocal.get();
    }

    public static void setUserId(Integer userId) {
        userIdThreadLocal.set(userId);
    }
}
