<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cgc.Util.HeaderScreen_Report"%>
<%@page import="com.cgc.bean.DataBean_Screen_Report"%>
<%@page import="com.cgc.bean.DataBean_Screen_Process"%>
<%@page import="com.cgc.Util.HeaderScreen_Process"%>
<%@page import="com.cgc.bean.UserBean"%>
<%@page import="com.cgc.Util.UtiDatabase"%>
<%@page import="com.cgc.Util.Display_Document_Status"%>
<%@page import="com.cgc.bean.DataBean_Display_Document_Status"%>

<html>
    <%!    String path, lookup, doc_eff_date, doc_no, doc_id_last;
    %>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/component.css" rel="stylesheet" type="text/css">        
        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap-theme.min.css">
        <script src="../JS/jquery/jquery-2.1.4.js"></script>
        <script src="../JS/bootstrap/js/bootstrap.min.js"></script>       
        <script src="../JS/alertify/alertify.min.js"></script>        
        <link rel="stylesheet" href="../CSS/alertify/alertify.core.css" />
        <link rel="stylesheet" href="../CSS/alertify/alertify.default.css" />          

        <link rel="stylesheet" href="../CSS/checkbox/awesome-bootstrap-checkbox.css"/> 
        <link rel="stylesheet" href="../FONTS/css/font-awesome.css" />        

        <title>CGC ERP</title>
        <script type="text/javascript">
            function Chknull() {
                if (document.getElementById('doc_id').value === '') {
                    alertify.alert('กรุณาใส่ข้อมูลเลขที่เอกสาร');
                } else
                    document.report.submit();
            }
            function goAddChild(URLSend)
            {
                var arryChk = new Array;
                arryChk[0] = "chkNull";
                if (ChkParameter(arryChk))
                {
                    window.open(URLSend[0]);
                }

            }
            function cancle()
            {

                var SURL;
                var r = confirm("คุณต้องการยกเลิกข้อมูลทั้งหมดหรือไม่");
                if (r)
                {
                    if (getId("status_cancle").value === "1" && getId("child_ck").value === "")
                    {
                        cancelAction();
                        getId("show").innerHTML = "";
                        getId("status_cancle").value = "";
                        getId("child_ck").value = "";
                        getId("doc_id").disabled = false;
                    }
                    else if (getId("status_cancle").value === "1" && getId("child_ck").value === "1")
                    {
                        alertify.alert("มีการเปลี่ยนแปลงข้อมูลกรุณาบันทึกข้อมูล");
                    }
                    else {
                        SURL = "../JSP/CS_024.jsp?status_d=3&chk_all=1&username=" + getId("username").value;
                        SURL = SURL + "&doc_id=" + getId("doc_id").value;
                        Delete_Line_no(SURL);
                        cancelAction();
                        getId("show").innerHTML = "";
                        getId("status_cancle").value = "";
                        getId("child_ck").value = "";
                        getId("doc_id").disabled = false;
                    }

                }

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
                    SURL = "../JSP/CS_024.jsp?status_d=3&chk_all=1&username=" + getId("username").value;
                    SURL = SURL + "&doc_id=" + getId("doc_id").value;
                    Delete_Line_no(SURL);
                    showTableNonPopup("show", "doc_id", "../JSP/CS_Show024.jsp?doc_id=");
                    getId("chk_all").checked = false;
                }
                else//จะทำการลบข้อมูลเฉพาะ Datail ที่ทำการเลือกไว้
                {
                    SURL = "../JSP/CS_024.jsp?status_d=3&ckbox=";
                    for (var i = 0; i < document.getElementsByName("ckbox").length; i++)
                    {
                        Deleteflag += (document.getElementsByName("ckbox")[i].checked) ? (i + 1).toString() + "," : "";
                    }

                    Deleteflag = Deleteflag.substring(0, Deleteflag.length - 1);
                    SURL = SURL + Deleteflag + "&doc_id=" + getId("doc_id").value + "&username=" + getId("username").value;
                    Delete_Line_no(SURL);
                    showTableNonPopup("show", "doc_id", "../JSP/CS_Show024.jsp?doc_id=");
                    setTimeout('showTableNonPopup("show", "doc_id", "../JSP/CS_Show024.jsp?doc_id=")', 100);
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
                        getSave_1(URLsend('chkNull,doc_id,doc_date,date_ck,status_cancle,child_ck,doc_time,wh_in,wh_out,runner_id,p_type,remark,username', '../JSP/CS_023.jsp'));
                        getId("status_cancle").value = "";
                        getId("child_ck").value = "";
                        getId("show").innerHTML = "";
                        getId("doc_id").disabled = false;
                        setTimeout('getId("child_ck").value = "";getId("date_ck").value= ""', 1000);
                    }
                });
            }
            function Delete()
            {
                var r = confirm("คุณต้องการลบข้อมูลทั้งหมดหรือไม่");
                if (r)
                {
                    getSave(URLsend('doc_id,doc_date,status_cancle,date_ck,child_ck,doc_time,wh_in,wh_out,runner_id,runner_id_desc,p_type,remark,status_d,username', '../JSP/CS_023.jsp'));
                    getId("status_cancle").value = "";
                    getId("child_ck").value = "";
                    getId("show").innerHTML = "";
                    getId("doc_id").disabled = false;
                    setTimeout('getId("child_ck").value = "";getId("date_ck").value= ""', 1000);
                }
            }
            function Unload()
            {

                if (getId("doc_id").disabled === true && getId("status_cancle").value !== "1") {
                    var r = confirm("คุณได้ทำการเปลี่ยนหน้าคุณต้องการบันทึกข้อมูลทั้งหมดใช่หรือไม่");
                    if (r === true) {
                        getSave(URLsend('chkNull,doc_id,doc_date,status_cancle,doc_time,wh_in,wh_out,runner_id,runner_id_desc,p_type,p_type_desc,remark,username', '../JSP/CS_023.jsp'));
                    }
                    else {
                        var SURL = "../JSP/CS_024.jsp?status_d=3&chk_all=1";
                        SURL = SURL + "&doc_id=" + getId("doc_id").value;
                        Delete_Line_no(SURL);
                    }
                }
                closepopup();
            }
            function OpenDoc_id(case_input)
            {
                if (case_input === 1) {
                    //openBrWindow('vd_rawmatt_withdraw_header&stadment=and+complete_flag+<>+\'Y\'', 23, 'Search_Doc_id.jsp');
                    openBrWindow('vd_rawmatt_withdraw_header&stadment=and+complete_flag+<>+\'Y\'', 23, 'Search_Doc_id.jsp');
                } else {
                    openBrWindow('vd_rawmatt_withdraw_header&stadment=and+complete_flag+=+\'Y\'', 23, 'Search_Doc_id.jsp');
                }
            }

            function Runing_Doc_id() {
                if (document.getElementById('doc_date').value === '') {
                    alertify.alert('กรุณาใส่วันที่เอกสาร');
                } else {
                    AjaxRun_id("doc_id", "../JSP/CS_RAWMAT_RUN_DOC_ID.jsp?runer_id=" + getId("doc_date").value);
                }
            }

            function Record_Count() {
                AjaxRun_id("record_count1", "../JSP/CS_D_Carbon_Send_Count_Doc.jsp?runer_id=6");
            }

            function Start_Check_Record_Count() {

                myVar = setInterval(function() {
                    Record_Count();
                }, 3000);
            }

            function Last_Doc_id() {
                AjaxRun_id("doc_id_last", "../JSP/CS_RAWMAT_RUN_DOC_ID.jsp?runer_id=1");
            }

            function Start_Check_Last_Doc_ID() {

                myVar = setInterval(function() {
                    Last_Doc_id();
                }, 2000);
            }

        </script> 
        <style>
            .table tbody tr:hover td, .table tbody tr:hover th {
                background-color: #FF66FF;
            }
        </style>        

    </head>

    <body onload="Start_Check_Last_Doc_ID();
            Start_Check_Record_Count();">
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">

            <%
                UtiDatabase objuti = new UtiDatabase();
                UserBean userbean = (UserBean) session.getAttribute("user");
                DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                HeaderScreen_Process h_p = new HeaderScreen_Process();
                objs_p = h_p.selectheaderscreen_process(objs_p, "CS_023");
                // _______________________________________________________________report
                DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                DataBean_Screen_Report objscreen = new DataBean_Screen_Report();
                HeaderScreen_Report r_p = new HeaderScreen_Report();
                objscreen = r_p.Fn_Report(objscreen, request.getParameter("submenu_id"));
                objr_p = r_p.Fn_Report(objr_p, "S502");
                path = objr_p.getPath();
                lookup = objr_p.getLookup();
                doc_eff_date = objr_p.getDoc_eff_date();
                doc_no = objr_p.getDoc_no();

                String inputSQL = " select count(*) as num from vd_rawmatt_withdraw_header where complete_flag <> 'Y'   ";
                int record_count1 = objuti.numRowdatabase(inputSQL);

                DataBean_Display_Document_Status obj_record = new DataBean_Display_Document_Status();
                Display_Document_Status r_c = new Display_Document_Status();
                obj_record = r_c.Fn_Doc_ID_Last(obj_record, "select doc_id as doc_id_last from vd_rawmatt_withdraw_header where delete_flag = 'N' order by runno desc limit 1 ");
                doc_id_last = obj_record.getDoc_id_last();

                //_______________________________________________________________report
            %>
            <input name="username" type="hidden" id="username" value="<%=userbean.getUsername()%>" size="30" readonly/>
            <input type="hidden" id="chkNull" value="doc_id,doc_date,doc_time,runner_id,p_type">
            <input type="hidden" id="date_ck" name="date_ck" value="">
            <input type="hidden" id="status_a" value="1"><!-- เป็นการเพิ่มข้อมูลเข้าไป-->
            <input type="hidden" id="status_d" value="3"><!-- เป็นการ Delete ข้อมูลทั้งหมด -->
            <input type="hidden" id="status_cancle" value=""><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
            <input type="hidden" id="child_ck" name="child_ck" value="">
            <!---------------------------------------------------report----------------------------->
            <input type="hidden" id="report_code" name="report_code"  value="<%=path%>">
            <input type="hidden" id="type_report" name="type_report" value="2">
            <input type="hidden" id="lookup" name="lookup" value="<%=lookup%>">
            <input type="hidden" id="doc_eff_date" name="doc_eff_date" value="<%=doc_eff_date%>">
            <input type="hidden" id="doc_no" name="doc_no" value="<%=doc_no%>">
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

                                <tr>
                                    <td class="columnlabel1">เอกสารที่ยังไม่อนุมัติ</td>
                                    <td class="columnobject">&nbsp;&nbsp;
                                        <input name='record_count1' type='button' class="cgcButton_22" id="record_count1" value='<%=record_count1%>'onclick="Record_Count();"/>
                                        &nbsp;&nbsp;<b>รายการ&nbsp;&nbsp;เลขที่เอกสารล่าสุด</b>&nbsp;&nbsp;<input name='doc_id_last' type='button' class="cgcButton_21" id="doc_id_last" value='<%=doc_id_last%>'onclick="Last_Doc_id();"/>                                        
                                    </td>                                    
                                </tr>             
                                <tr>       
                                    <td class="columnlabel1"><b>เลขที่เอกสารอัตโนมัติ</b>&nbsp;:&nbsp;</td>
                                    <td class="columnobject">
                                        <input name="runner" data-toggle="tooltip" title="เลือกวันที่เอกสารและกดปุ่มนี้เพื่อสร้างเลขที่เอกสารอัตโนมัติ" id="runner" class="cgcButton_9" type="button" value="กดสร้างเลขที่เอกสาร" onclick="Runing_Doc_id();">                                        	
                                    </td>
                                </tr>                                            
                                <tr>
                                    <td class="columnlabel1"><strong>เลขที่เอกสาร*</strong>&nbsp;:&nbsp;</td>
                                    <td class="columnobject">
                                        <input name='doc_id' class='inputs' type='text' class="inputs" id="doc_id" value='' size='10' readonly="true" />
                                        &nbsp;<a href='#' onClick="OpenDoc_id(1)" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;วันที่เอกสาร*&nbsp;:&nbsp;
                                        <input name='doc_date' class='inputs' type='text' class="inputs" id="doc_date" value='' size='10' readonly="readonly" />
                                        &nbsp;<a id='date_1' ><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'doc_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>
                                        &nbsp;&nbsp;เวลา*&nbsp;:&nbsp;
                                        <input name='doc_time' class='inputs' type='text' class="inputs" id="doc_time" value='' size='10' maxlength="5" onKeyUp="IsNumeric(this.value, this)"/>                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1"><strong>เอกสารที่อนุมัติแล้ว</strong>&nbsp;:&nbsp;</td>
                                    <td class="columnobject">                                
                                        &nbsp;<a href='#' onClick="OpenDoc_id(2)" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>                                
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">คลังจ่าย&nbsp;:&nbsp;</td>
                                    <td class="columnobject">
                                        <input type="hidden" size="10" id="wh_in" name="wh_in" value="<%=objs_p.getWarehouse_begin_id()%>" ><input class='inputs' type='text' class="inputs" size="20"  id="wh_in_desc" name="wh_in_desc" value="<%=objs_p.getWarehouse_begin_name()%>">
                                        <a href='#' onClick="openBrWindow('Wh_bg&stadment=and+wh_type+=+\'R\'', 23, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>
                                        &nbsp;&nbsp;&nbsp;คลังรับ&nbsp;:&nbsp;
                                        <input type="hidden" size="10"  id="wh_out" name="wh_out" value="<%=objs_p.getWarehouse_end_id()%>"><input class='inputs' type='text' class="inputs"  size="20"  id="wh_out_desc" name="wh_out_desc" value="<%=objs_p.getWarehouse_end_name()%>">
                                        <a href='#' onClick="openBrWindow('Wh_en&stadment=and+wh_type+=+\'R\'', 23, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">ผู้เบิก&nbsp;:&nbsp;</td>
                                    <td class="columnobject">
                                        <input class='inputs' type='text' class="inputs" id="runner_id" name='runner_id' size='10' value='' readonly="readonly"/>&nbsp;&nbsp;
                                        <!--a href='#' onClick="javascript:openBrWindow('Vemployee&stadment=and+emp_id+between+\'0001\'+and+\'0008\'', 23, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;&nbsp;<input class='inputs' type='text' class="inputs" name='runner_id_desc' id="runner_id_desc" size='30' value='' readonly="readonly"/-->
                                        <a href='#' onClick="javascript:openBrWindow('Vemployee&stadment=and+dept_id+=+\'09\'', 23, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;&nbsp;<input class='inputs' type='text' class="inputs" name='runner_id_desc' id="runner_id_desc" size='30' value='' readonly="readonly"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="columnlabel1">ประเภท*&nbsp;:&nbsp;</td>
                                    <td colspan="3" class="columnobject">                                    
                                        <%=objuti.ShowSelectBox("select product_id,name_t from mproduct where pgroup_id = 'RAW' order by runno", "product_id", "name_t", "p_type")%>                                </td>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">หมายเหตุ&nbsp;:&nbsp;</td>
                                    <td class="columnobject"><textarea class="text_inputs" name='remark' cols='40' rows='5' id="remark"></textarea></td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <div style="width:100%;">
                                            <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                                <tr>
                                                    <td colspan="3" class="h_multi"></td>
                                                    <td colspan="8" class="btn_multi" align="center">
                                                        <input type='button' class="cgcButton_4" name='but1' value='  เพิ่ม  ' onClick="javascript:goAddChild(URLsend('doc_id,wh_in,username,status_a', 'CS_024.jsp'));"/>
                                                        <input type='button' class="cgcButton_3" name='but2' value='   ลบ  ' onclick='javascript:goDelChild();'/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="headergrid" colspan="8">ข้อมูลการเบิก</td>
                                                </tr>                                                   
                                                <tr>
                                                    <td class="row3" width="3px"><input type="checkbox" id="chk_all" name="chk_all" value="chk_all" onClick="javascript:ckall(this.checked);"/></td>
                                                    <td class="row3" width="7%">ลำดับที่  </td>
                                                    <td class="row3" width="15%">ถ่าน </td>
                                                    <td class="row3" width="15%">เลขกอง </td>
                                                    <td class="row3" width="15%">ชื่อลูกค้า </td>
                                                    <td class="row3" width="15%">ทะเบียนรถ </td>
                                                    <td class="row3" width="15%">จำนวนกระสอบ &nbsp;</td>
                                                    <td class="row3" width="15%">น้ำหนัก(Kg) </td>
                                                </tr>

                                            </table>
                                        </div>
                                        <div style="width:100%; height: 150px; overflow: auto;" id="show">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace'>
                                        <br>
                                        <div align="center">
                                            <a href="javascript:;" onClick="cancle()"><img alt="ยกเลิก"  class="imgtransparent" src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="AddHeader()"><img alt="บันทึก"  class="imgtransparent" src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="Delete()"><img alt="ลบ" class="imgtransparent" src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;"  onclick="Chknull()"><img alt="พิมพ์เอกสาร" class="imgtransparent" src="../IMAGES/BTN_PRINT_90.png" width="80" height="30" border="0"></a></div>
                                        <br>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
