<%-- 
    Document   : processuserregistration
    Created on : 31 May, 2021, 8:24:02 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String full_name=request.getParameter("full_name");
            String user_name=request.getParameter("user_name");
            String psw=request.getParameter("psw");
        %>
        <%@ page import = "java.sql.*"%>
        <%
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb", "ebookstoreuser", "user"); 
            Statement st = con.createStatement();
            
            int i = st.executeUpdate("INSERT INTO members(user_name, password, full_name, user_type) "+"VALUES('"+ user_name + "','" + psw + "','" + full_name + "','user')");
            
            if(i>0){
                out.print("Registration Successful! "+"<a href='index.jsp'>Login</a></br>");
            }else{
                response.sendRedirect("userregistration.jsp");
            }
        %>
    </body>
</html>
