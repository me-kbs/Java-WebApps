package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import databasecode.DatabaseConnection;
import java.sql.*;

public final class basicUserManagement_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         <!--Session validation-->\n");
      out.write("     ");

    if (((session.getAttribute("user_name") == null) || (session.getAttribute("userid") == ""))){
    
      out.write("\n");
      out.write("    You are not logged in<br/>\n");
      out.write("    <a href=\"index.jsp\">Please Login</a>\n");
      out.write("    ");
} else if(session.getAttribute("user_type").equals("admin")) {
    
      out.write("\n");
      out.write("    Admin:  ");
      out.print(session.getAttribute("user_type"));
      out.write("\n");
      out.write("    <a href='logout.jsp'>Log out</a>\n");
      out.write("    ");

    }else{
        
      out.write("\n");
      out.write("        You are not authorized as admin, please <a href=\"index.jsp\">click here</a> to redirect to login page!\n");
      out.write("    ");

    }
    
      out.write("\n");
      out.write("     \n");
      out.write("  ");

      Connection con = DatabaseConnection.initializeDatabase(); // <== Check!
      // Connection conn =
      //    DriverManager.getConnection("jdbc:odbc:eshopODBC");  // Access
      Statement stmt = con.createStatement();
 
      String sqlStr = "SELECT * FROM userinfo ORDER BY user_type ASC, full_name ASC";
 
      // for debugging
      //System.out.println("Query statement is " + sqlStr);
      ResultSet rs = stmt.executeQuery(sqlStr);
  
      out.write("\n");
      out.write("      <hr>\n");
      out.write("      <form method=\"post\" action=\"#\">\n");
      out.write("        <table border=1 cellpadding=5>\n");
      out.write("          <tr>\n");
      out.write("            <th>Full Name</th>\n");
      out.write("            <th>User Name(email)</th>\n");
      out.write("            <th>Mobile</th>\n");
      out.write("            <th>User Type</th>\n");
      out.write("            <th></th>\n");
      out.write("            <th></th>\n");
      out.write("          </tr>\n");
      out.write("  ");

      while (rs.next()) {
        String id = rs.getString("user_name");
  
      out.write("\n");
      out.write("          <tr>\n");
      out.write("            <td>");
      out.print( rs.getString("full_name") );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( rs.getString("User_name") );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( rs.getString("mobile") );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( rs.getString("user_type") );
      out.write("</td>\n");
      out.write("             <td><input type=\"button\" name=\"id\" value=\"");
      out.print( id );
      out.write("\">Edit</td>\n");
      out.write("             <td><input type=\"button\" name=\"id\" value=\"");
      out.print( id );
      out.write("\">Delete</td>\n");
      out.write("            <td>\n");
      out.write("          </tr>\n");
      out.write("  ");

      }
  
      out.write("\n");
      out.write("        </table>\n");
      out.write("        <br>\n");
      out.write("        <input type=\"submit\" value=\"Order\">\n");
      out.write("        <input type=\"reset\" value=\"Clear\">\n");
      out.write("      </form>\n");
      out.write("      <a href=\"");
      out.print( request.getRequestURI() );
      out.write("\"><h3>Back</h3></a>\n");
      out.write("  ");

      rs.close();
      stmt.close();
      con.close();
    }
  
      out.write("\n");
      out.write("    \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
