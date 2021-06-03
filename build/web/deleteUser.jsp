<%-- 
    Document   : deleteUser
    Created on : 1 Jun, 2021, 12:01:37 PM
    Author     : KBS
--%>

<%@page import="databasecode.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
Connection con = DatabaseConnection.initializeDatabase();
Statement st=con.createStatement();
int i=st.executeUpdate("DELETE FROM userinfo WHERE user_name='"+id+"'");
out.println("Data Deleted Successfully!");
response.sendRedirect("basicUserManagement.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>