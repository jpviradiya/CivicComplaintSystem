<%@ page import="java.util.List, com.project.civic.model.Complaint" %>
<html>
<head>
  <title>My Complaints | Civic Connect</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<nav class="navbar">
  <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp" class="navbar-brand">Civic Connect</a>
  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp">Dashboard</a>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
  </div>
</nav>

<div class="container">
  <div style="margin-bottom: 2rem;">
    <h2 style="text-align: left; margin: 0;">Your Filed Complaints</h2>
    <p style="color: var(--text-muted);">Track the status and progress of your reports below.</p>
  </div>

  <div class="table-wrapper">
    <table>
      <thead>
      <tr>
        <th style="width: 30%;">Title</th>
        <th style="width: 50%;">Description</th>
        <th style="width: 20%;">Status</th>
      </tr>
      </thead>
      <tbody>
      <%
        List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
        if (complaints != null && !complaints.isEmpty()) {
          for (Complaint c : complaints) {
      %>
      <tr>
        <td><strong><%= c.getTitle() %></strong></td>
        <td style="color: var(--text-muted); font-size: 0.9rem;"><%= c.getDescription() %></td>
        <td>
            <span class="status-badge <%= c.getStatus().equalsIgnoreCase("Resolved") ? "status-resolved" : "status-pending" %>">
                <%= c.getStatus() %>
            </span>
        </td>
      </tr>
      <% } } else { %>
      <tr><td colspan="3" style="text-align:center; padding: 3rem; color: var(--text-muted);">No complaints found in your history.</td></tr>
      <% } %>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>