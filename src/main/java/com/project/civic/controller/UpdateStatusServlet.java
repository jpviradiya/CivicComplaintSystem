package com.project.civic.controller;

import com.project.civic.repository.ComplaintRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateStatus")
public class UpdateStatusServlet extends HttpServlet {

    private final ComplaintRepository repository = new ComplaintRepository();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        repository.updateStatus(id, status);

        response.sendRedirect("viewAllComplaints");
    }
}