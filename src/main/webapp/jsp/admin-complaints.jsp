<%@ page import="java.util.List, com.project.civic.model.Complaint" %>
<html>
<head>
  <title>Admin Management</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/components/navbar.jsp" />
<div class="container">
  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
    <h2 style="margin: 0;">Global Complaint Management</h2>
    <a href="${pageContext.request.contextPath}/jsp/admin-dashboard.jsp" class="btn btn-primary" style="background: #64748b;">Back to Panel</a>
  </div>

  <div class="table-wrapper">
    <table>
      <thead>
      <tr>
        <th>ID</th>
        <th>User</th>
        <th>Title</th>
        <th>Status</th>
        <th>Update Action</th>
      </tr>
      </thead>
      <tbody>
      <%
        List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
        if (complaints != null) {
          for (Complaint c : complaints) {
      %>
      <tr>
        <td style="font-weight: 600; color: var(--text-muted);">#<%= c.getId() %></td>
        <td>ID: <%= c.getUserId() %></td>
        <td><strong><%= c.getTitle() %></strong></td>
        <td>
          <span class="status-badge <%= c.getStatus().equalsIgnoreCase("Resolved") ? "status-resolved" : "status-pending" %>">
              <%= c.getStatus() %>
          </span>
        </td>
        <td>
          <form action="${pageContext.request.contextPath}/updateStatus" method="post" style="display: flex; gap: 8px;">
            <input type="hidden" name="id" value="<%= c.getId() %>"/>
            <select name="status" style="padding: 4px 8px; font-size: 0.875rem;">
              <option value="Pending" <%= c.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
              <option value="In Progress" <%= c.getStatus().equals("In Progress") ? "selected" : "" %>>In Progress</option>
              <option value="Resolved" <%= c.getStatus().equals("Resolved") ? "selected" : "" %>>Resolved</option>
            </select>
            <button type="submit" class="btn btn-primary" style="padding: 4px 12px; font-size: 0.8rem;">Save</button>
          </form>
        </td>
      </tr>
      <% } } %>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>