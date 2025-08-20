<%@ page import="java.sql.*" %>
<%
Connection con = null;
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");

    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "alvi", "alvi32");
} catch (Exception e) {
    out.println("Connection Failed: " + e.getMessage());
}
%>
