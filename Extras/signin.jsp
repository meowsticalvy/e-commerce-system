<%@ include file="db.jsp" %>
<%
try{
if (request.getMethod().equalsIgnoreCase("post")) {
    String emp_id = request.getParameter("emp_id");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    PreparedStatement ps = con.prepareStatement("INSERT INTO registration (emp_id, username, password) VALUES (?, ?, ?)");
    ps.setInt(1, Integer.parseInt(emp_id));
    ps.setString(2, username);
    ps.setString(3, password);

    int i = ps.executeUpdate();
    out.println(i + " user registered.");
    response.sendRedirect("index.jsp");
}
}
catch(Exception e)
{
    out.println(e);
}
%>
<h3>Employee Registration (Login Setup)</h3>
<form method="post">
Employee ID: <input type="text" name="emp_id"><br><br>
Username: <input type="text" name="username"><br><br>
Password: <input type="password" name="password"><br><br>
<input type="submit" value="Register">
<p>If you have an account then go <a href="index.jsp"> registration</a> </p>
</form>
