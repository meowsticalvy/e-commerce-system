<%@ include file="db.jsp" %>
<%
if (request.getMethod().equalsIgnoreCase("POST")) {
    String emp_id = request.getParameter("emp_id");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    PreparedStatement ps = con.prepareStatement("INSERT INTO registration (emp_id, username, password) VALUES (?, ?, ?)");
    ps.setInt(1, Integer.parseInt(emp_id));
    ps.setString(2, username);
    ps.setString(3, password);

    int i = ps.executeUpdate();
    if (i > 0) {
        out.println("User registered successfully.");
    } else {
        out.println("Registration failed.");
    }
}
%>

<h3>Employee Registration (Login Setup)</h3>
<form method="post">
    Employee ID: <input type="text" name="emp_id"><br>
    Username: <input type="text" name="username"><br>
    Password: <input type="password" name="password"><br>
    <input type="submit" value="Register">
</form>
