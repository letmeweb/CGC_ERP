<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%@page import="com.cgc.DB.Get_Data_Stock"%>
<%@page import="java.sql.*"%>

<%
    String SQL_Data = " SELECT "
            + " pgroup_id,sum(weight_total) as sum_weight_total "
            + " FROM vt_transaction_stock_process_report "
            + " GROUP BY pgroup_id,pgroup_name ";
    System.out.println("JSP SQL_Data = " + SQL_Data);
    Get_Data_Stock GetDATA = new Get_Data_Stock();
    out.print(GetDATA.Get_Value(SQL_Data));    
%>