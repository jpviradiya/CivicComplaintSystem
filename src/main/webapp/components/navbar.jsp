<%@ page import="com.project.civic.model.User" %>
<%
    User navUser = (User) session.getAttribute("user");
    if (navUser != null) {
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/jsp/<%= "ADMIN".equals(navUser.getRole()) ? "admin-dashboard.jsp" : "dashboard.jsp" %>" class="navbar-brand">Civic Complaint</a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</nav>
<%
    }
%>
