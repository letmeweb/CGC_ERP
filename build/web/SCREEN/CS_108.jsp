
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cgc.DB.D_carbon_return_detailDAO"%>
<%@page import="com.cgc.bean.DataBeanD_carbon_return_detail"%>
<%@page import="com.cgc.Util.ThaiUtil"%>

<html>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <title></title>
        <script type="text/javascript" src="../JS/myAjaxFramework.js">

        </script>
        <script type="text/javascript">

            function goAdd()
            {
                //
                var arrayChk = new Array;
                arrayChk[0] = "chkNull";
                if (ChkParameter(arrayChk))
                {
                    getSave(URLsend('doc_id,prd_no,size,c_type,iod,comp_palate,late_no,machine,size_cont,bag,s_weight,weight,reason_ret,remark,status_a,username', '../JSP/CS_108.jsp'));
                    opener.getId("child_ck").value = "1";
                    opener.getId("doc_id").disabled = true;
                    //showTable("show","doc_id","../JSP/CS_Show108.jsp?doc_id=");
                    setTimeout('showTable("show","doc_id","../JSP/CS_Show108.jsp?doc_id=")', 1000);
                    setTimeout('window.close()', 1000);
                }
            }
            function goEdit()
            {
                var arrayChk = new Array;
                arrayChk[0] = "chkNull";
                if (ChkParameter(arrayChk))
                {
                    getSave(URLsend('doc_id,line_no,prd_no,size,c_type,iod,comp_palate,late_no,machine,size_cont,bag,s_weight,weight,reason_ret,remark,status_u,username', '../JSP/CS_108.jsp'));
                    opener.getId("doc_id").disabled = true;
                    //showTable("show","doc_id","../JSP/CS_Show108.jsp?doc_id=");
                    setTimeout('showTable("show","doc_id","../JSP/CS_Show108.jsp?doc_id=")', 1000);
                    setTimeout('window.close()', 1000);
                }
            }
            function goBack()
            {
                window.close();
            }

            function Checkvalue_document_confirm(objthis) {
                if (objthis.checked) {
                    objthis.value = "Y";
                    getId("prd_no").value = "STOCK-WH";
                    getId("prd_no_desc").value = "STOCK คลังสินค้า";
                } else {
                    objthis.value = "N";
                    getId("prd_no").value = "";
                    getId("prd_no_desc").value = "";
                }
                //alert(objthis.value);
            }

        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap-theme.min.css">
        <script src="../JS/jquery/jquery-2.1.4.js"></script>
        <script src="../JS/bootstrap/js/bootstrap.min.js"></script>     

        <script src="../JS/bootstrap_select/js/bootstrap-select.js"></script>        
        <link rel="stylesheet" href="../JS/bootstrap_select/css/bootstrap-select.css">        
        <link rel="stylesheet" href="../JS/bootstrap_select/css/bootstrap-select.min.css">        
        <link rel="stylesheet" href="../JS/bootstrap_select/css/bootstrap-theme.min.css">             

        <script src="../JS/angularjs/angular.min.js"></script>                

        <script src="../JS/alertify/alertify.min.js"></script>        
        <link rel="stylesheet" href="../CSS/alertify/alertify.core.css" />
        <link rel="stylesheet" href="../CSS/alertify/alertify.default.css" />          

        <link rel="stylesheet" href="../CSS/checkbox/awesome-bootstrap-checkbox.css"/> 
        <link rel="stylesheet" href="../FONTS/css/font-awesome.css" />        
        <link href="../CSS/component.css" rel="stylesheet" type="text/css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css"> 
    </head>
    <body>
        <%!            ThaiUtil en = new ThaiUtil();
            D_carbon_return_detailDAO objDAO = new D_carbon_return_detailDAO();
            DataBeanD_carbon_return_detail objBean = new DataBeanD_carbon_return_detail();
            String doc_id, line_no, status_a, status_u, prd_no, prd_no_desc, size, c_type, c_type_desc, iod, comp_palate, late_no, machine, size_cont, bag, s_weight, weight, reason_ret, remark;
        %>
        <%
            doc_id = "";
            line_no = "";
            status_a = "";
            status_u = "";
            prd_no = "";
            prd_no_desc = "";
            size = "";
            c_type = "";
            c_type_desc = "";
            iod = "";
            weight = "";
            comp_palate = "";
            late_no = "";
            machine = "";
            size_cont = "";
            bag = "";
            s_weight = "";
            weight = "";
            reason_ret = "";
            remark = "";
            if (request.getQueryString().indexOf("line_no_") != -1) {
                line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
                doc_id = en.EncodeTexttoTIS(request.getParameter("doc_id"));
                objBean = objDAO.ReturnEdit(doc_id, line_no, objBean);
                prd_no = objBean.getPrd_no();
                prd_no_desc = objBean.getPrd_no_desc();

                if (prd_no.equals("STOCK-WH")) {
                    prd_no_desc = "STOCK คลังสินค้า";
                } else {
                    prd_no_desc = objBean.getPrd_no_desc();
                }

                size = objBean.getSize();
                c_type = objBean.getC_type();
                c_type_desc = objBean.getC_type_desc();
                iod = objBean.getIod();
                comp_palate = objBean.getComp_palate();
                late_no = objBean.getLate_no();
                machine = objBean.getMachine();
                size_cont = objBean.getSize_cont();
                bag = objBean.getBag();
                s_weight = objBean.getS_weight();
                weight = objBean.getWeight();
                reason_ret = objBean.getReason_ret();
                remark = objBean.getRemark();
                status_u = "2";
            } else {
                doc_id = en.EncodeTexttoTIS(request.getParameter("doc_id"));
                status_a = request.getParameter("status_a");
            }
        %>
        <input name="username" type="hidden" id="username" value="<%=request.getParameter("username")%>" size="30" readonly/>
        <input type="hidden" id="doc_id" value="<%=doc_id%>">
        <input type="hidden" id="line_no" value="<%=line_no%>">
        <input type="hidden" id="status_a" value="<%=status_a%>">
        <input type="hidden" id="status_u" value="<%=status_u%>">
        <input type="hidden" id="chkNull" value="prd_no,size,c_type,iod,comp_palate,late_no,machine,size_cont,bag,s_weight,weight,reason_ret">
        <br>
        <div align="left">
            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading"> <span class="glyphicon glyphicon-tasks"></span>&nbsp;
                        <b>ข้อมูลคืนถ่านกัมมันต์ที่เหลือจากการผลิตเข้าคลังสินค้า</b>
                    </div>                        
                    <div class="panel-footer">                   
                        <div align="center">
                            <table  cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td colspan="2"  class="blankspace"></td>
                                </tr>

                                <tr>
                                    <td class="columnlabel1"><b>ใบแจ้งการผลิต STOCK</b>&nbsp;:&nbsp;</td>
                                    <td class="columnobject">                                
                                        <div class="checkbox checkbox-primary">
                                            <input type="checkbox" id="job_order_flag" name="job_order_flag" value="N" onClick="Checkvalue_document_confirm(this)">
                                            <label for="job_order_flag"></label> 
                                        </div>       
                                    </td>  
                                </tr>                                

                                <tr>
                                    <td class="columnlabel1">เลขที่ใบแจ้งผลิต*&nbsp;:&nbsp;</td>
                                    <td class="columnobject">
                                        <input type='text' class="inputs" name='prd_no' size='10' id="prd_no" readonly="readonly" value="<%=prd_no%>" />
                                        <a href='#'onclick="javascript:openBrWindow('Vd_job_order_header&stadment=and+complete_flag+<>+\'Y\'', 108, 'Search_Config2.jsp');" >
                                            <img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle'  ></a>
                                        <input type='text' class="inputs" name='prd_no_desc' size='30' id="prd_no_desc"  readonly="readonly" value="<%=prd_no_desc%>"/>                                
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" class="columnlabel1">ขนาด*&nbsp;:&nbsp;</td>
                                    <td class="columnobject"><input name="size" type='text' class="inputs" id="size" size="10" value="<%=size%>">
                                        <a onclick="openBrWindow('m_carbon_size&textinput=size', 32, 'Search_Detail.jsp');" href="#">
                                            <img align="middle" border="0" width="20" height="20" name="IMAGE3" alt="ค้นหา" src="../IMAGES/BUTTON/MAIN/SEARCH20.png">
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">ชนิดของถ่าน*&nbsp;:&nbsp;</td>
                                    <td class="columnobject"><input name="c_type" type='text' class="inputs" id="c_type" size="10" value="<%=c_type%>">
                                        <a href='#'onclick="javascript:openBrWindow('Mproduct_cat', 108, 'Search_Config2.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle'  ></a>
                                        <input type='text' class="inputs" name='c_type_desc' size='30' id="c_type_desc"  readonly="readonly" value="<%=c_type_desc%>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">ไอโอดีน*&nbsp;:&nbsp;</td>
                                    <td class="columnobject"><input name="iod" type='text' class="inputs" id="iod" size="20" value="<%=iod%>" readonly>
                                        <a href='#' onclick="openBrWindow('m_iodine&stadment=and+iod_ctype+=+\'' + getId('c_type').value + '\'&textinput=iod', 0, 'Search_Detail.jsp')">
                                            <img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle'  ></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">รหัสครบพาเลท/ครบถุง*&nbsp;:&nbsp;</td>
                                    <td class="columnobject"><input name="comp_palate" type='text' class="inputs" id="comp_palate" size="20" value="<%=comp_palate%>"></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">เลขที่/ถุงที่*&nbsp;:&nbsp;</td>
                                    <td class="columnobject"><input name="late_no" type='text' class="inputs" id="late_no" size="20" value="<%=late_no%>"></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">เครื่องผลิต*&nbsp;:&nbsp;</td>
                                    <td class="columnobject"><input name="machine" type='text' class="inputs" id="machine" size="20" value="<%=machine%>"></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">ขนาดบรรจุ*&nbsp;:&nbsp;</td>
                                    <td class="columnobject"><input name="size_cont" type='text' class="inputs" id="size_cont" size="20" value="<%=size_cont%>" onKeyUp="IsNuber(this.value, this)"></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">จำนวนคืน*&nbsp;:&nbsp;</td>
                                    <td class="columnobject">กระสอบ/ถุง*&nbsp;:&nbsp;
                                        <input name="bag" type='text' class="inputs" id="bag" size="10" value="<%=bag%>" onKeyUp="IsNuber(this.value, this)">
                                        &nbsp;&nbsp;น้ำหนักถุงเศษ*&nbsp;:&nbsp;
                                        <input name="s_weight" type='text' class="inputs" id="s_weight" size="10" value="<%=s_weight%>" onKeyUp="IsNuber(this.value, this)">
                                        &nbsp;&nbsp;น้ำหนักสุทธินำส่ง*&nbsp;:&nbsp;
                                        <input name="weight" type='text' class="inputs" id="weight" size="10" value="<%=weight%>" onKeyUp="IsNuber(this.value, this)">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">สาเหตุการคืน*&nbsp;:&nbsp;</td>
                                    <td class="columnobject">
                                        <input type='text' class="inputs" name='reason_ret' size='60' id="reason_ret" value="<%=reason_ret%>"/>                                </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">หมายเหตุ&nbsp;:&nbsp;</td>
                                    <td class="columnobject"><label>
                                            <textarea class="text_inputs" name="remark" id="remark" cols="45" rows="5"><%=remark%></textarea>
                                        </label></td>
                                </tr>

                                <tr>
                                    <td colspan='2'  align="right">
                                        <%
                                            if (request.getParameter("status_a") != null) {
                                        %>
                                        <input type="button" class="cgcButton_5" name="button1" value="ตกลง" onClick="javascript:goAdd();"/>&nbsp;&nbsp;
                                        <%} else {
                                        %>
                                        <input type="button" class="cgcButton_5" name="button1" value="แก้ไข" onClick="javascript:goEdit();"/>&nbsp;&nbsp;
                                        <%}
                                        %>

                                        <input type="button" class="cgcButton_5" name="button2" value="ยกเลิก" onClick="javascript:goBack();"/>                                </td>
                                </tr>

                                <tr>
                                    <td colspan='2' class='blankspace'>                                
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
