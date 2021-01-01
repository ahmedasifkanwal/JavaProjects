<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<script>
function goBack() {
    window.history.back();
}
</script>
<div class="row" style="margin-bottom:300px">
    <div class="col-md-12 page-500">
        <div class=" number font-red"> 500 </div>
        <div class=" details">
            <h3>Sorry!! Permission denied</h3>
            <p> You are not allowed for this Action.
                <br/> </p>
            <p>
                <a  onclick="goBack()" class="btn red btn-outline"> Return </a>
                <br> </p>
            
             <p class="ribbon-content">   <h4  >
        <i class="icon-bell font-red-intense"></i>
           <s:actionerror cssClass="actionMessage font-red-mint" /> </h4  ></p>
        </div>
    </div>
</div>