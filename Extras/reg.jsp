<%@ include file="db.jsp" %>
<%
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
}
%>