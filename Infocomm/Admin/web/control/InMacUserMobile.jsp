
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"  isErrorPage="true"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head  />


<div class="col-sm-2 col-md-3" >
    <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 10px;border-radius:5px;width:90%;margin-left:14px " data-toggle="tooltip" title="" data-original-title="Please Enter Username." data-placement="bottom">
        <div class="console-icon divider-right" >
            <span class="glyphicons glyphicons-user" ></span> </div>
        <div class="console-text">
            <div class="console-title pull-right">

                <s:textfield id="username"   cssClass="form-control margin-top-none"  name="username"/>
            </div>

        </div>
    </div>
</div>

            <div class="col-sm-2 col-md-3">
                <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:90% " data-toggle="tooltip" title="" data-original-title="Please Enter MAC Address" data-placement="bottom">
                    <div class="console-icon divider-right" >
                        <span class="glyphicons glyphicons-macbook" ></span> </div>
                    <div class="console-text">

            <div class="console-subtitle pull-right" >
                <s:textfield id="macadds"   cssClass="form-control margin-top-none"  name="macadds"/>
            </div>
            </div>
        </div>
</div>


            <div class="col-sm-2 col-md-3">
                <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:90% " data-toggle="tooltip" title="" data-original-title="Please Enter Mobile No." data-placement="bottom">
                            <div class="console-icon divider-right" >
                                <span class="glyphicons glyphicons-phone" ></span> </div>
                            <div class="console-text">
                                <div class="console-subtitle pull-right" id="html_vlanlist">
                                    <s:textfield id="mobile"   cssClass="form-control margin-top-none"  name="mobile"/>
                                </div>
                        </div>
                    </div>
                </div>





