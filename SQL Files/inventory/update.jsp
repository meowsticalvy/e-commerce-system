<%@ include file="db.jsp" %>
<%
if (request.getMethod().equalsIgnoreCase("post")) {
    CallableStatement cs = con.prepareCall("{call update_employee(?, ?)}");
    cs.setInt(1, Integer.parseInt(request.getParameter("emp_id")));
    cs.setString(2, request.getParameter("emp_name"));
    cs.execute();
    out.println("Employee updated successfully.");
}
%>

<h3>Update Employee Name</h3>
<form method="post">
  ID: <input name="emp_id"><br>
  New Name: <input name="emp_name"><br>
  <input type="submit" value="Update">
</form>
