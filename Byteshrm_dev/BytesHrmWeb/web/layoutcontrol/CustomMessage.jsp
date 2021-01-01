<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>


<div class="col-md-12">
    <s:if test ="hasActionErrors() ">
        <button class="close" data-close="alert"></button> 
        <div class="alert alert-danger" >
            <s:actionerror  />
        </div>
    </s:if>

    <s:if test="hasActionMessages() ">
        <button class="close" data-close="alert"></button> 
        <div class="alert alert-info" >
            <s:actionmessage />
        </div>
    </s:if>

</div>


