package com.project.civic.controller;

import com.project.civic.dto.ComplaintDTO;
import com.project.civic.repository.ComplaintRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/viewComplaintDetails")
public class ViewComplaintDetailsServlet extends HttpServlet {

    private final ComplaintRepository repository = new ComplaintRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/viewAllComplaints");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            ComplaintDTO complaint = repository.findByIdWithUser(id);
            
            if (complaint == null) {
                response.sendRedirect(request.getContextPath() + "/viewAllComplaints");
                return;
            }

            request.setAttribute("complaint", complaint);
            request.getRequestDispatcher("/jsp/admin-complaint-details.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/viewAllComplaints");
        }
    }
}
