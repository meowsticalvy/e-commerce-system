<%@ page import="java.sql.*" %>
<%
Connection con = null;
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "a12345");
} catch (Exception e) {
    out.println("Connection Failed: " + e.getMessage());
}
%>
