<%@page contentType="text/html" pageEncoding="TIS-620"%>
<%@page import="com.cgc.report.PrintCSV_RAWMAT_TRANSACTION" %>
<%@page import="java.io.InputStream"%>
<%
PrintCSV_RAWMAT_TRANSACTION obj = new PrintCSV_RAWMAT_TRANSACTION();
obj.ExportCSV(request,response);
%>