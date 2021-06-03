<%-- 
    Document   : logout
    Created on : Jan 20, 2016, 2:27:36 PM
    Author     : Prakas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    </head>
    <body>
        <%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
    </body>
</html>

