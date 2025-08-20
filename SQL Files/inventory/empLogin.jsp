<%@ include file="db.jsp" %>
<%
String result = "";
if (request.getMethod().equalsIgnoreCase("POST")) {
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    CallableStatement cs = con.prepareCall("{call login_employee(?, ?, ?, ?)}");
    cs.setString(1, username);
    cs.setString(2, password);
    cs.registerOutParameter(3, java.sql.Types.INTEGER); // for validation
    cs.registerOutParameter(4, java.sql.Types.INTEGER); // for emp_id
    cs.execute();

    int isValid = cs.getInt(3);
    int empId = cs.getInt(4);

    if (isValid == 1) {
        result = "Login successful. Welcome Employee ID: " + empId;
    } else {
        result = "Invalid username or password.";
    }
}
%>

<h3>Employee Login</h3>
<form method="post">
    Username: <input name="username"><br>
    Password: <input type="password" name="password"><br>
    <input type="submit" value="Login">
</form>
<p><%= result %></p>
