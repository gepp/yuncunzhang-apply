package com.jdk2010.apply.web.filter;

import com.jdk2010.apply.common.Constants;
import com.jdk2010.apply.util.EncodeUtils;
import com.jdk2010.apply.web.RequestContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {
    Logger logger = LoggerFactory.getLogger(this.getClass());

    public LoginFilter() {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
            ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        Cookie cookie=getCookieObject(req,"token");
        if(cookie!=null){
            String token=cookie.getValue();
            try {

                String loginInfo=EncodeUtils.aesDecrypt(token, Constants.TOKEN_KEY);
                String tmp[]=loginInfo.split("#");
                String userId = tmp[0];
                RequestContext.setUserId(Integer.parseInt(userId));
                chain.doFilter(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                res.sendRedirect(req.getContextPath() + "/sso/login/");
            }
        }
        res.sendRedirect(req.getContextPath() + "/sso/login/");
    }

    public Cookie getCookieObject(HttpServletRequest request,String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null)
            for (Cookie cookie : cookies)
                if (cookie.getName().equals(name))
                    return cookie;
        return null;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

}
