<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@page import="com.cgc.Util.Serchselect" %>
<%@page import="com.cgc.Util.UtiDatabase"%>
<%@page import="com.cgc.DB.DBConnect"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.sql.Date"%>
<!DOCTYPE html>

<%!    String date_f, date_t, doc_year;
    String burn_from, burn_to, month_from, month_to;
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=TIS-620">        
        <!--link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css"-->
        <link rel="stylesheet" href="../table.css" type="text/css"/>	        
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.9.1.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css"> <link href="../CSS/component.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap-theme.min.css">
        <script src="../JS/jquery/jquery-2.1.4.js"></script>
        <script src="../JS/bootstrap/js/bootstrap.min.js"></script>           

        <script>
            $(function() {
                $("input[type=submit], a, button")
                        .button()
                        .click(function(event) {
                            event.preventDefault();
                        });
            });
        </script>     

        <script>
            $(function() {
                $("#progressbar").progressbar({
                    value: 100
                });
            });
        </script>        

        <title>CGC  รายงานการเคลื่อนไหว</title>        

    </head>
    <body>
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <input type="hidden" name="type_report" value="4">
            <input type="hidden" name="report_code" value="RP_Burn_Out_NEW">
            <input type="hidden" name="price_year" value="">
            <input type="hidden" name="pgroup_id" value="-">
            <input type="hidden" name="product_id" value="-">
            <input type="hidden" name="warehouse_id" value="-">
            <input type="hidden" name="branch" value="-">
            <input type="hidden" name="location_id" value="-">
            <input type="hidden" name="friction_house" value="-">                                  

            <%
                doc_year = request.getParameter("doc_year");
                burn_from = request.getParameter("burn_from");
                burn_to = request.getParameter("burn_to");
                month_from = request.getParameter("month_from");
                month_to = request.getParameter("month_to");

                UtiDatabase DBUtil = new UtiDatabase();
                DBConnect db = new DBConnect();
                Connection Conn1 = db.openNewConnection();
                Connection Conn2 = db.openNewConnection();
                ResultSet rs;

                String table_carbon_burn;
                String table_carbon_burn_out = "vd_carbon_send_product_detail_report";
                String table_carbon_transaction = "t_transaction_carbon_out_detail";
                String burn_type;

                Timestamp ts = (new Timestamp(new java.util.Date().getTime()));
                System.out.println("ts = " + ts);

                Statement STateMentData = null;

                // **** ลบข้อมูลตาราง ความเคลื่อนไหว
                String sqlDelete = " DELETE FROM " + table_carbon_transaction + ";"
                        + " ALTER SEQUENCE seq_" + table_carbon_transaction + " RESTART WITH 1; ";
                STateMentData = Conn1.createStatement();
                STateMentData.execute(sqlDelete);

                String smonth = "";

                for (int imonth = Integer.parseInt(month_from); imonth <= Integer.parseInt(month_to); imonth++) {
                    String Str_Ins = "insert into " + table_carbon_transaction
                            + "(product_id,doc_month,doc_year,create_date,create_by) values (?,?,?,?,?)";
                    PreparedStatement p = null;

                    p = Conn2.prepareStatement(Str_Ins);
                    //System.out.println("Str_Ins = " + Str_Ins);
                    p.setString(1, "C");
                    smonth = String.format("%02d", imonth);
                    System.out.println("smonth = " + smonth);
                    p.setString(2, smonth);
                    p.setString(3, doc_year);
                    p.setTimestamp(4, ts);
                    p.setString(5, "System");

                    System.out.println("ts = " + ts);
                    p.executeUpdate();
                }

                table_carbon_burn = table_carbon_burn_out;
                burn_type = "_out";

                for (int m = Integer.parseInt(month_from); m <= Integer.parseInt(month_to); m++) {
                    for (int t = Integer.parseInt(burn_from); t <= Integer.parseInt(burn_to); t++) {

                        String month = String.format("%02d", m);
                        String Sql_Find = "select sum(to_number(weight,'99999999.99')) as weight from " + table_carbon_burn
                                + " where month = '" + month + "' and year = '" + doc_year + "' and substring(machine_id from 4 for 1) = '" + Integer.toString(t) + "'"                        
                                + " and doc_type = 'PT' and size_name not like 'คาร์บอน%' and size_name <> '' " ;
                                    
                        PreparedStatement p1;
                        p1 = Conn2.prepareStatement(Sql_Find);
                        System.out.println("Sql_Find = " + Sql_Find);
                        rs = p1.executeQuery();
                        int T = 1;
                        while (rs.next()) {
                            String Sql_Update = "Update " + table_carbon_transaction + " set t" + t + burn_type + " = " + rs.getDouble("weight")
                                    + " where doc_month = '" + month + "' and doc_year = '" + doc_year + "'";
                            System.out.println("Sql_Update = " + Sql_Update);
                            PreparedStatement p2;
                            p2 = Conn2.prepareStatement(Sql_Update);
                            p2.executeUpdate();
                        }

                    }
                }
                Timestamp ts1 = (new Timestamp(new java.util.Date().getTime()));
            %>   

            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">
                            <img alt="C. Gigantic Carbon Co.,Ltd" src="../IMAGES/CGC_LOGO_139.png">
                        </a>
                    </div>
                </div>
            </nav>                  

            <!--div class="CSS_Table_Example" style="width:1200px;height:150px;"-->
            <div class="jumbotron">
                <div class="container">
                    <table border ="1"  cellpadding="0"  cellspacing="0" class="">
                        <center><h2>รายงานสรุปถ่านออกจากเตา</h2></center>
                        <center><h3><span class="label label-success">ปี : <%=doc_year%></span></h3></center> 
                        <center>   
                            <!--div class="progress progress-striped active"-->
                            <div class="progress">                                
                                <div class="progress-bar" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width:0%"></div>                                
                            </div>
                        </center>                                 
                        <center><h3>จัดเตรียมข้อมูลเสร็จสิ้น กรุณากดปุ่ม พิมพ์รายงาน</h3></center>
                    </table>      

                    <div class="CSS_Table_Example" style="width:1200px;height:150px;">    
                        <center>
                            <a href="#" onClick="javascript:document.report.submit();" class="cgcButton_19">พิมพ์รายงาน</a>
                            &nbsp;&nbsp;<a href="#" onClick="javascript:window.close();" class="cgcButton_19">ปิด</a>
                        </center>    
                    </div>

                    <div class="CSS_Table_Example" style="width:1200px;height:150px;">    
                        <left>                            
                            <div class="alert alert-info">
                                <a href="#" class="close" data-dismiss="alert">X</a>

                                <table class="table table-bordered">
                                    <tr>
                                        <td class="row5" width="20%">
                                    <left>เริ่มประมวลผล เวลา :</left> 
                                    </td>
                                    <td class="row5" width="20%">
                                    <left><%=ts%></left> 
                                    </td>
                                    </tr>
                                    <tr>
                                        <td class="row5" width="20%">
                                    <left>สิ้นสุดการประมวลผล เวลา :</left> 
                                    </td>
                                    <td class="row5" width="20%">
                                    <left><%=ts1%></left> 
                                    </td>
                                    </tr>                        
                                </table>                                    
                            </div>
                        </left>    
                    </div>


                </div>
            </div>

        </form>
        <script>

            var value = 0;

            function barAnim() {
                value += 5;
                $(".progress-bar").css("width", value + "%").attr("aria-valuenow", value);
//if (value == 25 || value == 55 || value == 85) {
                if (value === 75 || value === 95) {
                    return setTimeout(barAnim, 500);
                }
//if (value >= 100) {
//    alert(value + " % Complete");
//}
                return value >= 100 || setTimeout(barAnim, 20);
            }

            setTimeout(barAnim, 20);
        </script>                     
    </body>
</html>

