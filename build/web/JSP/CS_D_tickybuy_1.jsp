<%@page import="com.cgc.DB.D_ticketbuyDAO"%>
<%@page import="com.cgc.bean.DataBeanD_ticketbuy"%>
<%@page import="com.cgc.Util.UtiDatabase"%>
<%@page import="java.sql.Date"%>
<%@page import="com.cgc.Util.ThaiUtil"%>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%@page import="java.sql.*"%>
<%!    UtiDatabase uti = new UtiDatabase();
    ThaiUtil en = new ThaiUtil();
    Timestamp ts;
    DataBeanD_ticketbuy objdb = new DataBeanD_ticketbuy();
    D_ticketbuyDAO objex = new D_ticketbuyDAO();

%>
<%
            int statusck = 0;
            int statusnum = 0;
            if (request.getParameter("status_a") != null) {
                if (uti.numRowdatabase("Select Count(doc_id) As num from  d_ticketbuy where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("doc_id").trim()) + "' and delete_flag = 'N' and complete_flag = 'Y'") != 0) {
                    statusck = -1;
                } else {
                    statusck = 1;
                    statusnum = uti.numRowdatabase("Select Count(doc_id) As num from  d_ticketbuy where doc_id = '" + en.EncodeTexttoTIS(request.getParameter("doc_id").trim()) + "' and delete_flag <> 'Y' and complete_flag <> 'Y'");
                    objdb.setLine_no(Integer.toString(statusnum + 1));
                }
            } else if (request.getParameter("status_u") != null) {
                statusck = 2;
                objdb.setLine_no(request.getParameter("line_no"));

            } else if (request.getParameter("status_d") != null) {
                statusck = Integer.parseInt(request.getParameter("status_d"));
            } else {
                statusck = -1;
            }
            if (request.getParameter("doc_id") != null) {
                objdb.setDoc_id(en.EncodeTexttoTIS(request.getParameter("doc_id").trim()));
            }
            
            if (request.getParameter("ticket_text") != null) {
                objdb.setTicket_text(en.EncodeTexttoTIS(request.getParameter("ticket_text")));
            }
            
            if (request.getParameter("price_unit") != null) {
                objdb.setPrice_unit(en.EncodeTexttoTIS(request.getParameter("price_unit")));
            }
            
            if (request.getParameter("price_total") != null) {
                objdb.setPrice_total(en.EncodeTexttoTIS(request.getParameter("price_total")));
            }
            
            ts = new Timestamp(new java.util.Date().getTime());
            objdb.setDate(ts);
            if (request.getParameter("username") != null) {
                objdb.setBy(en.EncodeTexttoTIS(request.getParameter("username")));
            }           
            
            System.out.println("status_a = " + request.getParameter("status_a"));
            System.out.println("status_u = " + request.getParameter("status_u"));
            System.out.println("status_d = " + request.getParameter("status_d"));
            System.out.println("statusck = " + statusck);
            
            switch (statusck) {
                case -1:
                    out.print("�������ö�ѹ�֡�����Ź�������ͧ�ҡ���Ţ����͡��÷������ó�����");
                    break;
                case 1:                    
                    System.out.println("Not user Case ");                    
                case 2:
                    if (objex.update(objdb) != -1) {
                        out.print("��������");
                    } else {
                        out.print("�������ö�ѹ�֡��");
                    }
                    break;
                case 3:

                    if (request.getParameter("chk_all") != null) {
                        objex.Delete_line_no_All(objdb);
                    } else {
                        objex.DeleteLine_no(request.getParameter("ckbox"), objdb);
                    }
                    break;
                default:
                    out.print("No Statment");
            }
%>