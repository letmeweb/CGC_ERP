<%@page contentType="text/html" pageEncoding="TIS-620"%>
<%@page import="com.cgc.report.PrintCSV_WAREHOUSE_TRANSACTION" %>
<%@page import="java.io.InputStream"%>
<%
PrintCSV_WAREHOUSE_TRANSACTION obj = new PrintCSV_WAREHOUSE_TRANSACTION();
obj.ExportCSV(request,response);
%>