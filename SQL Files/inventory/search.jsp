<%@ include file="db.jsp" %>
<%
String id = request.getParameter("emp_id");
if (id != null) {
    CallableStatement cs = con.prepareCall("{call search_employee (?, ?, ?, ?, ?, ?)}");
    cs.setInt(1, Integer.parseInt(id));
    cs.registerOutParameter(2, Types.VARCHAR);
    cs.registerOutParameter(3, Types.VARCHAR);
    cs.registerOutParameter(4, Types.VARCHAR);
    cs.registerOutParameter(5, Types.VARCHAR);
    cs.registerOutParameter(6, Types.DATE);
    cs.execute();

    out.println("Name: " + cs.getString(2) + "<br>");
    out.println("Email: " + cs.getString(3) + "<br>");
    out.println("Phone: " + cs.getString(4) + "<br>");
    out.println("Department: " + cs.getString(5) + "<br>");
    out.println("Join Date: " + cs.getDate(6) + "<br>");
}
%>

<h3>Search Employee</h3>
<form method="get">
    ID: <input name="emp_id"><br>
    <input type="submit" value="Search">
</form>
