<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<td class="searchtd7" style="vertical-align:middle; text-align:right;">
    <label for="fromDate" class="control-label">From:</label></td>
<td class="searchtd7" style="vertical-align:middle"> 
    <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-calendar"></i> </span>
      <s:textfield  name="fromDate" id="fromDate" cssClass="form-control datepicker margin-top-none" />
    </div>
   </td>
   <td class="searchtd7" style="vertical-align:middle; text-align:right;">
       <label for="toDate" class="control-label">To:</label></td>
   <td class="searchtd7" style="vertical-align:middle"> 
    <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-calendar"></i> </span>
      <s:textfield  name="toDate" id="toDate" cssClass="form-control datepicker margin-top-none" />
    
  </div></td>
