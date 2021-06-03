<%-- 
    Document   : admindashboard
    Created on : 31 May, 2021, 5:49:52 AM
    Author     : KBS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="databasecode.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <!--Session validation-->
    <%
    if (((session.getAttribute("user_name") == null) || (session.getAttribute("userid") == ""))){
    %>
    You are not logged in<br/>
    <a href="index.jsp">Please Login</a>
    <%}else if(session.getAttribute("user_type").equals("admin")) {
    %>
    Admin:  <%=session.getAttribute("user_name")%>
    <a href='logout.jsp'>Log out</a>
    <%
      Connection con = DatabaseConnection.initializeDatabase(); // <== Check!
      // Connection conn =
      //    DriverManager.getConnection("jdbc:odbc:eshopODBC");  // Access
      Statement stmt = con.createStatement();
 
      String sqlStr = "SELECT * FROM userinfo ORDER BY user_type ASC, full_name ASC";
 
      // for debugging
      //System.out.println("Query statement is " + sqlStr);
      ResultSet rs = stmt.executeQuery(sqlStr);
    %>
    <hr>
    <span>
    <%
    String user_id = request.getParameter("user_id");
    
    %>
    <%
    if (user_id != null) {
        Statement st=con.createStatement();
        String sqlStr1="SELECT * FROM userinfo WHERE user_name='"+user_id+"'";
        ResultSet rsu = st.executeQuery(sqlStr1); 
        rsu.next();
    %>
        <form method="post" action="processUpdateUser.jsp">
        <table border=1 cellpadding=5>
            <tr>
            <th colspan="2"> User's Detail</th>
            </tr>
            <tr><th>Description</th><th>Value</th></tr>
            
            <tr>
                <td>Full name</td>
                <td><input type="text" name="full_name" value="<%= rsu.getString("full_name")%>"></td>
            </tr>
            
            <tr>
                <td>User name(email)</td>
                <td><input type="text" name="user_name" value="<%= rsu.getString("user_name")%>"></td>
            </tr>
            
            <tr>
                <td>Password</td>
                <td><input type="text" name="password" value="<%= rsu.getString("password")%>"></td>
            </tr>
            
            <tr>
                <td>Mobile</td>
                <td><input type="text" name="mobile" value="<%= rsu.getString("mobile")%>"></td>
            </tr>
                
            <tr>
                <td>User Type</td>
                <td><select id="user_type" name="user_type">
                <%  if(rsu.getString("user_type").equals("admin")){%>
                    <option value="admin" selected>Admin</option>
                    <option value=user>User</option>
                 <%}else{%>
                    <option value="admin">Admin</option>
                    <option value=user selected>User</option>
                    <%}%>
                </select></td>
            </tr>             
            <tr >
                <td colspan="2">
                    <p align="right">
                        <input type="reset" value="Reset">
                        <input type="submit" value="Update">
                    </p>
                </td>
            </tr>              
        </table>
        </form>
    <%
    }else{%>
        <form method="post" action="processAddUser.jsp">
        <table border=1 cellpadding=5>
            <tr>
            <th colspan="2"> User's Detail</th>
            </tr>
            <tr><th>Description</th><th>Value</th></tr>
            
            <tr>
                <td>Full name</td>
                <td><input type="text" name="full_name"></td>
            </tr>
            
            <tr>
                <td>User name(email)</td>
                <td><input type="text" name="user_name"></td>
            </tr>
            
            <tr>
                <td>Password</td>
                <td><input type="text" name="password"></td>
            </tr>
            
            <tr>
                <td>Mobile</td>
                <td><input type="text" name="mobile"></td>
            </tr>
                
            <tr>
                <td>User Type</td>
                <td><select id="cars" name="user_type">
                    <option value="admin">Admin</option>
                    <option value=user>User</option>
                </select></td>
            </tr>             
            <tr >
                <td colspan="2">
                    <p align="right">
                     <input type="reset" value="Reset">
                     <input type="submit" value="Add New User">
                    </p>
                </td>
            </tr>              
        </table>
        </form>
    <%}%>
    </span>
    <br><hr>
    <span>
        <table border=1 cellpadding=5>
          <tr>
            <th>Full Name</th>
            <th>User Name(email)</th>
            <th>Mobile</th>
            <th>User Type</th>
            <th>Action</th>
            <th>Action</th>
          </tr>
  <%
      while (rs.next()) {
        String id = rs.getString("user_name");
  %>
          <tr>
            <td><%= rs.getString("full_name") %></td>
            <td><%= rs.getString("user_name") %></td>
            <td><%= rs.getString("mobile") %></td>
            <td><%= rs.getString("user_type") %></td>
            <td><a href="basicUserManagement.jsp?user_id=<%=id%>">Edit</a></td>  
            <td><a href="deleteUser.jsp?id=<%=id%>" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a></td></tr>
          </tr>
  <%
      }
  %>
        </table>       
      </form>
    </span>
      <a href="<%= request.getRequestURI() %>"><h3>Back</h3></a>
  <%
    }else{
        %>
        You are not authorized as admin, please <a href="index.jsp">click here</a> to redirect to login page!
 <%
    }
  %>
    </body>
</html>
