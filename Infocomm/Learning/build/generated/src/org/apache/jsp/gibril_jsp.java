package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class gibril_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html>    \n");
      out.write("    <body>\n");
      out.write("        <script src=\"js/bannerengine.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/gibril2.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/gibril1.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"css/gibril.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.css\" type=\"text/css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\" type=\"text/css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap-theme.css\" type=\"text/css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap-theme.min.css\" type=\"text/css\" />\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <div class=\"col-md-12 slider\" id=\"main-slider1\"> <!--outermost container element -->\n");
      out.write("            <div class=\"add-space-1\"><!-- innermost wrapper element -->\n");
      out.write("                <div>\n");
      out.write("                <a href=\"google.com\" target=\"_blank\"><img class=\"slide img-fluid\" style=\"max-height: 120px\" src=\"images/top.jpg\" alt=\"\"></a>\n");
      out.write("                <a href=\"google.com\"><img class=\"slide img-fluid\" style=\"max-height: 120px\" src=\"images/bottom.jpg\" alt=\"\"></a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div> \n");
      out.write("            </BR>   </BR>   </BR>   </BR>\n");
      out.write("\n");
      out.write("        <!--    <div class=\"slider\" id=\"main-slider2\">\n");
      out.write("            <div class=\"add-space-2\">\n");
      out.write("                <div>\n");
      out.write("                <a href=\"google.com\" target=\"_blank\"><img   class=\"slide\" src=\"images/top.jpg\" alt=\"\"></a>\n");
      out.write("                <a href=\"google.com\"><img class=\"slide\"  src=\"images/bottom.jpg\" alt=\"\"></a>\n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("        </div>-->\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("\n");
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
