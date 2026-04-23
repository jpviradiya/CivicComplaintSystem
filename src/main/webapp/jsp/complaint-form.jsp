<%@ page import="com.project.civic.model.User" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
    return;
  }
%>
<html>
<head>
  <title>File a Complaint | Civic Connect</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/components/navbar.jsp" />

<div class="container" style="max-width: 650px;">
  <div class="card">
    <h2 style="text-align: left; margin-top: 0;">Submit New Complaint</h2>
    <p style="color: var(--text-muted); margin-bottom: 2rem;">Please provide as much detail as possible to help us address the issue quickly.</p>

    <form action="${pageContext.request.contextPath}/addComplaint" method="post" autocomplete="off">
      <div class="form-group">
        <label>Complaint Title</label>
        <input type="text" name="title" required/>
      </div>

      <div class="form-group">
        <label>Detailed Description</label>
        <textarea name="description" rows="6" required></textarea>
      </div>

      <button type="submit" class="btn btn-primary" style="width: 100%;">Submit Complaint</button>
    </form>

    <div style="margin-top: 1.5rem; text-align: center;">
      <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp" style="color: var(--text-muted); text-decoration: none; font-size: 0.875rem;">Cancel and Return</a>
    </div>
  </div>
</div>
</body>
</html>