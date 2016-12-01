<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cgc.Util.UtiDatabase"%>
<%@page import="com.cgc.Util.DateUtil"%>
<%@page import="com.cgc.Util.PeriodDate"%>
<!DOCTYPE HTML>
<html>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGC ERP</title>
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css"> <link href="../CSS/component.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>

        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap-theme.min.css">
        <script src="../JS/jquery/jquery-2.1.4.js"></script>
        <script src="../JS/bootstrap/js/bootstrap.min.js"></script>          

        <script src="../JS/bootstrap_select/js/bootstrap-select.js"></script>        
        <link rel="stylesheet" href="../JS/bootstrap_select/css/bootstrap-select.css">        
        <link rel="stylesheet" href="../JS/bootstrap_select/css/bootstrap-select.min.css">        
        <link rel="stylesheet" href="../JS/bootstrap_select/css/bootstrap-theme.min.css">           

        <script type="text/javascript">
            function Cancelvalue() {
                cancelAction();
                getId("lookup_name").value = "";
                getId("delete_flag").value = "";
                getId("complete_flag").value = "";
                getId("retro_flag").value = "";
                getId("cancel_flag").value = "";
                getId("date_fromrom_format").value = "";
                getId("date_too_format").value = "";
            }
            function Action_Export() {
                var chk_export_id = false, chk_doc_id = false, chk_doc_date = false;
                //******************check export_id***************************
                if (getId("export_id").value === "") {
                    alert("กรุณาระบุชื่อที่ต้องการจะ Export");
                } else {
                    chk_export_id = true;
                }

                //******************check doc_date ***************************
                if (getId("date_from").value !== "" && getId("date_to").value === "" || getId("date_from").value === "" && getId("date_to").value !== "") {
                    alert("กรุณาเลือกวันที่ให้ครบ");
                } else if (getId("date_from").value !== "" && getId("date_to").value !== "") {
                    if (ChkDate(getId("date_from").value, getId("date_to").value)) {
                        alert("คุณใส่วันที่ไม่ถูกต้อง...กรุณาตรวจสอบอีกครั้ง");
                    } else {
                        getId("date_from_format").value = getId("date_from").value !== "" ? format_Date(getId("date_from").value) : "";
                        getId("date_to_format").value = getId("date_to").value !== "" ? format_Date(getId("date_to").value) : "";
                        chk_doc_date = true;
                    }
                } else {
                    chk_doc_date = true;
                }
                if (chk_export_id && chk_doc_date) {
                    //alert("สำเร็จ");
                    document.exportfile.submit();
                }
            }
            function Open_Doc_id_from() {
                //alert(math_str_flag());
                (getId("export_id").value === "") ? alert("กรุณาเลือกรหัสที่ต้องการ Export") :
                        openBrWindow(getId("lookup_name").value + "&stadment=" + math_str_flag() + "&textinput=runno_from|doc_id_from", 53, "Search_Detail.jsp");
            }
            function Open_Doc_id_to() {
                //alert(math_str_flag());
                (getId("export_id").value === "") ? alert("กรุณาเลือกรหัสที่ต้องการ Export") :
                        openBrWindow(getId("lookup_name").value + "&stadment=" + math_str_flag() + "&textinput=runno_to|doc_id_to", 53, "Search_Detail.jsp");
            }
            function math_str_flag() {
                var return_str = "";
                var str_math = new Array;
                str_math[0] = getId("complete_flag").value !== "" ? "complete_flag+=+\'" + getId("complete_flag").value + "\'" : "";
                str_math[1] = getId("retro_flag").value !== "" ? "retro_flag+=+\'" + getId("retro_flag").value + "\'" : "";
                str_math[2] = getId("cancel_flag").value !== "" ? "cancel_flag+=+\'" + getId("cancel_flag").value + "\'" : "";
                //str_math[3] = getId("delete_flag").value != "" ?"delete_flag+=+\'"+getId("delete_flag").value+"\'":"";
                for (var i = 0; i < str_math.length; i++) {
                    return_str += str_math[i] !== "" ? "and+" + str_math[i] + "+" : "";
                }
                return return_str;
            }
        </script>
    </head>
    <body onUnload="closepopup()">

        <div class="container">        
            <div class="panel panel-primary">
                <div class="panel-heading"> <span class="glyphicon glyphicon-log-in" style="color:white"></span>&nbsp;
                    <b>RAW MATERIAL Transaction Export Data (CS_053_EXP_RAWMAT_BIGBAG)</b>
                </div>                

                <div class="panel-footer">                

                    <form name="exportfile" method="post" action="../JSP/CS_053_EXP_RAWMAT_BIGBAG.jsp" >
                        <% UtiDatabase objuti = new UtiDatabase();
                            String current_date, start_year, end_year, next_year;
                            DateUtil ObjDate = new DateUtil();
                            PeriodDate ObjPeriod = new PeriodDate();
                            current_date = ObjDate.Return_Date_Now_full();
                            start_year = ObjPeriod.Start_Year("S");
                            end_year = ObjPeriod.End_Year("S");

                            int next_year_num = Integer.parseInt(end_year.substring(6, 10)) + 1;

                            next_year = "01-01-" + next_year_num;

                        %>
                        <input type="hidden" name="type_report"  value="4">
                        <input type="hidden" name="complete_flag" id="complete_flag"  value="">
                        <input type="hidden" name="retro_flag" id="retro_flag"  value="">
                        <input type="hidden" name="cancel_flag" id="cancel_flag"  value="">
                        <input type="hidden" name="delete_flag" id="delete_flag"  value="">
                        <input type="hidden" name="lookup_name" id="lookup_name"  value="">
                        <input type="hidden" name="date_from_format" id="date_from_format" value="">
                        <input type="hidden" name="date_to_format" id ="date_to_format" value="">
                        <table  cellpadding="0" cellspacing="0" >
                            <tr>
                                <td colspan="4"  class="blankspace"></td>
                            </tr>
                            <tr>
                                <td colspan='4'><b>กำหนดเงื่อนไข <span class="ftopcenter">Export Data</span></b></td>
                            </tr>
                            <tr>
                                <td width="158" class='columnlabel1'>ชื่อข้อมูลที่ Export :&nbsp;</td><td colspan="3" class='columnobject'><input name='export_id' type='text' class="inputs" id="export_id" value='EXP016' size="20" />
                                    <input name='export_id_desc' type='text' class="inputs" id="export_id_desc" value='EXP_RAWMAT_BIGBAG' size="30" />
                                </td>
                            </tr>

                            <tr>
                                <td class='columnobject'><div align="right"><b>วันที่เริ่มต้น</b>&nbsp;:&nbsp;</div></td>
                                <td class='columnobject'><input name="date_from" type='text' class="inputs" id="date_from" value="<%=start_year%>" readonly/>
                                    &nbsp;<a id='date_1' href="javascript:;"><img name='IMAGE4' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a>
                                    <script type='text/javascript'>Calendar.setup({inputField: 'date_from', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>                                    
                                </td>                                    
                                </td>
                                <td class='columnobject'><div align="right"><b>ถึงวันที่</b>&nbsp;:&nbsp;</div></td>
                                <td class='columnobject'><input name="date_to" type='text' class="inputs" id="date_to" value="<%=end_year%>" readonly/>
                                    &nbsp;<a id='date_2' href="javascript:;"><img name='IMAGE4' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a>
                                    <script type='text/javascript'>Calendar.setup({inputField: 'date_to', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_2', singleClick: true, step: 1});</script>                                    
                                </td>
                            </tr>   

                                <tr>
                                    <td class="columnlabel1">คลัง&nbsp;</td>
                                    <td class="columnobject">
                                        <input type="hidden" size="10"  id="wh_out" name="wh_out" value="-"><input type='text' class="inputs"  size="20"  id="wh_out_desc" name="wh_out_desc" value="-">
                                        <a href='#' onClick="openBrWindow('Wh_en&stadment=', 23, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>
                                    </td>
                            <tr>
                                <td colspan='4' class='blankspace' ></td>
                            </tr>

                            <tr>
                                <td colspan='4' class='blankspace' align="right">
                                    <input type="button" class="cgcButton_11" name="myBut" value=" Export Data  " onClick="Action_Export()"/>
                                    <input type="button" class="cgcButton_11" name="myBut" value=" ยกเลิก  " onClick="Cancelvalue()"/>                                       </td>
                            </tr>
                            <tr>
                                <td colspan='4' class='blankspace' ></td>
                            </tr>
                        </table>
                </div>
            </div>
        </div>                                        
    </form>
</body>
</html>
