package com.project.civic.controller;

import com.project.civic.model.User;
import com.project.civic.repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private final UserRepository userRepository = new UserRepository();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (userRepository.existsByEmail(email)) {
            request.setAttribute("errorMessage", "Registration failed. User with this email already exists.");
            request.getRequestDispatcher("jsp/register.jsp").forward(request, response);
            return;
        }

        User user = new User(name, email, password, role);
        boolean success = userRepository.save(user);

        if (success) {
            request.getSession().setAttribute("successMessage", "Registration successful. Please log in.");
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        } else {
            request.setAttribute("errorMessage", "Registration failed. An error occurred.");
            request.getRequestDispatcher("jsp/register.jsp").forward(request, response);
        }
    }
}