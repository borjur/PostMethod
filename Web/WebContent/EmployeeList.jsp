<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	try
	{
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		conn = DriverManager.getConnection("jdbc:derby://localhost:1527/AjaxData");
		
		String sql = "SELECT EmployeeID, FirstName, LastName FROM Employees";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();

		out.write("<ul>");
		while (rs.next())
		{
			out.write("<li><a href='javascript:void(0)' onclick=\"GetEmployeeForm('EmployeeForm.jsp'," + rs.getString("EmployeeID") + ")\">" + rs.getString("FirstName") + " " +  rs.getString("LastName") + "</a></li>");
		}
		out.write("</ul>");
	}
	catch (Exception e)
	{
		out.write("Failed: <br/> " + e.toString());
	}
	finally 
	{
		if (rs != null) rs.close();
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
	}
%>