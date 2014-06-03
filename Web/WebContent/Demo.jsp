<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<?xml version="1.0" encoding="UTF-8"?>

<h1>Hello <%=request.getParameter("FirstName") + " " + request.getParameter("LastName")%>!</h1>