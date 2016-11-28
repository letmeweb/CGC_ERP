<!DOCTYPE html>
<%@page import="com.cgc.Util.HeaderScreen_Report"%>
<%@page import="com.cgc.bean.DataBean_Screen_Report"%>
<%@page import="com.cgc.Util.UtiDatabase"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cgc.bean.DataBean_Screen_Process"%>
<%@page import="com.cgc.Util.HeaderScreen_Process"%>
<%@page import="com.cgc.bean.UserBean"%>
<html>
    <%!    String path, lookup, doc_eff_date, doc_no, chk_dept;
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <link rel="stylesheet" media="all" type="text/css" href="../CSS/ui-lightness/jquery-ui-1.8.17.custom.css" />
        <link rel="stylesheet" media="all" type="text/css" href="../CSS/timepicker.css" />
        <!---->        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css"> <link href="../CSS/component.css" rel="stylesheet" type="text/css">
        <link href="../CSS/tooltipster.css" rel="stylesheet" type="text/css"/>        
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script language="javascript" src="../JS/myAjaxFramework.js"></script><!-- calendar stylesheet -->
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script><!-- language for the calendar -->
        <!-- the following script defines the Calendar.setup helper function, which makes
               adding a calendar a matter of 1 or 2 lines of code. -->
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script type="text/javascript" src="../JS/jquery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../JS/jquery/jquery-ui-1.8.17.custom.min.js"></script>            
        <script type="text/javascript" src="../JS/jquery/jquery-ui-timepicker-addon.js"></script>
        <script type="text/javascript" src="../JS/jquery/jquery-ui-sliderAccess.js"></script>
        <script type="text/javascript" src="../JS/TimeFramwork.js"></script>
        <script type="text/javascript" src="js/jquery.tooltipster.min.js"></script>     

        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap-theme.min.css">
        <script src="../JS/jquery/jquery-2.1.4.js"></script>
        <script src="../JS/bootstrap/js/bootstrap.min.js"></script>                           

        <link rel="stylesheet" href="../CSS/checkbox/awesome-bootstrap-checkbox.css"/>     


        <script src="../JS/alertify/alertify.js"></script>        

        <link rel="stylesheet" href="../CSS/alertify/alertify.core.css" />

        <!-- alertify theme Section -->
        <!--link rel="stylesheet" href="../CSS/alertify/alertify.bootstrap.css"-->
        <link rel="stylesheet" href="../CSS/alertify/alertify.default.css">

        <link rel="stylesheet" href="../FONTS/css/font-awesome.css" />        

        <script type="text/javascript">
            function ResetValue() {
                getId("product_confirm").value = "N";
                getId("product_confirm").checked = false;
                getId("quality_confirm").value = "N";
                getId("quality_confirm").checked = false;
                getId("wh_emp_confirm").value = "N";
                getId("wh_emp_confirm").checked = false;
                getId("wh_leader_confirm").value = "N";
                getId("wh_leader_confirm").checked = false;
                getId("maxline").value = "0";
                getId("complete_flag").value = "N";
                getId("complete_flag").checked = false;
                getId("complete_flag").disabled = true;
                getId("status_cancle").value = "";
                getId("show").innerHTML = "<table width=\"100%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" class=\"inner\"  name = \"tbExp\" id = \"tbExp\"></table>";
            }
            function Chknull() {
                if (document.getElementById('A_doc_id').value === '') {
                    alertify.alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                } else {

                    document.report.submit();
                }
            }

            function goAddChild(URLSend)
            {
                if (getId("status_cancle").value === "1") {
                    var arryChk = new Array;
                    arryChk[0] = "chkNull";
                    if (ChkParameter(arryChk))
                    {
                        window.open(URLSend[0]);
                    }
                } else {
                    alertify.alert("กรุณาบันทึกหัวเอกสาร");
                }

            }
            function cancle()
            {
                location.reload(true);
                //location.replace("CS_D_carbon_send_product_header.jsp");
            }
            function ckall(Value)//ทำการกดปุ้ม check ทั้งหมดใช้หรือไม่
            {

                for (var i = 0; i < document.getElementsByName("ckbox").length; i++)
                {
                    document.getElementsByName("ckbox")[i].checked = Value;
                }

            }

            function goDelChild()
            {
                var Deleteflag = "";
                var SURL;
                if (getId("chk_all").checked)//จะทำการลบข้อมูลของ Detail ทั้งหมด ทึ่ตรงกับรหัส
                {
                    SURL = "../JSP/CS_Detail_D_carbon_send_product.jsp?status_d=3&chk_all=1&username=" + getId("A_username").value;
                    SURL = SURL + "&A_doc_id=" + getId("A_doc_id").value;
                    Delete_Line_no(SURL);
                    getId("show").innerHTML = "";
                    getId("chk_all").checked = false;
                }
                else//จะทำการลบข้อมูลเฉพาะ Detail ที่ทำการเลือกไว้
                {
                    SURL = "../JSP/CS_Detail_D_carbon_send_product.jsp?status_d=3&ckbox=";
                    for (var i = 0; i < document.getElementsByName("ckbox").length; i++)
                    {
                        Deleteflag += (document.getElementsByName("ckbox")[i].checked) ? (i + 1).toString() + "," : "";
                    }

                    Deleteflag = Deleteflag.substring(0, Deleteflag.length - 1);
                    SURL = SURL + Deleteflag + "&A_doc_id=" + getId("A_doc_id").value + "&username=" + getId("A_username").value;
                    Delete_Line_no(SURL);
                    showTableNonPopup("show", "A_doc_id", "../JSP/CS_ShowD_carbon_send_product.jsp?doc_id=");
                    setTimeout('showTableNonPopup("show", "A_doc_id", "../JSP/CS_ShowD_carbon_send_product.jsp?doc_id=")', 100);
                }
            }

            function OpenEdit(URLSend)
            {
                window.open(URLSend[0]);
            }
            function AddHeader()
            {
                alertify.confirm("ต้องการบันทึกข้อมูลหรือไม่ ?", function(e) {
                    if (e)
                    {
                        var arryChk = new Array;
                        arryChk[0] = "chkNull";
                        //if (ChkParameter(arryChk) && check_detail_null()) {                        
                        if (ChkParameter_1(arryChk)) {
                            var strID = "";
                            var select_id = "";

                            if (parseInt(getId("maxline").value, 10) !== 0) {
                                for (var i = 1; i <= parseInt(getId("maxline").value, 10); i++) {
                                    select_id += "P_job_id_" + (i) + ",P_product_id_" + (i) + ",P_job_type_" + (i) + ",P_size_id_" + (i) + ",P_i2_" + (i) + ",P_machine_" + (i) + ",P_pallet_" + (i) + ",P_prod_no_" + (i) + ",P_bag_qty_" + (i) + ",P_fraction_" + (i) + ",P_total_weight_" + (i) + ",P_job_type_" + (i) + ",";
                                }

                            }
                            var str_Confirm = "product_confirm,quality_confirm,wh_emp_confirm,wh_leader_confirm,";
                            var strID = select_id + str_Confirm + "A_screen_id,A_dept_doc_id,A_doc_s_time,A_doc_r_time,A_complete_flag,I_status,A_doc_id,A_doc_date,A_job_type,A_product_leader_id,A_lab_leader_id,A_warehouse_emp_id,A_warehouse_leader_id,A_doc_type";
                            getSave_1(URLsend('chkNull,maxline,' + strID, '../JSP/CS_D_carbon_send_product_header.jsp'));
                            ResetValue();
                        }
                    }
                });
            }

            function Delete()
            {
                alertify.confirm("ต้องการลบข้อมูลหรือไม่ ?", function(e) {
                    if (e)
                    {
                        getSave_1(URLsend('D_status,A_doc_id', '../JSP/CS_D_carbon_send_product_header.jsp'));
                        ResetValue();
                    }
                });

            }
            function Unload()
            {
            }
            function OpenDoc_id(input)
            {
                switch (input) {
                    case 1:
                        openBrWindow('vd_carbon_send_product_header&stadment=and+doc_type+=+\'PT\'and+wh_leader_confirm+=+\'N\'', 28, 'Search_Doc_id.jsp');
                        break;
                    case 2:
                        openBrWindow('vd_carbon_send_product_header&stadment=and+doc_type+=+\'PT\'and+wh_leader_confirm+=+\'Y\'', 28, 'Search_Doc_id.jsp');
                        break;

                    default:
                        if (getId("A_username").value === 'admin') {
                            openBrWindow('vd_carbon_send_product_header&stadment=and+complete_flag+=+\'Y\'', 28, 'Search_Doc_id.jsp');
                        } else {
                            openBrWindow('vd_carbon_send_product_header&stadment=and+complete_flag+=+\'Y\'', 28, 'Search_Doc_id.jsp');
                        }
                        break;
                }

            }

            function Open_DeptID(input)
            {
                switch (input) {
                    case 1:
                        if (getId("A_dept_doc_id").value === 'ST') {
                            openBrWindow('mdepartment&stadment\'', 24, 'Search_Config2.jsp');
                        } else {
                            openBrWindow('mdepartment&stadment=and+dept_id+=+\'' + getId('dept_id').value + '\'', 24, 'Search_Config2.jsp');
                        }
                        break;
                }

            }


            function Click_Complete_flag(value) {
                if (value) {
                    alertify.alert("เอกสารนี้สมบูรณ์");
                    getId("A_complete_flag").checked = value;
                    getId("A_complete_flag").value = "Y";
                } else {
                    getId("A_complete_flag").checked = value;
                    getId("A_complete_flag").value = "N";
                }
            }
            function Click_Company_id() {
                for (var i = 0; i < document.getElementsByName("company_id").length; i++)
                {
                    if (document.getElementsByName("company_id")[i].checked) {
                        getId("A_company_id").value = document.getElementsByName("company_id")[i].value;
                    }
                }
            }

            function CreateNewRow()
            {
                var theTable = document.getElementById("tbExp");

                var intLine = parseInt(getId("maxline").value);
                if (intLine === 0) {
                    for (var i = 1; i <= 20; i++) {
                        intLine++;
                        var theTable = document.getElementById("tbExp");
                        var newRow = theTable.insertRow(theTable.rows.length);
                        newRow.id = newRow.uniqueID;
                        var item1 = 1;
                        var newCell;


                        newCell = newRow.insertCell(0);
                        newCell.id = newCell.uniqueID;
                        newCell.setAttribute("width", "10");
                        newCell.setAttribute("class", "forborder");
                        newCell.setAttribute("align", "center");
                        newCell.innerHTML = "<td><input type = 'checkbox' id = '" + intLine + "' name = 'ckbox'></td>";

                        newCell = newRow.insertCell(1);
                        newCell.setAttribute("width", "10");
                        newCell.setAttribute("class", "forborder");
                        newCell.setAttribute("align", "center");
                        newCell.innerHTML = "<td style=\"width: 10px;\">" + intLine + "&nbsp;</td>";
                        newCell = newRow.insertCell(2);
                        newCell.setAttribute("width", "100");
                        newCell.setAttribute("class", "forborder");
                        newCell.setAttribute("align", "center");
                        newCell.innerHTML = "<td   style=\"width: 100px;\" ><INPUT    TYPE=\"text\" SIZE=\"10\" name=\"P_job\" ID=\"P_job_id_" + intLine + "\" VALUE=\"\"  onclick=\"openBrWindow(\'vd_job_order_header&textinput=P_job_id_" + intLine + "\', 0, \'Search_Detail_Desc2.jsp\')\" readonly></td>";
                        newCell = newRow.insertCell(3);
                        newCell.setAttribute("width", "3%");
                        newCell.setAttribute("class", "forborder");
                        newCell.setAttribute("align", "center");
                        newCell.innerHTML = "<td><INPUT   TYPE=\"text\" SIZE=\"3\" name=\"P_product\" ID=\"P_product_id_" + intLine + "\" VALUE=\"\"  onclick=\"openBrWindow(\'mproduct_cat&textinput=P_product_id_" + intLine + "\', 0, \'Search_Detail_Desc2.jsp\')\" readonly></td>";
                        newCell = newRow.insertCell(4);
                        newCell.setAttribute("width", "10%");
                        newCell.setAttribute("class", "forborder");
                        newCell.setAttribute("align", "center");
                        newCell.innerHTML = "<td style=\"width: 50px;\"><INPUT TYPE=\"text\" SIZE=\"8\" name=\"P_job_type\" ID=\"P_job_type_" + intLine + "\" VALUE=\"\" onclick=\"openBrWindow(\'mjob_type_detail&textinput=P_job_type_" + intLine + "\', 0, \'Search_Detail_Desc.jsp\')\" readonly></td>";
                        newCell = newRow.insertCell(5);
                        newCell.setAttribute("width", "5%");
                        newCell.setAttribute("class", "forborder");
                        newCell.setAttribute("align", "center");
                        newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"15\" name=\"P_size\" ID=\"P_size_id_" + intLine + "\" VALUE=\"\"  onclick=\"openBrWindow(\'m_carbon_size&textinput=P_size_id_" + intLine + "\', 0, \'Search_Detail_Desc2.jsp\')\" readonly></td>";
                        newCell = newRow.insertCell(6);
                        newCell.setAttribute("width", "10%");
                        newCell.setAttribute("class", "forborder");
                        newCell.setAttribute("align", "center");
                        newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"8\" name=\"P_i2\" ID=\"P_i2_" + intLine + "\" VALUE=\"\"  onclick=\"openBrWindow(\'m_iodine_product&textinput=P_i2_" + intLine + "\', 0, \'Search_Detail_Desc2.jsp\')\" readonly></td>";
                        newCell = newRow.insertCell(7);
                        newCell.setAttribute("width", "10%");
                        newCell.setAttribute("class", "forborder");
                        newCell.setAttribute("align", "center");
                        newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"10\" name=\"P_machine\" ID=\"P_machine_" + intLine + "\" VALUE=\"\"  onclick=\"openBrWindow(\'mmachine&textinput=P_machine_" + intLine + "\', 0, \'Search_Detail_Desc_Name_T.jsp\')\" readonly></td>";
                        newCell = newRow.insertCell(8);
                        newCell.setAttribute("width", "10%");
                        newCell.setAttribute("class", "forborder");
                        newCell.setAttribute("align", "center");
                        newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"3\" name=\"P_pallet\" ID=\"P_pallet_" + intLine + "\" VALUE=\"\"></td>";
                        newCell = newRow.insertCell(9);
                        newCell.setAttribute("width", "10%");
                        newCell.setAttribute("class", "forborder");
                        newCell.setAttribute("align", "center");
                        newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"10\" ID=\"P_prod_no_" + intLine + "\" VALUE=\"\" ></td>";
                        newCell = newRow.insertCell(10);
                        newCell.setAttribute("width", "10%");
                        newCell.setAttribute("class", "forborder");
                        newCell.setAttribute("align", "center");
                        newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"5\" ID=\"P_bag_qty_" + intLine + "\" VALUE=\"\" onblur=\"IsNuber(this.value, this)\"></td>";
                        newCell = newRow.insertCell(11);
                        newCell.setAttribute("width", "10%");
                        newCell.setAttribute("class", "forborder");
                        newCell.setAttribute("align", "center");
                        newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"7\" ID=\"P_fraction_" + intLine + "\" VALUE=\"\" onblur=\"IsNuber(this.value, this)\"></td>";
                        newCell = newRow.insertCell(12);
                        newCell.setAttribute("width", "10%");
                        newCell.setAttribute("class", "forborder");
                        newCell.setAttribute("align", "center");
                        newCell.innerHTML = "<td><INPUT TYPE=\"text\" SIZE=\"7\" ID=\"P_total_weight_" + intLine + "\" VALUE=\"\" onblur=\"IsNuber(this.value, this)\"></td>";
                    }
                } else {
                    intLine++;
                    var theTable = document.getElementById("tbExp");
                    var newRow = theTable.insertRow(theTable.rows.length);
                    newRow.id = newRow.uniqueID;
                    var item1 = 1;
                    var newCell;
                    //*** Column 1 ***//
                    newCell = newRow.insertCell(0);
                    newCell.id = newCell.uniqueID;
                    newCell.setAttribute("width", "2%");
                    newCell.setAttribute("class", "forborder");
                    newCell.setAttribute("align", "center");
                    newCell.innerHTML = "<td  style=\"width: 10px;\"><input type = 'checkbox' id = '" + intLine + "' name = 'ckbox'></td>";
                    newCell = newRow.insertCell(1);
                    newCell.setAttribute("width", "10");
                    newCell.setAttribute("class", "forborder");
                    newCell.setAttribute("align", "center");
                    newCell.innerHTML = "<td style=\"width: 10px;\" >" + intLine + "&nbsp;</td>";
                    newCell = newRow.insertCell(2);
                    newCell.setAttribute("width", "5%");
                    newCell.setAttribute("class", "forborder");
                    newCell.setAttribute("align", "center");
                    newCell.innerHTML = "<td><INPUT    TYPE=\"text\" SIZE=\"10\" name=\"P_job\" ID=\"P_job_id_" + intLine + "\" VALUE=\"\"  onclick=\"openBrWindow(\'vd_job_order_header&textinput=P_job_id_" + intLine + "\', 0, \'Search_Detail_Desc2.jsp\')\" readonly></td>";
                    newCell = newRow.insertCell(3);
                    newCell.setAttribute("width", "5%");
                    newCell.setAttribute("class", "forborder");
                    newCell.setAttribute("align", "center");
                    newCell.innerHTML = "<td ><INPUT   TYPE=\"text\" SIZE=\"3\" name=\"P_product\" ID=\"P_product_id_" + intLine + "\" VALUE=\"\"  onclick=\"openBrWindow(\'mproduct_cat&textinput=P_product_id_" + intLine + "\', 0, \'Search_Detail_Desc2.jsp\')\" readonly></td>";
                    newCell = newRow.insertCell(4);
                    newCell.setAttribute("width", "10%");
                    newCell.setAttribute("class", "forborder");
                    newCell.setAttribute("align", "center");
                    newCell.innerHTML = "<td><INPUT    TYPE=\"text\" SIZE=\"8\" name=\"P_job_type\" ID=\"P_job_type_" + intLine + "\" VALUE=\"\" ></td>";
                    newCell = newRow.insertCell(5);
                    newCell.setAttribute("width", "5%");
                    newCell.setAttribute("class", "forborder");
                    newCell.setAttribute("align", "center");
                    newCell.innerHTML = "<td><INPUT   TYPE=\"text\" SIZE=\"15\" name=\"P_size\" ID=\"P_size_id_" + intLine + "\" VALUE=\"\"  onclick=\"openBrWindow(\'m_carbon_size&textinput=P_size_id_" + intLine + "\', 0, \'Search_Detail_Desc2.jsp\')\" readonly></td>";
                    newCell = newRow.insertCell(6);
                    newCell.setAttribute("width", "10%");
                    newCell.setAttribute("class", "forborder");
                    newCell.setAttribute("align", "center");
                    newCell.innerHTML = "<td><INPUT   TYPE=\"text\" SIZE=\"8\" name=\"P_i2\" ID=\"P_i2_" + intLine + "\" VALUE=\"\"  onclick=\"openBrWindow(\'m_iodine_product&textinput=P_i2_" + intLine + "\', 0, \'Search_Detail_Desc2.jsp\')\" readonly></td>";
                    newCell = newRow.insertCell(7);
                    newCell.setAttribute("width", "10%");
                    newCell.setAttribute("class", "forborder");
                    newCell.setAttribute("align", "center");
                    newCell.innerHTML = "<td><INPUT    TYPE=\"text\" SIZE=\"10\" name=\"P_machine\" ID=\"P_machine_" + intLine + "\" VALUE=\"\"  onclick=\"openBrWindow(\'mmachine&textinput=P_machine_" + intLine + "\', 0, \'Search_Detail_Desc_Name_T.jsp\')\" readonly></td>";
                    newCell = newRow.insertCell(8);
                    newCell.setAttribute("width", "10%");
                    newCell.setAttribute("class", "forborder");
                    newCell.setAttribute("align", "center");
                    newCell.innerHTML = "<td><INPUT   TYPE=\"text\" SIZE=\"3\" name=\"P_pallet\" ID=\"P_pallet_" + intLine + "\" VALUE=\"\"></td>";
                    newCell = newRow.insertCell(9);
                    newCell.setAttribute("width", "10%");
                    newCell.setAttribute("class", "forborder");
                    newCell.setAttribute("align", "center");
                    newCell.innerHTML = "<td><INPUT  TYPE=\"text\" SIZE=\"10\" ID=\"P_prod_no_" + intLine + "\" VALUE=\"\" ></td>";
                    newCell = newRow.insertCell(10);
                    newCell.setAttribute("width", "10%");
                    newCell.setAttribute("class", "forborder");
                    newCell.setAttribute("align", "center");
                    newCell.innerHTML = "<td><INPUT    TYPE=\"text\" SIZE=\"5\" ID=\"P_bag_qty_" + intLine + "\" VALUE=\"\" onblur=\"IsNuber(this.value, this)\"></td>";
                    newCell = newRow.insertCell(11);
                    newCell.setAttribute("width", "10%");
                    newCell.setAttribute("class", "forborder");
                    newCell.setAttribute("align", "center");
                    newCell.innerHTML = "<td><INPUT    TYPE=\"text\" SIZE=\"7\" ID=\"P_fraction_" + intLine + "\" VALUE=\"\" onblur=\"IsNuber(this.value, this)\"></td>";
                    newCell = newRow.insertCell(12);
                    newCell.setAttribute("width", "10%");
                    newCell.setAttribute("class", "forborder");
                    newCell.setAttribute("align", "center");
                    newCell.innerHTML = "<td><INPUT    TYPE=\"text\" SIZE=\"7\" ID=\"P_total_weight_" + intLine + "\" VALUE=\"\" onblur=\"IsNuber(this.value, this)\"></td>";
                }

                getId("maxline").value = intLine;

            }
            function RemoveRow()
            {
                var intLine = parseInt(getId("maxline").value);
                if (parseInt(intLine) > 0)
                {
                    var theTable = (document.all) ? document.all.tbExp : document.getElementById("tbExp");
                    var theTableBody = theTable.tBodies[0];
                    //theTableBody.deleteRow(intLine - 1);
                    theTableBody.deleteRow((intLine + 1) - 1);
                    intLine--;
                    getId("maxline").value = intLine;
                }
            }
            function check_detail_null() {
                var status = true; //ไม่มีคำว่าง false = มีคำว่าง
                for (var i = 1; i <= parseInt(getId("maxline").value, 10); i++) {
                    if (getId("P_part_id_" + i).value === "" || getId("P_qty_" + i).value === "" || getId("P_remark_" + i).value === "") {
                        status = false;
                        alertify.alert("กรุณาตรวจสอบข้อมูลส่วนของ รายการ จำนวน ใช้งาน เนื่องจากมี่ช่องว่าง");
                        break;
                    }
                }
                return status;
            }

            function Check_Confirm(This, Id_texbox) {
                var old_check = getId(This.id).checked;
                var old_value = getId(This.id).value;
                //alert(getId(This.id).checked);
                if (getId("emp_id").value === getId(Id_texbox).value) {
                    if (getId(This.id).checked) {
                        alertify.alert("ทำการยืนยันเรียบร้อยแล้ว");
                        getId(This.id).value = "Y";
                        //alert(getId(This.id).value);
                    } else {
                        getId(This.id).value = "N";
                    }
                } else {
                    alertify.alert("กรุณายืนยันช่องหน้าที่ของตัวเอง");
                    getId(This.id).checked = old_value === "Y" ? true : false;
                    getId(This.id).value = old_value;
                }
            }

            function Check_WH_Confirm(This, dept_id) {
                var old_check = getId(This.id).checked;
                var old_value = getId(This.id).value;

                if (dept_id === "1") {
                    if (getId(This.id).checked) {
                        alertify.alert("ทำการยืนยันเรียบร้อยแล้ว");
                        getId(This.id).value = "Y";
                    } else {
                        getId(This.id).value = "N";
                    }
                }
            }

            function OpenConfirm(table, URL, dept_id) {
                if (dept_id === "1") {
                    var dept_id1, dept_id2, status;
                    dept_id1 = '006';
                    dept_id2 = '05';
                    status = 'Y';
                    table += "&stadment=and+dept_id+=+\'" + dept_id1 + "\'+or+dept_id+=+\'" + dept_id2 + "\'+and+status+=+\'" + status + "\'";
                } else {
                    table += "&stadment=and+emp_id+=+\'" + getId("emp_id").value + "\'+and+dept_id+=+\'" + dept_id + "\'";
                }
                openBrWindow(table, 314, URL);
            }
            function OpenBrownNoConfirm(table, URL, dept_id) {
                table += "&stadment=and+" + (dept_id === '05' ?
                        "wh_emp_confirm" :
                        dept_id === '003' ?
                        "quality_confirm" :
                        dept_id === '002' ?
                        "product_confirm" :
                        dept_id === '006' ?
                        "wh_leader_confirm" :
                        ""
                        ) + "+=+'N'+and+complete_flag=+'N'";
                openBrWindow(table, 322, URL);

            }
            function OpenBrownConfirm(table, URL, dept_id) {
                table += "&stadment=and+" + (dept_id === '05' ?
                        "wh_emp_confirm" :
                        dept_id === '003' ?
                        "quality_confirm" :
                        dept_id === '002' ?
                        "product_confirm" :
                        dept_id === '006' ?
                        "wh_leader_confirm" :
                        ""
                        ) + "+=+'Y'+and+complete_flag=+'N'";
                openBrWindow(table, 322, URL);
            }


            $(function() {
                $('#tabs').tabs();
            });

            function Record_Count() {
                AjaxRun_id("record_count1", "../JSP/CS_D_Carbon_Send_Count_Doc.jsp?runer_id=4");
            }

            function Start_Check_Record_Count() {

                myVar = setInterval(function() {
                    Record_Count();
                }, 3000);
            }

        </script>
        <title>Carbon Send Product</title>
    </head>
    <body onload="Start_Check_Record_Count()">
        <style type="text/css">
            <!--
            bt {
                width: 1000px;
            }
            .block100{
                width:1500px;
                background-color: #CC0000  ;
            }
            .block50{

                width:50px;
            }

            -->
        </style>
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <%
                UserBean userbean = (UserBean) session.getAttribute("user");
                DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                HeaderScreen_Process h_p = new HeaderScreen_Process();
                objs_p = h_p.selectheaderscreen_process(objs_p, "CS_D_carbon_send_product_header");
                UtiDatabase objuti = new UtiDatabase();
                // _______________________________________________________________report
                DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                DataBean_Screen_Report objscreen = new DataBean_Screen_Report();
                HeaderScreen_Report r_p = new HeaderScreen_Report();
                objscreen = r_p.Fn_Report(objscreen, request.getParameter("submenu_id"));
                objr_p = r_p.Fn_Report(objr_p, "S517");
                path = objr_p.getPath();
                lookup = objr_p.getLookup();
                doc_eff_date = objr_p.getDoc_eff_date();
                doc_no = objr_p.getDoc_no();
                String inputSQL = " select count(*) as num from vd_carbon_send_product_header where doc_type = 'PT' and  complete_flag <> 'Y'   ";
                int record_count1 = objuti.numRowdatabase(inputSQL);
                //_______________________________________________________________report

                //Check Dept ID 
                chk_dept = "0";
                if ((userbean.getDept_id().equals("05")) || userbean.getDept_id().equals("006")) {
                    chk_dept = "1";
                } else {
                    chk_dept = "2";
                }
            %>
            <input type="hidden" name="A_username" id="A_username" value="<%=userbean.getUsername()%>" size="30" readonly/>
            <!--input type="hidden" name="A_dept_doc_id" id="A_dept_doc_id" value="<%=userbean.getDept_doc_id()%>"-->
            <input type="hidden" name="A_dept_doc_id" id="A_dept_doc_id" value="PT">
            <input type="hidden" name="A_doc_type" id="A_doc_type" value="PT">
            <!--input type="hidden" name="A_complete_flag" id="A_complete_flag" value="N"-->
            <input type="hidden" name="complete_flag" id="complete_flag" value="N">
            <input type="hidden" name="A_deptID" id="A_deptID" value="<%=userbean.getDept_id()%>">
            <input type="hidden" name="emp_id" id="emp_id" value="<%=userbean.getEmp_id()%>">
            <input type="hidden" name="emp_fullname" id="emp_fullname" value="<%=userbean.getFullname()%>">    
            <input type="hidden" name="dept_id" id="dept_id" value="<%=userbean.getDept_id()%>">            
            <input type="hidden" id="A_screen_id" name="A_screen_id" value="CS_D_carbon_send_product_header2">
            <input type="hidden" name="chkNull" id="chkNull" value="A_doc_date">
            <input type="hidden" name="I_status" id="I_status" value="1"><!-- เป็นการเพิ่มข้อมูลเข้าไป-->
            <input type="hidden" name="D_status" id="D_status" value="3"><!-- เป็นการ Delete ข้อมูลทั้งหมด -->
            <input type="hidden" name="status_cancle" id="status_cancle" value=""><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
            <!---------------------------------------------------report----------------------------->
            <input type="hidden" id="report_code" name="report_code"  value="<%=path%>">
            <input type="hidden" id="type_report" name="type_report" value="2">
            <input type="hidden" id="lookup" name="lookup" value="<%=lookup%>">
            <input type="hidden" id="doc_eff_date" name="doc_eff_date" value="<%=doc_eff_date%>">
            <input type="hidden" id="doc_no" name="doc_no" value="<%=doc_no%>">
            <input type="hidden" name="dept_id" value="<%=userbean.getDept_id()%>" id="dept_id" >
            <input type="hidden" id="maxline" name="maxline" value="0">

            <div align="left">

                <div class="container">
                    <div class="panel panel-primary">
                        <div class="panel-heading"> <span class="glyphicon glyphicon-tasks"></span>&nbsp;
                            <b><%=objscreen.getName_t() + "(" + objscreen.getPath() + ")"%></b>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>[ หมายเลขเอกสาร : <%=objscreen.getDoc_no()%></b>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>วันที่มีผลบังคับใช้ : <%=objscreen.getDoc_eff_date()%> ]</b>
                        </div>                             
                        <div class="panel-footer">                  
                            <table  cellpadding="0" cellspacing="0" >
                                <!--tr>
                                    <td colspan="2" align="right"><b>หมายเลขเอกสาร : <%=doc_no%></b></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right"><b>วันที่มีผลบังคับใช้ : <%=doc_eff_date%></b></td>
                                </tr-->
                                <!--tr>
                                    <td class="columnlabel1">เอกสารสมบูรณ์&nbsp;</td>
                                    <td class="columnobject"><input id="A_complete_flag" type="checkbox" value="N" name="A_complete_flag" disabled="true"/></td>
                                </tr-->           

                                <%if ((chk_dept.charAt(0) == '1')) {%>
                                <tr>
                                    <td class="columnlabel1">จำนวนเอกสารที่ยังไม่รับเข้าคลัง</td>
                                    <td class="columnobject">&nbsp;&nbsp;
                                        <input name='record_count1' type='button' class="cgcButton_22" id="record_count1" value='<%=record_count1%>'onclick="Record_Count();"/>
                                        &nbsp;&nbsp;<b>รายการ</b>
                                    </td>                                    
                                </tr>       
                                <%}%>                                

                                <tr>
                                    <td class="columnlabel1"><b>เอกสารสมบูรณ์</b>&nbsp;:&nbsp;</td>
                                    <td class="columnobject">
                                        <div class="checkbox checkbox-primary">
                                            <input type="checkbox" id="A_complete_flag" name="A_complete_flag" value="N" disabled="true" >
                                            <label for="A_complete_flag"></label> 
                                        </div>
                                    </td>                                    
                                </tr>                               
                                <tr>
                                    <td width="150" class="columnlabel1">วันที่นำส่ง*&nbsp;</td>
                                    <td width="607" class="columnobject">
                                        <input name='A_doc_date' type='text' class="inputs" id="A_doc_date" value='' size='10' readonly="readonly"/>
                                        &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_doc_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>
                                        &nbsp;&nbsp;เวลานำส่ง&nbsp;
                                        <input name='A_doc_s_time' type='text' class="inputs" id="A_doc_s_time" value='' size='20' maxlength="20"  readonly onkeypress="Time_picker(this.id)" />
                                        &nbsp;&nbsp;เวลารับ&nbsp;
                                        <input name='A_doc_r_time' type='text' class="inputs" id="A_doc_r_time" value='' size='20' maxlength="20"  readonly onkeypress="Time_picker(this.id)" />                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td width="150" class="columnlabel1">ประเภทงาน&nbsp;</td>
                                    <td width="607" class="columnobject">                                    
                                        <input name='A_job_type' type='text' class="inputs" id="A_job_type" value='เตา' size='10' maxlength="10" readonly/>                                                                                 
                                    </td>
                                </tr>                                
                                <tr>
                                    <td width="150" class="columnlabel1">เลขที่เอกสาร&nbsp;</td>
                                    <td width="607" class="columnobject">
                                        <input name='A_doc_id' type='text' class="inputs" id="A_doc_id" value='' size='20' readonly/>
                                        &nbsp;<a href='#' onClick="OpenDoc_id(1)"  ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='25' height='25' border='0' align='middle' ></a>                                       
                                        &nbsp;เอกสาร คลังยืนยันการรับแล้ว&nbsp;<a href='#' onClick="OpenDoc_id(2)"  ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='25' height='25' border='0' align='middle' ></a>                                                                               
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'></td>
                                </tr>
                                <tr>
                                    <td height="200" colspan="2" align="center">
                                        <!--div id="tabs-1"-->
                                        <table width="200%" align="left" border="0" cellpadding="0" cellspacing="1" class="inner">
                                            <tr>
                                                <td colspan="3" class="h_multi"></td>
                                                <td colspan="4" class="btn_multi">
                                                    <input type='button' align="left" class="cgcButton_4" name='bt_insert' id="bt_insert" value='  เพิ่ม  ' onClick="getId('status_cancle').value === '1' ? goAddChild(URLsend('A_doc_id,A_doc_date,dept_id,I_status,A_username,A_doc_type', 'CS_Detail_D_carbon_send_product.jsp')) : CreateNewRow();"/>
                                                    <input type='button' align="left" class="cgcButton_3" name='bt_delete' id="bt_delete" value='  ลบ  ' onClick="getId('status_cancle').value === '1' ? goDelChild() : RemoveRow();"/>                                                
                                                    <input type="button" align="left" class="cgcButton_8" id="bt" value=" พิมพ์ใบนำส่ง " onclick="Chknull()">
                                                </td>
                                            </tr>
                                        </table>

                                        <div style="width:100%; height: auto; overflow: auto;" id="show">
                                            <table style="width:100%;"  align="left" border="0" cellpadding="0" cellspacing="1" class="inner"  name = "tbExp" id = "tbExp">



                                                <tr align='center'>
                                                    <td  class="row3" width="10"><input type="checkbox" name="chk_all" id="chk_all" value="chk_all" onClick="javascript:ckall(this.checked);"/></td>
                                                    <td class="row3" >ลำดับ</td>
                                                    <td class="row3" >ใบแจ้งผลิต</td>
                                                    <td class="row3" >ชนิดถ่าน</td>
                                                    <td class="row3" >ประเภท</td>
                                                    <td class="row3" >ขนาด</td>
                                                    <td class="row3" >I2</td>
                                                    <td class="row3">เครื่องผลิต</td>
                                                    <td class="row3">พาเลท/ถุง</td>
                                                    <td class="row3">รหัสผลิต</td>
                                                    <td class="row3">กระสอบ</td>
                                                    <td class="row3">เศษ</td>
                                                    <td class="row3">น้ำหนักรวม</td>
                                                </tr>                                               


                                            </table> 
                                        </div>
                                    </td>
                                </tr> 

                                <tr>
                                    <td class="columnlabel1">ผู้นำส่ง&nbsp;</td>
                                    <td class="columnobject"><input name="A_product_leader_id" type='text' class="inputs" id="A_product_leader_id" value ="-" size="15" readonly="true">
                                        <!--a href='#' onClick="openBrWindow('Vemployee', 314, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a-->
                                        <a href='javascript:;'onclick="OpenConfirm('Vemployee', 'Search_Config2.jsp', '002')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE6' width='20' height='20' border='0' align='middle' ></a>                                        
                                        <input name="A_product_leader_name" type='text' class="inputs" id="A_product_leader_name" size="30" readonly="true">
                                        &nbsp;ยืนยันการส่งข้อมูล&nbsp;
                                        <input type="checkbox" name="product_confirm" id="product_confirm" value="N" onclick="Check_Confirm(this, 'A_product_leader_id')">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">ผู้บันทึกผลวิเคราะห์ฯ&nbsp;</td>
                                    <td class="columnobject"><input name="A_lab_leader_id" type='text' class="inputs" id="A_lab_leader_id" value ="-" size="15" readonly="true">
                                        <!--a href='#' onClick="openBrWindow('Vemployee1', 314, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a-->
                                        <a href='javascript:;'onclick="OpenConfirm('Vemployee1', 'Search_Config2.jsp', '003')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE6' width='20' height='20' border='0' align='middle' ></a>                                                                                
                                        <input name="A_lab_leader_name" type='text' class="inputs" id="A_lab_leader_name" size="30" readonly="true">
                                        &nbsp;ยืนยันการวิเคราะห์ฯ&nbsp;
                                        <input type="checkbox" name="quality_confirm" id="quality_confirm" value="N" onclick="Check_Confirm(this, 'A_lab_leader_id')">
                                    </td>
                                </tr>
                                <%if ((chk_dept.charAt(0) == '1')) {%>
                                <tr>
                                    <td class="columnlabel1">ผู้ตรวจรับ&nbsp;</td>
                                    <td class="columnobject"><input name="A_warehouse_emp_id" type='text' class="inputs" id="A_warehouse_emp_id" value ="-" size="15" readonly="true">
                                        <!--a href='#' onClick="openBrWindow('Vemployee2', 314, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a-->
                                        <a href='javascript:;'onclick="OpenConfirm('Vemployee2', 'Search_Config2.jsp', '1')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE6' width='20' height='20' border='0' align='middle' ></a>                                                                                
                                        <input name="A_warehouse_emp_name" type='text' class="inputs" id="A_warehouse_emp_name" size="30" readonly="true">
                                        &nbsp;ยืนยันการบันทึกรับข้อมูล&nbsp;
                                        <input type="checkbox" name="wh_emp_confirm" id="wh_emp_confirm" value="N" onclick="Check_WH_Confirm(this, '1')">
                                    </td>
                                </tr> 
                                <%} else {%>
                                <tr>
                                    <td class="columnlabel1">ผู้ตรวจรับ&nbsp;</td>
                                    <td class="columnobject"><input name="A_warehouse_emp_id" type='text' class="inputs" id="A_warehouse_emp_id" value ="-" size="15" readonly="true">
                                        <!--a href='#' onClick="openBrWindow('Vemployee2', 314, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a-->
                                        <a href='javascript:;'onclick="OpenConfirm('Vemployee2', 'Search_Config2.jsp', '05')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE6' width='20' height='20' border='0' align='middle' ></a>                                                                                
                                        <input name="A_warehouse_emp_name" type='text' class="inputs" id="A_warehouse_emp_name" size="30" readonly="true">
                                        &nbsp;ยืนยันการบันทึกรับข้อมูล&nbsp;
                                        <input type="checkbox" name="wh_emp_confirm" id="wh_emp_confirm" value="N" onclick="Check_Confirm(this, 'A_warehouse_emp_id')">                                        
                                    </td>
                                </tr> 
                                <%}%>
                                <tr>
                                    <td class="columnlabel1">ผู้ตรวจสอบ&nbsp;</td>
                                    <td class="columnobject"><input name="A_warehouse_leader_id" type='text' class="inputs" id="A_warehouse_leader_id" value ="-" size="15" readonly="true">
                                        <!--a href='#' onClick="openBrWindow('Vemployee3', 314, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a-->
                                        <a href='javascript:;'onclick="OpenConfirm('Vemployee3', 'Search_Config2.jsp', '006')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE6' width='20' height='20' border='0' align='middle' ></a>                                                                                                                        
                                        <input name="A_warehouse_leader_name" type='text' class="inputs" id="A_warehouse_leader_name" size="30" readonly="true">
                                        &nbsp;ยืนยันการตรวจสอบข้อมูล&nbsp;
                                        <input type="checkbox" name="wh_leader_confirm" id="wh_leader_confirm" value="N" onclick="Check_Confirm(this, 'A_warehouse_leader_id')">
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan='2' class='blankspace'>
                                        <br>
                                        <div align="center">
                                            <a href="javascript:;" onClick="cancle()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="AddHeader()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="Delete()"><img alt="" class="imgtransparent" src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;"  onclick="Chknull()"><img alt="พิมพ์เอกสาร" class="imgtransparent" src="../IMAGES/BTN_PRINT_90.png" width="80" height="30" border="0"></a></div>
                                        <!--a href="javascript:;"  onclick="UpdateHeader()"><img alt="พิมพ์เอกสาร" src="../IMAGES/BTN_PRINT_90.png" width="80" height="30" border="0"></a></div-->
                                        <br>                                </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>