<%@ include file="db.jsp" %>
<%
if (request.getMethod().equalsIgnoreCase("POST")) {
    CallableStatement cs = con.prepareCall("{call insert_employee(?, ?, ?, ?, ?, ?)}");
    cs.setInt(1, Integer.parseInt(request.getParameter("emp_id")));
    cs.setString(2, request.getParameter("emp_name"));
    cs.setString(3, request.getParameter("emp_email"));
    cs.setString(4, request.getParameter("emp_phone"));
    cs.setString(5, request.getParameter("emp_dept"));
    cs.setDate(6, java.sql.Date.valueOf(request.getParameter("emp_join_date")));
    cs.execute();
    out.println("Employee inserted successfully.");
}
%>

<center>
<h3>Insert Employee</h3>
<form method="post">
    ID: <input name="emp_id"><br>
    Name: <input name="emp_name"><br>
    Email: <input name="emp_email"><br>
    Phone: <input name="emp_phone"><br>
    Department: <input name="emp_dept"><br>
    Joining Date: <input type="date" name="emp_join_date"><br>
    <input type="submit" value="Insert">
</form>
</center>