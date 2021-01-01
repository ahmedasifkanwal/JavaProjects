<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head />
<script type="text/javascript">



    function selectModule(selModule)

    {

        selectArray = $('[id^=selModules]');
        selectArray.each(function()
        {

            if (this.value == selModule.value)
            {


                selectArray = $('[id^=selAction]');
                selectArray.each(function()
                {
                    var actionmodule = this.value.split('#');
                    //0 action 1 module

                    if (actionmodule[1] == selModule.value) {


                        this.checked = selModule.checked;



                    }
                }
                )

            }
        }
        )


    }


    function findselAction(selAction)

    {

        var actionmodule = selAction.value.split('#');
        selectArray = $('[id^=selModules]');
        selectArray.each(function()
        {

            if (this.value == actionmodule[1])
            {

                this.checked = true;

            }
        }
        )


    }

</script>

<!-- page content -->

<div class="container">
  <div class="row">
     
      <div class="col-md-12">
          <div class="panel panel-visible">
              <div class="panel-heading">
                  <div class="panel-title"> <span class="glyphicon glyphicon-th-large"></span> <%=session.getAttribute("SELACTIONNAME")%></div>
              </div>
              <div class="panel-body padding-bottom-none">
          <s:form action="assignpermission.icms" method="getSelected"  theme="simple" >
              <jsp:include page="../include/CustomMessage.jsp"></jsp:include>

          <div class="tab-block margin-bottom-lg">
              <ul class="nav nav-tabs tabs-border">
                  <li class=""><a href="#tab6" data-toggle="tab"><i class="glyphicons glyphicons-blog text-blue2"></i>&nbsp;Assign Module</a></li>
                  <li class=""><a href="#tab7" data-toggle="tab"><i class="glyphicons glyphicons-dashboard text-blue2"></i>&nbsp;Dashboard</a></li>
                  <li class=""><a href="#tab8" data-toggle="tab"><i class="glyphicons glyphicons-charts text-blue2"></i>&nbsp;Statistics</a></li>
                </ul>
                <div class="tab-content">
                  <div id="tab6" class="tab-pane active">
                  <s:hidden name="authority"  id="authority"></s:hidden>
                  <div Class="badge badge-info"> You are modifying permission for role: <b>
                          <div Class="badge badge-purple">
                      <s:label name="authority"  id="authority"></s:label>
                      </b> </div>
                  </div>
                  <s:iterator  var="peModule" value="peUsersPermission.peModuleList" status="module"> <br>
                    <s:checkbox name="selModules"    fieldValue="%{#peModule.moduleId}" id="selModules"   onchange="selectModule(this)"

                                                value="%{#peModule.selModules}" > </s:checkbox>
                    <s:label value="%{#peModule.moduleName}"   cssClass="badge badge-ruby" > </s:label>
                    <s:iterator  var="peUsersPermission" value="peUsersPermission.peUsersPermissionList" status="action">
                      <s:if test="#peModule.moduleId  == #peUsersPermission.moduleId"> <br>
                        &nbsp;&nbsp;&nbsp;
                        <s:checkbox name="selAction" id="selAction" fieldValue="%{#peUsersPermission.actionId}#%{#peModule.moduleId}"
                                                        onchange="findselAction(this)"     value="%{#peUsersPermission.selAction}" ></s:checkbox>
                        <s:label value="%{#peUsersPermission.actionName}"   cssClass="badge badge-green" > </s:label>
                      </s:if>
                    </s:iterator>
                    <br>
                  </s:iterator>
                  <s:submit key="BTN09" method="save" align="left" cssClass="submit btn btn-primary btn-gradient"  />
                  </div>
                  
              
                </div>

              
              
              
             
          </s:form>
        </div>
   
    </div>
  </div>
</div>
</div>
