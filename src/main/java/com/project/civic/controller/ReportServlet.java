package com.project.civic.controller;

import com.project.civic.repository.ComplaintRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {

    private final ComplaintRepository repository = new ComplaintRepository();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, Integer> report = repository.getComplaintReport();

        request.setAttribute("report", report);
        request.getRequestDispatcher("jsp/report.jsp").forward(request, response);
    }
}