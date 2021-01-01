package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.*;

public final class HoldPage_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("    <!-- Make sure the <html> tag is set to the .full CSS class. Change the background image in the full.css file. -->\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <!--        <meta http-equiv=\"refresh\" content=\"6;url=learning.jsp\">-->\r\n");
      out.write("\r\n");
      out.write("        <title>Holding Page</title>\r\n");
      out.write("\r\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"css/full.css\" rel=\"stylesheet\">\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <!--        <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-md-12 txtwrap\">You will be redirected in 00 Seconds.</div>\r\n");
      out.write("                </div>-->\r\n");
      out.write("        <div class=\"rows\">\r\n");
      out.write("            <div class=\"col-md-12 txtwrap\">You should be automatically redirected in <span id=\"seconds\">15</span> seconds.                 \r\n");
      out.write("                <span id=\"skip\" class=\"pull-right\"><a href=\"newjsp.jsp\">Skip &#62;&#62;</a></span>        \r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"wrapper\">\r\n");
      out.write("            <img src=\"images/bgBanner.jpg\"  alt=\"Responsive image\">\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-1.10.2.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("        // Countdown timer for redirecting to another URL after several seconds\r\n");
      out.write("\r\n");
      out.write("        var seconds = 15; // seconds for HTML\r\n");
      out.write("        var foo; // variable for clearInterval() function\r\n");
      out.write("\r\n");
      out.write("        function redirect() {\r\n");
      out.write("            document.location.href = 'newjsp.jsp';\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        function updateSecs() {\r\n");
      out.write("            document.getElementById(\"seconds\").innerHTML = seconds;\r\n");
      out.write("            seconds--;\r\n");
      out.write("            if (seconds == 5) {\r\n");
      out.write("                document.getElementById(\"skip\").style.display = \"block\";\r\n");
      out.write("            }\r\n");
      out.write("            if (seconds == -1) {\r\n");
      out.write("                clearInterval(foo);\r\n");
      out.write("                redirect();\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        function countdownTimer() {\r\n");
      out.write("            foo = setInterval(function () {\r\n");
      out.write("                updateSecs()\r\n");
      out.write("            }, 1000);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        countdownTimer();\r\n");
      out.write("    </script>\r\n");
      out.write("</html>\r\n");
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
