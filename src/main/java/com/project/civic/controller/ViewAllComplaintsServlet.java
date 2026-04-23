package com.project.civic.controller;

import com.project.civic.repository.ComplaintRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/viewAllComplaints")
public class ViewAllComplaintsServlet extends HttpServlet {

    private final ComplaintRepository repository = new ComplaintRepository();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("complaints", repository.findAll());
        request.getRequestDispatcher("jsp/admin-complaints.jsp")
                .forward(request, response);
    }
}
