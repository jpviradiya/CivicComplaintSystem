<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Admin Management</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <style>
    .action-buttons {
      display: flex;
      gap: 12px;
      align-items: center;
    }
  </style>
</head>
<body>
<jsp:include page="/components/navbar.jsp" />
<div class="container">

  <div class="table-wrapper">
    <table>
      <thead>
      <tr>
        <th>Serial No.</th>
        <th>User Name</th>
        <th>Title</th>
        <th>Status</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <c:choose>
        <c:when test="${not empty complaints}">
          <c:forEach var="c" items="${complaints}" varStatus="loop">
            <tr>
              <td style="font-weight: 600; color: var(--text-muted);">${loop.index + 1}</td>
              <td><c:out value="${c.userName}" /></td>
              <td><strong><c:out value="${c.title}" /></strong></td>
              <td>
                <span class="status-badge ${c.status eq 'Resolved' ? 'status-resolved' : 'status-pending'}">
                    <c:out value="${c.status}" />
                </span>
              </td>
              <td>
                <div class="action-buttons">
                  <a href="${pageContext.request.contextPath}/viewComplaintDetails?id=${c.id}" class="btn btn-primary" style="background: #3b82f6; padding: 4px 12px; font-size: 0.8rem; text-decoration: none;">View More</a>
                </div>
              </td>
            </tr>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <tr>
            <td colspan="5" style="text-align: center; color: var(--text-muted);">No complaints found.</td>
          </tr>
        </c:otherwise>
      </c:choose>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>