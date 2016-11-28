<%@page import="com.cgc.report.Print_Chart_Stock"%>
<%@page import ="com.cgc.Util.ThaiUtil" %>
<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>

<%
Print_Chart_Stock objdetail = new Print_Chart_Stock();

System.out.println(request.getParameter("month_id"));
System.out.println(request.getParameter("price_year"));
System.out.println(request.getParameter("location_id"));

%>
<%=objdetail.ShowDetail(request.getParameter("month_id"),request.getParameter("price_year"),request.getParameter("location_id"))%>        
       
