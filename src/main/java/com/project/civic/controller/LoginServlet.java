package com.project.civic.controller;

import com.project.civic.model.User;
import com.project.civic.repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final UserRepository userRepository = new UserRepository();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userRepository.findByEmailAndPassword(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if ("ADMIN".equals(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/jsp/admin-dashboard.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/jsp/dashboard.jsp");
            }

        } else {
            request.setAttribute("error", "Invalid Email or Password");
            request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
        }
    }
}