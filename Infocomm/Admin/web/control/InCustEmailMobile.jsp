
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"  isErrorPage="true"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head  />


<div class="col-sm-2 col-md-2" >
    <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:90%;margin-left:14px " data-toggle="tooltip" title="" data-original-title="Please Customer Name." data-placement="bottom">
        <div class="console-icon divider-right" >
            <span class="glyphicons glyphicons-user" ></span> </div>
        <div class="console-text">
            <div class="console-title pull-right">

                <s:textfield id="param1"   cssClass="form-control margin-top-none"  name="param1"/>
            </div>

        </div>
    </div>
</div>

            <div class="col-sm-2 col-md-2">
                <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:90% " data-toggle="tooltip" title="" data-original-title="Please Enter Email" data-placement="bottom">
                    <div class="console-icon divider-right" >
                        <span class="glyphicons glyphicons-message_full" ></span> </div>
                    <div class="console-text">

            <div class="console-subtitle pull-right" >
                <s:textfield id="param2"   cssClass="form-control margin-top-none"  name="param2"/>
            </div>
            </div>
        </div>
</div>


            <div class="col-sm-2 col-md-2">
                <div class="console-btn" style=" font-size: 10px; color:#33cccc ;padding: 1px 1px 1px 1px;border-radius:5px;width:90% " data-toggle="tooltip" title="" data-original-title="Please Enter Customer Mobile." data-placement="bottom">
                    <div class="console-icon divider-right" >
                                <span class="glyphicons glyphicons-phone" ></span> </div>
                            <div class="console-text">
                                <div class="console-subtitle pull-right" id="html_vlanlist">
                                    <s:textfield id="mobile"   cssClass="form-control margin-top-none"  name="mobile"/>
                                </div>
                        </div>
                    </div>
                </div>





