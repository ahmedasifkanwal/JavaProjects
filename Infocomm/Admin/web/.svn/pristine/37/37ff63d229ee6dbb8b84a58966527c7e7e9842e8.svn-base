
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.info.cms.helper.DateHelper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.logging.Level"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    Logger logger = Logger.getLogger("ProfileStatictics");
    JSONObject obj = new JSONObject();
    try {
        com.info.wifi.ssg.controller.GenericJpaController liFacade = new com.info.wifi.ssg.controller.GenericJpaController();
        SysUsers user = (SysUsers) session.getAttribute("Users");
        if (request.getParameter("ROW").equalsIgnoreCase("ROW1")) {
            String Domain = request.getParameter("Domain");
                String condi = (Domain.equalsIgnoreCase("all") == true ? "" : " and host like '%." + Domain + "%' ");
            SimpleDateFormat format = new SimpleDateFormat("yyyy_MMM_dd");
            String table = "LI_LOG_" + format.format(DateHelper.addNoOfDays(new Date(), -1));
                String SQL = "select host ,count(*) from " + table + "  where  host like '%www%' " + condi + "  GROUP by host  order by count(*) desc";
                List list = liFacade.getAggDynamicReport(SQL, 30);
                StringBuilder categories = new StringBuilder();
                StringBuilder series0 = new StringBuilder();

            if (list != null && list.size() > 0) {
                for (int j = 0; j < list.size(); j++) {
                    Object[] data = (Object[]) list.get(j);

                    series0.append("['").append(data[0]).append("',");
                    series0.append("").append(data[1]).append("],");
                }

            }
            obj.put("serieswebsites", "[" + series0 + "]");

            com.info.wifi.cms.entity.controller.GenericJpaController cmsFacade = new com.info.wifi.cms.entity.controller.GenericJpaController();

            SQL = " select  TO_CHAR( S,'YYYY')as YY,  TO_NUMBER( to_char(S,'mm')) as mm, TO_NUMBER(to_char(S,'dd')) as dd,C as Surce,count(*) as total from "
                        + "   (  select date_created as S,created_by  as C  from   prepaidcard  where created_by in ('MOBILE','SYSTEM') and   date_created >= current_date  - 30"
                        + "  union all  select date_created as S ,created_by as C from   prepaidcard_expired  where created_by in ('MOBILE','SYSTEM') and date_created >= current_date  - 30"
                        + " ) A  "
                        + " group by  TO_CHAR( S,'YYYY'),TO_NUMBER( to_char(S,'dd')) , TO_NUMBER(to_char(S,'mm')) ,C  order by TO_NUMBER(to_char(S,'mm')) asc ,TO_NUMBER( to_char(S,'dd')) asc";

            list = cmsFacade.getAggDynamicReport(SQL, 10000);

            StringBuilder seriesbrowseractivation0 = new StringBuilder();
            StringBuilder seriesbrowseractivation1 = new StringBuilder();
                if (list != null && list.size() > 0) {
                    for (int j = 0; j < list.size(); j++) {
                        Object[] data = (Object[]) list.get(j);

                    if (data[3].toString().endsWith("SYSTEM")) {
                        seriesbrowseractivation0.append("[Date.UTC(" + data[0] + ", " + (Integer.parseInt(data[1].toString()) - 1) + ", " + data[2] + "), " + data[4] + "],");
                            } else {
                                seriesbrowseractivation1.append("[Date.UTC(" + data[0] + ", " + (Integer.parseInt(data[1].toString()) - 1) + ", " + data[2] + "), " + data[4] + "],");
                            }

                }

            }

            obj.put("seriesbrowseractivation0", "[" + seriesbrowseractivation0 + "]");
            obj.put("seriesbrowseractivation1", "[" + seriesbrowseractivation1 + "]");
            obj.put("seriesdate", format.format(DateHelper.addNoOfDays(new Date(), -1)));
        }
    } catch (Exception ex) {
        logger.log(Level.SEVERE, ex.getMessage());
    }

    out.print(obj);

    out.flush();

%>