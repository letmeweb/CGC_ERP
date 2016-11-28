<%@page contentType="text/html" pageEncoding="TIS-620"%>
<%@page import="com.cgc.report.PrintCSV_CARBON_OUT_NEW" %>
<%@page import="java.io.InputStream"%>
<%
PrintCSV_CARBON_OUT_NEW obj = new PrintCSV_CARBON_OUT_NEW();
obj.ExportCSV(request,response);
%>