package com.project.civic.filter;

import com.project.civic.model.User;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        String loginURI = request.getContextPath() + "/login";
        String registerURI = request.getContextPath() + "/register";
        String loginJsp = request.getContextPath() + "/jsp/login.jsp";
        String registerJsp = request.getContextPath() + "/jsp/register.jsp";

        boolean loggedIn = (session != null && session.getAttribute("user") != null);
        boolean loginRequest = request.getRequestURI().equals(loginURI) || request.getRequestURI().equals(loginJsp);
        boolean registerRequest = request.getRequestURI().equals(registerURI) || request.getRequestURI().equals(registerJsp);
        boolean staticResource = request.getRequestURI().endsWith(".css") || request.getRequestURI().contains("/css/");

        if (loggedIn && (loginRequest || registerRequest)) {
            User user = (User) session.getAttribute("user");
            if ("ADMIN".equals(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/jsp/admin-dashboard.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/jsp/dashboard.jsp");
            }
            return;
        }

        if (loggedIn || loginRequest || registerRequest || staticResource) {
            if (loggedIn && !staticResource) {
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
            }

            if (request.getRequestURI().contains("admin") || request.getRequestURI().contains("viewAllComplaints")) {
                User user = (User) session.getAttribute("user");
                if (user == null || !"ADMIN".equals(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/jsp/dashboard.jsp");
                    return;
                }
            }
            chain.doFilter(request, response);
        } else {
            response.sendRedirect(loginJsp);
        }
    }
}