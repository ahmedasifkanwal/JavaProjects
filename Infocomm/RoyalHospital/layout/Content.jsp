<%@page import="com.info.wifi.presentation.entity.PeLogin"%>
<%@page import="com.info.wifi.facade.util.WIFILayoutManager"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.info.wifi.presentation.entity.PeSession"%>


<%
    java.util.logging.Logger logger = java.util.logging.Logger.getLogger("Content");
    PeSession peSession = null;
    PeLogin peLogin = null;
    boolean ver = false;
    try {

        peSession = (PeSession) session.getAttribute("peSession");
        peLogin = (PeLogin) session.getAttribute("peLogin");


    } catch (Exception ex) {
        logger.log(Level.SEVERE, ex.toString(), ex);

    }

%>
<div class="nav">
    <ul>
        <li class="active"><a href="http://login.now/">HOME</a></li>
        <li><a  target="_blank" href="http://www.friendimobile.com/en-om/article/global/terms-and-conditions.html">TERMS & CONDITION </a> </li>
        <li><a  target="_blank" href="http://www.friendimobile.com/en-om/section/faqs">FAQ</a></li>
        <li><a  target="_blank" href="http://www.friendimobile.com/en-om/article/global/privacy-policy.html">PRIVACY POLICY</a></li>
        <li><a  target="_blank" href="http://www.friendimobile.com/en-om/contactus"> CONTACT US</a></li>
    </ul>
</div>
<div class="content_box_main">
    <div class="content_box_inner">
        <div class="top_image banner_adv" > 
            
             <a href=" http://www.friendimobile.com/en-om?home" target="_blank"> 
            <img src="../images/banner1.PNG" alt=""/> 
             </a>
        </div>



        <div class="content">
            <p><%=peSession.getTxt_tagLine1()%> </p>
            <p><%=peSession.getTxt_tagLine2()%></p>
        </div>

    </div>
    <div class="buslogo"> 
         <a href=" http://www.friendimobile.com/en-om?home" target="_blank"> 
        <img src="../images/logo.jpg" alt=""/>
    
         </a>
    </div>

    <div class="powered"> Powered by <br />
        <img src="../images/omantel_logo.png" width="111" height="74" /> <br />
        <br />
        Customer Support <span>1234</span> </div>
</div>