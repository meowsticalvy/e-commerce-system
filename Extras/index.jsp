<%@ include file="db.jsp" %>
<%
String result = "";
if (request.getMethod().equalsIgnoreCase("post")) {
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    CallableStatement cs = con.prepareCall("{call login_employee(?, ?, ?, ?)}");
    cs.setString(1, username);
    cs.setString(2, password);
    cs.registerOutParameter(3, java.sql.Types.INTEGER); 
    cs.registerOutParameter(4, java.sql.Types.INTEGER); 
    cs.execute();

    int isValid = cs.getInt(3);
    int empId = cs.getInt(4);

    if (isValid == 1) {
        result = "Login successful. Welcome Employee ID: " + empId;
        response.sendRedirect("dashboard.html");
    } else {
        result = "Invalid username or password.";
    }
}
%>
<div style="width:500px;margin:auto">
<h3>Employee Login</h3>
<form method="post">
Username: <input name="username"><br><br>
Password: <input type="password" name="password"><br><br>
<div style="width:250px;display:flex;align-items:center;justify-content:center"><button type="submit">Login</button></div>
<p>If you don't have an account then go <a href="signin.jsp"> registration</a> </p>
</form>
<p><%= result %></p>
</div>
