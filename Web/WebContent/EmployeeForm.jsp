<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	try
	{
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		conn = DriverManager.getConnection("jdbc:derby://localhost:1527/AjaxData");
		
		String sql = "SELECT EmployeeID, FirstName, LastName, Title, Extension FROM Employees WHERE EmployeeID = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, request.getParameter("eid"));
		
		rs = stmt.executeQuery();
		rs.next();
		String employeeID = rs.getString("EmployeeID");
		String firstName = rs.getString("FirstName");
		String lastName = rs.getString("LastName");
		String title = rs.getString("Title");
		String extension = rs.getString("Extension");
%>
	<h2>Edit Employee</h2>
	<form onsubmit="return false">
	<table>
	<tr>
		<td>First Name:</td>
		<td><input type="text" name="FirstName" value="<%=firstName%>" onchange="UpdateEmployee('EditEmployee.jsp','FirstName',this.value,<%=employeeID%>);"/></td>
	</tr>
	<tr>
		<td>Last Name:</td>
		<td><input type="text" name="LastName" value="<%=lastName%>" onchange="UpdateEmployee('EditEmployee.jsp','LastName',this.value,<%=employeeID%>);"/></td>
	</tr>
	<tr>
		<td>Title:</td>
		<td><input type="text" name="Title" value="<%=title%>" onchange="UpdateEmployee('EditEmployee.jsp','Title',this.value,<%=employeeID%>);"/></td>
	</tr>
	<tr>
		<td>Extension:</td>
		<td><input type="text" name="Extension" value="<%=extension%>" onchange="UpdateEmployee('EditEmployee.jsp','Extension',this.value,<%=employeeID%>);"/></td>
	</tr>
	</table>
	</form>
<%
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