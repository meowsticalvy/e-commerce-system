<%@ include file="db.jsp" %>
<%
if (request.getMethod().equalsIgnoreCase("POST")) {
    CallableStatement cs = con.prepareCall("{call delete_employee(?)}");
    cs.setInt(1, Integer.parseInt(request.getParameter("emp_id")));
    cs.execute();
    out.println("Employee deleted successfully.");
}
%>

<h3>Delete Employee</h3>
<form method="post">
    ID: <input name="emp_id"><br>
    <input type="submit" value="Delete">
</form>
