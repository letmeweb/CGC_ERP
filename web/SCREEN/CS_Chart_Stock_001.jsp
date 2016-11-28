<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cgc.bean.UserBean"%>
<%@page import="com.cgc.Util.UtiDatabase"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- calendar stylesheet -->
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <!-- main calendar program -->
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <!-- language for the calendar -->
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <!-- the following script defines the Calendar.setup helper function, which makes
               adding a calendar a matter of 1 or 2 lines of code. -->
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>

        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap-theme.min.css">
        <script src="../JS/jquery/jquery-2.1.4.js"></script>
        <script src="../JS/bootstrap/js/bootstrap.min.js"></script>        

        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>        

        <script type="text/javascript">
            function cancal() {
                cancelAction();
                getId("show1").innerHTML = "";
                getId("show2").innerHTML = "";
            }
            function get_search() {
                //getId("location_id").value = "K13B^/58";
                //alert(getId("month_id").value);
                if (getId("price_year").value === "price_year" || getId("month_id").value === "month_id") {
                    alert("กรุณาเลือก ปี และ เดือน");
                } else {
                    showTableNonPopup2("show1", "month_id,price_year,location_id", "../JSP/CS_Chart_Stock_001.jsp?month_id=" + getId("month_id").value + "&price_year=" + getId("price_year").value + "&location_id=" + getId("location_id").value);
                }
                //showTableNonPopup("show2", "search_date", "../JSP/CS_Show_Report_d_carbon_carbon_send_qc.jsp?select_case=2&search_date=");
            }
            function send_print() {
                getId("doc_id").value = doc_id;
                getId("report_code").value = "RP_015_2";
                document.report.submit();
            }
        </script>
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css"> <link href="../CSS/component.css" rel="stylesheet" type="text/css">
        <title>CS_Chart_Stock_001</title>
    </head>
    <body>
        <form id="report" name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <% UtiDatabase objuti = new UtiDatabase();%>           
            <input type="hidden" id="doc_id" name="doc_id" value=""/>
            <input type="hidden" id="report_code" name="report_code" value=""/>
            <input type="hidden" id="type_report" name="type_report" value="2"/>

            <div class="container">        
                <div class="panel panel-primary">
                    <div class="panel-heading"> <span class="glyphicon glyphicon-search" style="color:white"></span>&nbsp;
                        <b>สรุป Stock สินค้า/วัตถุดิบ (CS_Chart_Stock_001)</b>
                    </div>
                    <div class="panel-footer">
                        <div align="center">
                            <table  cellpadding="0" cellspacing="0" >
                                    <td class="columnlabel1"><b>ปี พ.ศ.*&nbsp;</b></td>                               
                                    <td colspan="3" class="columnobject">
                                        <%=objuti.ShowSelectBox("select price_year from vmproduct_price_year order by price_year desc", "price_year", "price_year", "price_year", "price_year", "-")%>
                                    </td>
                                </tr>    
                                <tr>
                                    <td class="columnlabel1"><b>เดือน *&nbsp;</b></td>                               
                                    <td colspan="3" class="columnobject">
                                        <%=objuti.ShowSelectBox("select month_id from mmonth order by runno", "month_id", "month_id", "month_id", "month_id", "-")%>
                                    </td>                                    
                                </tr>   
                                
                                <input name='location_id' type='hidden' class="inputs" id="location_id" value='-' size='20' readonly />                            

                                <tr>
                                    <td class="columnlabel1"></td>
                                    <td class="columnobject">
                                        <input type='button' class="cgcButton_6" name='search' onClick="get_search();" value='ค้นหา'/>
                                        <input type="button" class="cgcButton_3" id="cancel" name="cancel" value="ยกเลิก" onclick="cancal()">                                  
                                        <!--input type="button" class="cgcButton_11" name="myBut" value=" พิมพ์รายงาน  " onClick="send_print();"/-->
                                    </td>
                                </tr>    
                                </td>
                                </tr>                                           


                                <tr>
                                    <td colspan='2' class='blankspace'></td>
                                </tr>

                                <tr>
                                    <td colspan="2" align="center">
                                        <div width="100%">
                                            <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner3">
                                                <tr>
                                                    <td class="headergrid" colspan="14">สรุป Stock สินค้า/วัตถุดิบ</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="width:100%; height: 550px; overflow: auto;" id="show1"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'></td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'></td>
                                </tr>
                                <tr>
                                    <td colspan='2' align="right">

                                    </td>
                                </tr>

                                <tr>
                                    <td colspan='2' class='blankspace'></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>                                            
        </form>
    </body>
</html>
