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
    <title>Dashboard | Civic Connect</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/components/navbar.jsp" />

<div class="container">
    <div style="margin-bottom: 2rem;">
        <h1 style="font-size: 1.875rem; font-weight: 700;">Welcome back, <%= user.getName() %>!</h1>

    </div>

    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem;">
        <div class="card">
            <h3>File a Report</h3>
            <p style="color: var(--text-muted); margin-bottom: 1.5rem;">Found an issue in your neighborhood? Report it to the authorities now.</p>
            <a href="${pageContext.request.contextPath}/jsp/complaint-form.jsp" class="btn btn-primary">Start New Complaint</a>
        </div>

        <div class="card">
            <h3>Track Progress</h3>
            <p style="color: var(--text-muted); margin-bottom: 1.5rem;">Check the live status of your previously submitted complaints and reports.</p>
            <a href="${pageContext.request.contextPath}/complaints" class="btn btn-primary" style="background: white; color: var(--primary); border: 1px solid var(--primary);">View My History</a>
        </div>
    </div>
</div>
</body>
</html>