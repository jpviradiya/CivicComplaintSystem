<%@ page import="java.util.Map" %>
<html>
<head>
  <title>System Report | Civic Connect</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<nav class="navbar">
  <a href="${pageContext.request.contextPath}/home" class="navbar-brand">Admin Reports</a>
  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/jsp/admin-dashboard.jsp">Back to Dashboard</a>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
  </div>
</nav>

<div class="container" style="max-width: 700px;">
  <div class="card">
    <h2 style="text-align: left; margin-top: 0;">Complaint Statistics</h2>
    <p style="color: var(--text-muted); margin-bottom: 2rem;">Overview of total complaint volume categorized by current status.</p>

    <div class="table-wrapper">
      <table>
        <thead>
        <tr>
          <th>Complaint Status</th>
          <th style="text-align: center;">Total Count</th>
        </tr>
        </thead>
        <tbody>
        <%
          Map<String, Integer> report = (Map<String, Integer>) request.getAttribute("report");
          if (report != null && !report.isEmpty()) {
            for (Map.Entry<String, Integer> entry : report.entrySet()) {
        %>
        <tr>
          <td>
             <span class="status-badge <%= entry.getKey().equalsIgnoreCase("Resolved") ? "status-resolved" : "status-pending" %>">
                 <%= entry.getKey() %>
             </span>
          </td>
          <td style="text-align: center; font-weight: 700; font-size: 1.1rem; color: var(--text-dark);">
            <%= entry.getValue() %>
          </td>
        </tr>
        <%
          } } else {
        %>
        <tr><td colspan="2" style="text-align: center; padding: 2rem;">No data available for the report.</td></tr>
        <% } %>
        </tbody>
      </table>
    </div>

    <div style="margin-top: 2rem; border-top: 1px solid var(--border); padding-top: 1.5rem; text-align: right;">
      <button onclick="window.print()" class="btn btn-primary" style="background: #64748b;">Print Report</button>
    </div>
  </div>
</div>
</body>
</html>