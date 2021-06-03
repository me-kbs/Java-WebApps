<%-- 
    Document   : login
    Created on : Jan 20, 2016, 2:17:56 PM
    Author     : Prakas
--%>

<%@page import="databasecode.DatabaseConnection"%>
<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

<%
    
    String user_name = request.getParameter("user_name");    
    String pwd = request.getParameter("password");
   
%>
<%--
importing java lib files for MD5 encryption
--%>
<%@ page import="java.security.MessageDigest"%>
<% 
//This jsp code shows an example of a functioning md5 hash.<br>
//The plaintext password is 'password' and is hard coded.<br>
//The MD5 hash version of 'password' is '5f4dcc3b5aa765d61d8327deb882cf99'<br>
//and is calculated each time the page is loaded.<br><br>
 
// Set password string, and print it out
String passwd = pwd;
//out.println("Password is: " + passwd + ".<br>");
// Create a new instance of MessageDigest, using MD5. SHA and other
// digest algorithms are also available.
MessageDigest alg = MessageDigest.getInstance("MD5");
 
// Reset the digest, in case it's been used already during this section of code
// This probably isn't needed for pages of 210 simplicity
alg.reset(); 
 
// Calculate the md5 hash for the password. md5 operates on bytes, so give
// MessageDigest the byte verison of the string
alg.update(passwd.getBytes());
 
// Create a byte array from the string digest
byte[] digest = alg.digest();
 
// Convert the hash from whatever format it's in, to hex format
// which is the normal way to display and report md5 sums
// This is done byte by byte, and put into a StringBuffer
StringBuffer hashedpasswd = new StringBuffer();
String hx;
for (int i=0;i<digest.length;i++){
	hx =  Integer.toHexString(0xFF & digest[i]);
	//0x03 is equal to 0x3, but we need 0x03 for our md5sum
	if(hx.length() == 1){hx = "0" + hx;}
	hashedpasswd.append(hx);
}
 
// Print out the string hex version of the md5 hash
//out.println("MD5 version is: " + hashedpasswd.toString() + "<br>");
%>

 
  <%
//    Class.forName("com.mysql.jdbc.Driver");  
    Connection con = DatabaseConnection.initializeDatabase();
//    Connection con = DriverManager.getConnection(
//          "jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=convertToNull", "root", ""); // <== Check!hashedpasswd.toString()
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from userinfo where user_name='" + user_name + "' and password='" +  pwd.toString() + "'");
    if (rs.next()) {
        
        session.setAttribute("user_name", user_name);
        session.setAttribute("user_type",rs.getString("user_type"));
        session.setAttribute("full_name", rs.getString("full_name"));
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        if(rs.getString("user_type").equals("user")){
             response.sendRedirect("bookstore.jsp");
        }else if(rs.getString("user_type").equals("admin"))
        {
            response.sendRedirect("admindashboard.jsp");
        }
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
    </body>
</html>