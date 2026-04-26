<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Complaint Details | Admin Panel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .details-card {
            background: #fff;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            margin-bottom: 2rem;
        }
        .detail-row {
            display: flex;
            margin-bottom: 1rem;
            border-bottom: 1px solid #e2e8f0;
            padding-bottom: 1rem;
        }
        .detail-row:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }
        .detail-label {
            font-weight: 600;
            color: #475569;
            width: 150px;
            flex-shrink: 0;
        }
        .detail-value {
            color: #1e293b;
        }
        .status-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.875rem;
            font-weight: 500;
        }
        .status-resolved {
            background: #dcfce7;
            color: #166534;
        }
        .status-pending {
            background: #fef9c3;
            color: #854d0e;
        }
    </style>
</head>
<body>
<jsp:include page="/components/navbar.jsp" />

<div class="container">
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
        <h2 style="margin: 0;">Complaint Details</h2>
        <a href="${pageContext.request.contextPath}/viewAllComplaints" class="btn btn-primary" style="background: #64748b;">Back to List</a>
    </div>

    <c:if test="${not empty complaint}">
        <div class="details-card">
            <div class="detail-row">
                <div class="detail-label">User Name</div>
                <div class="detail-value"><c:out value="${complaint.userName}" /></div>
            </div>
            <div class="detail-row">
                <div class="detail-label">Title</div>
                <div class="detail-value"><strong><c:out value="${complaint.title}" /></strong></div>
            </div>
            <div class="detail-row">
                <div class="detail-label">Description</div>
                <div class="detail-value" style="white-space: pre-wrap;"><c:out value="${complaint.description}" /></div>
            </div>
            <div class="detail-row">
                <div class="detail-label">Status</div>
                <div class="detail-value">
                    <span class="status-badge ${complaint.status eq 'Resolved' ? 'status-resolved' : 'status-pending'}">
                        <c:out value="${complaint.status}" />
                    </span>
                </div>
            </div>
            
            <div style="margin-top: 2rem; padding-top: 1.5rem; border-top: 1px solid #e2e8f0;">
                <form action="${pageContext.request.contextPath}/updateStatus" method="post" style="display: flex; gap: 12px; align-items: center;">
                    <input type="hidden" name="id" value="${complaint.id}"/>
                    <label for="status" class="detail-label" style="width: auto;">Update Status:</label>
                    <select name="status" id="status" style="padding: 8px 12px; font-size: 1rem; border-radius: 6px; border: 1px solid #cbd5e1;">
                        <option value="Pending" ${complaint.status eq 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="In Progress" ${complaint.status eq 'In Progress' ? 'selected' : ''}>In Progress</option>
                        <option value="Resolved" ${complaint.status eq 'Resolved' ? 'selected' : ''}>Resolved</option>
                    </select>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
    </c:if>
    <c:if test="${empty complaint}">
        <div class="details-card" style="text-align: center; color: #ef4444;">
            <h3>Complaint not found.</h3>
        </div>
    </c:if>

</div>
</body>
</html>
