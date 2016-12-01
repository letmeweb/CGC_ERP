<%@page contentType="text/html" pageEncoding="TIS-620"%>
<%@page import="com.cgc.report.PrintCSV_RAWMAT_BIGBAG" %>
<%@page import="java.io.InputStream"%>
<%
PrintCSV_RAWMAT_BIGBAG obj = new PrintCSV_RAWMAT_BIGBAG();
obj.ExportCSV(request,response);
%>