package com.ideaall.infinite.handler;


import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
 
public class CustomAuthenticationFailHandler implements AuthenticationFailureHandler {
    
    
    @Override
    public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse res, AuthenticationException arg2)
            throws IOException, ServletException {
        req.setAttribute("loginid", req.getParameter("bId"));
        req.getRequestDispatcher("/login?error=true").forward(req, res);
    }
 
}
//For example, if you receive your request on http://example.com/myapp/subdir,
//
//    RequestDispatcher dispatcher = 
//        request.getRequestDispatcher("index.jsp");
//    dispatcher.forward( request, response ); 
//Will forward the request to the page http://example.com/myapp/subdir/index.jsp.
//
//In any case, you can't forward request to a resource outside of the context.


