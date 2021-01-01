<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<style>

    .actionMessage
    {
        color: green;
        list-style: none;
        margin: 0;



    }
</style>

<s:if test="hasActionMessages() ">
    <p class="ribbon-content"> <h4  >    

        <i class="icon-info font-green-meadow"></i><h4  >    

            <s:actionmessage  cssClass="actionMessage font-green-jungle" /> </h4  ></p>

</s:if>

<s:if test="hasActionErrors() ">

    <p class="ribbon-content">   <h4  >
        <i class="icon-bell font-red-intense"></i>

        <s:actionerror cssClass="actionMessage font-red-mint" /> </h4  ></p>


</s:if>
