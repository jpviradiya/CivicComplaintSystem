<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Create Account | Civic Connect</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="display: flex; align-items: center; justify-content: center; min-height: 100vh;">
<div class="card" style="width: 100%; max-width: 450px;">
  <div style="text-align: center; margin-bottom: 2rem;">
    <h2 style="margin-bottom: 0.5rem;">Create Account</h2>
    <p style="color: var(--text-muted);">Join our community to help improve our city</p>
  </div>

  <% if (request.getAttribute("errorMessage") != null) { %>
  <div style="background: #fef2f2; color: var(--danger); padding: 0.75rem; border-radius: 8px; margin-bottom: 1.5rem; text-align: center; font-size: 0.875rem;">
    <%= request.getAttribute("errorMessage") %>
  </div>
  <% } %>

  <form action="${pageContext.request.contextPath}/register" method="post" autocomplete="off">
    <div class="form-group">
      <label>Full Name</label>
      <input type="text" name="name" required/>
    </div>

    <div class="form-group">
      <label>Email Address</label>
      <input type="email" name="email" required/>
    </div>

    <div class="form-group">
      <label>Password</label>
      <input type="password" name="password" required/>
    </div>

    <input type="hidden" name="role" value="USER"/>

    <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Register</button>
  </form>



  <div style="text-align: center; margin-top: 1.5rem; font-size: 0.875rem;">
    <p>Already have an account? <a href="login.jsp" style="color: var(--primary); font-weight: 600;">Login here</a></p>
  </div>
</div>
</body>
</html>