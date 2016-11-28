<%@page import="com.cgc.bean.DataBeanD_packing_product_detail"%>
<%@page import="com.cgc.DB.D_packing_product_detailDAO"%>
<%@page import="com.cgc.Util.ThaiUtil"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <title></title>
        <script type="text/javascript" src="../JS/myAjaxFramework.js"></script>
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
            function goAdd() {
                var arrayChk = new Array;
                arrayChk[0] = "chkNull";
                if (ChkParameter_1(arrayChk))
                {
                    getSave_1(URLsend('doc_id,wh_id,product_id,place_prd,palate_no,size,i2,bag,weight,remark,status_a,username,product_no,fraction_bag,doc_type,pack_repacking_status', '../JSP/CS_041.jsp'));
                    showTable("show", "doc_id", "../JSP/CS_Show041.jsp?doc_id=");
                    setTimeout('showTable("show","doc_id","../JSP/CS_Show041.jsp?doc_id=")', 800);
                    setTimeout('window.close()', 1000);
                }
            }
            function goEdit()
            {

                var arrayChk = new Array;
                arrayChk[0] = "chkNull";
                if (ChkParameter_1(arrayChk))
                {
                    getSave_1(URLsend('doc_id,line_no,wh_id,product_id,place_prd,palate_no,size,i2,bag,weight,remark,status_u,username,product_no,fraction_bag,doc_type,pack_repacking_status', '../JSP/CS_041.jsp'));
                    showTable("show", "doc_id", "../JSP/CS_Show041.jsp?doc_id=");
                    setTimeout('showTable("show","doc_id","../JSP/CS_Show041.jsp?doc_id=")', 800);
                    setTimeout('window.close()', 1000);
                }
            }
            function goBack()
            {
                window.close();
            }
            function  CalEdit(total_cal, weightedit, weightnew)
            {
                var cal;
                cal = total_cal - weightedit;
                cal = cal + parseInt(getId(weightnew).value, 10);
                return cal;
            }

            function select() {
                select_value();
                getId("pack_repacking_status").checked = (getId("pack_repacking_status").value === "Y") ? true : false;
            }

            function Chk_insert_value(checkbox_name) {
                if (getId(checkbox_name).checked) {
                    getId(checkbox_name).value = "Y";
                    //getId(text_name).disabled = false;
                } else {
                    getId(checkbox_name).value = "N";
                    //getId(text_name).disabled = true;
                    //getId(text_name).value = "";
                }
            }

        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/component.css" rel="stylesheet" type="text/css">        
    </head>
    <%!    ThaiUtil en = new ThaiUtil();
        D_packing_product_detailDAO objDAO = new D_packing_product_detailDAO();
        DataBeanD_packing_product_detail objBean = new DataBeanD_packing_product_detail();
        String doc_id, doc_type, line_no, status_a, status_u, wh_id, product_id, place_prd, palate_no, size, i2, bag, weight, remark, total_bag_withdraw, total_weight_withdraw, wh_id_desc, product_id_desc, product_no, fraction_bag, place_prd_desc, size_desc, pack_repacking_status;
    %>
    <%
        doc_id = "";
        doc_type = "";
        line_no = "";
        status_a = "";
        status_u = "";
        wh_id = "";
        product_id = "";
        place_prd = "";
        palate_no = "";
        size = "";
        bag = "";
        i2 = "0";
        weight = "";
        remark = "";
        total_bag_withdraw = "";
        total_weight_withdraw = "";
        wh_id_desc = "";
        product_id_desc = "";
        product_no = "";
        fraction_bag = "";
        place_prd_desc = "";
        size_desc = "";
        pack_repacking_status = "";
        if (request.getQueryString().indexOf("line_no_") != -1) {
            line_no = request.getQueryString().substring(8, request.getQueryString().indexOf("="));
            doc_id = en.EncodeTexttoTIS(request.getParameter("doc_id"));
            objBean = objDAO.ReturnEdit(doc_id, line_no, objBean);
            wh_id = objBean.getWh_id();
            doc_type = objBean.getDoc_type();
            product_id = objBean.getProduct_id();
            place_prd = objBean.getPlace_prd();
            palate_no = objBean.getPalate_no();
            size = objBean.getSize();
            bag = objBean.getBag();
            i2 = objBean.getI2();
            weight = objBean.getWeight();
            remark = objBean.getRemark();
            total_bag_withdraw = request.getParameter("total_bag_withdraw");
            total_weight_withdraw = request.getParameter("total_weight_withdraw");
            wh_id_desc = objBean.getWh_name();
            product_no = objBean.getProduct_no();
            fraction_bag = objBean.getFraction_bag();
            place_prd_desc = objBean.getPlace_prd_name();
            size_desc = objBean.getSize_name();
            pack_repacking_status = objBean.getPack_repacking_status();
            status_u = "2";
        } else {
            doc_id = en.EncodeTexttoTIS(request.getParameter("doc_id"));
            status_a = request.getParameter("status_a");
            total_bag_withdraw = request.getParameter("total_bag_withdraw");
            total_weight_withdraw = request.getParameter("total_weight_withdraw");
        }
    %>
    <body onload="select()">
        <input name="username" type="hidden" id="username" value="<%=request.getParameter("username")%>" size="30" readonly/>
        <input type="hidden" id="doc_id" value="<%=doc_id%>">        
        <input type="hidden" id="line_no" value="<%=line_no%>">
        <input type="hidden" id="status_a" value="<%=status_a%>">
        <input type="hidden" id="status_u" value="<%=status_u%>">
        <input type="hidden" id="total_wightcal" value="<%=total_weight_withdraw%>">
        <input type="hidden" id="bag_weightcal" value="<%=total_bag_withdraw%>">
        <input type="hidden" id="weightedit" value="<%=weight%>">
        <input type="hidden" id="bagedit" value="<%=bag%>">
        <input type="hidden" id="chkNull" value="wh_id,product_id,place_prd,palate_no,size,bag,weight,doc_type">
        <!--input type="hidden" id="chkNull" value="wh_id,product_id"-->
        <br>
        <div align="left">

            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading"> <span class="glyphicon glyphicon-tasks"></span>&nbsp;
                        <b>ถ่านเบิก</b>
                    </div>                        
                    <div class="panel-footer">           

                        <table  cellpadding="0" cellspacing="0" >
                            <tr> 
                                <td colspan="2"  class="blankspace"></td>
                            </tr>

                            <tr>
                                <td class="columnlabel1">ประเภทรายการ*&nbsp;:&nbsp;</td>
                                <td class="columnobject">
                                    <input class="inputs" name='doc_type' type='doc_type' id="doc_type" value='<%=doc_type%>' size='10' readonly/>
                                    <a href='#' onClick="javascript:openBrWindow('M_doc_type', 41, 'Search_Config2.jsp')">
                                        <img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' >
                                    </a>
                                    + = ถ่านของใหม่มาแพ๊ค , - = ก่านของเก่ามาแพ๊ค
                                    <input type='hidden' name='doc_type_sign' size='10' value='<%=doc_type%>' id="doc_type_sign" readonly/></td>
                                </td>
                            </tr>   

                            <tr>
                                <td class="columnlabel1">รหัสคลัง*&nbsp;:&nbsp;</td>
                                <td class="columnobject">
                                    <input name='wh_id' type='text' class="inputs" id="wh_id" value='<%=wh_id%>' size='10' readonly/>
                                    <a href='#' onClick="javascript:openBrWindow('Mwarehouse', 41, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;<input name='wh_id_desc' type='text' class="inputs" id="wh_id_desc" value='<%=wh_id_desc%>' size='30' readonly/>	          	</td>
                            </tr>   

                            <tr>
                                <td class="columnlabel1">เบิก Pack เกินของเก่าเอามาใช้&nbsp;:&nbsp;</td>
                                <td class="columnobject">
                                    <div class="checkbox checkbox-primary">
                                        <input type="checkbox" id="pack_repacking_status" name="pack_repacking_status" value="<%=pack_repacking_status%>" onClick="Chk_insert_value(this.name)">
                                        <label for="pack_repacking_status"></label> 
                                    </div>
                                </td>
                            </tr>                                      

                            <tr>
                                <td class="columnlabel1">รหัสผลิต*&nbsp;:&nbsp;</td>
                                <td class="columnobject"><input name="product_no" type='text' class="inputs" id="product_no" size="10" value="<%=product_no%>"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">รหัสถ่าน*&nbsp;:&nbsp;</td>
                                <td class="columnobject">
                                    <select class="select_cgc" name="product_id_select" id="product_id_select" onclick="click_value()">
                                        <option value="C" selected>ถ่านกะลา</option>                                        
                                        <option value="P">ถ่านปาล์ม</option>
                                        <option value="U">ถ่านไม้ยูคาฯ</option>
                                        <option value="K">ถ่านไม้ยูโกงกาง</option>
                                        <option value="A">ถ่านหิน</option>
                                        <option value="D">ฝุ่น</option>
                                    </select> 
                                    <input type='text' class="inputs" name='product_id' size='10' value='<%=product_id%>' id="product_id" /></td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">แหล่งผลิต*&nbsp;:&nbsp;</td>
                                <td class="columnobject">
                                    <input name='place_prd' type='text' class="inputs" id="place_prd" value='<%=place_prd%>' size='10' readonly/>&nbsp;<a href='#' onClick="javascript:openBrWindow('mproduction_place', 41, 'Search_Config2.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE2' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                    <input name="place_prd_desc" type='text' class="inputs" id="place_prd_desc" size="30" value="<%=place_prd_desc%>" readonly></td>
                            </tr>

                            <tr>
                                <td class="columnlabel1">พาเลทที่/ถุงที่*&nbsp;:&nbsp;</td>
                                <td class="columnobject">
                                    <input name='palate_no' type='text' class="inputs" id="palate_no" value='<%=palate_no%>' size='10' />	          	</td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">ขนาด*&nbsp;</td>
                                <td class="columnobject">
                                    <input name='size' type='text' class="inputs" id="size" value='<%=size%>' size='10' readonly/>	<a href='#' onClick="javascript:openBrWindow('m_carbon_size', 41, 'Search_Config_Integer.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE2' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                    <input name="size_desc" type='text' class="inputs" id="size_desc" size="30" value ="<%=size_desc%>" readonly>          	</td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">I2&nbsp;:&nbsp;</td>
                                <td class="columnobject">
                                    <input name='i2' type='text' class="inputs" id="i2" value='<%=i2%>' size='10' onclick="openBrWindow('m_iodine&stadment=and+iod_ctype+=+\'' + getId('product_id_select').value + '\'&textinput=i2', 0, 'Search_Detail.jsp')" readonly/>	          	</td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">จำนวนถุง*&nbsp;:&nbsp;</td>
                                <td class="columnobject"><input name='bag' type='text' class="inputs" id="bag" value='<%=bag%>' size='10' onblur="IsNuber(this.value, this)"/></td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">เศษถุง&nbsp;:&nbsp;</td>
                                <td class="columnobject">
                                    <input name="fraction_bag" type='text' class="inputs" id="fraction_bag" size="10" value="<%=fraction_bag%>" onblur="IsNuber(this.value, this)">&nbsp;(กิโลกรัม)
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">น้ำหนัก*&nbsp;:&nbsp;</td>
                                <td class="columnobject">
                                    <input name='weight' type='text' class="inputs" id="weight" value='<%=weight%>' size='10' onblur="IsNuber(this.value, this)"/>&nbsp;(กิโลกรัม)                                    
                                </td>
                            </tr>                            
                            <tr>
                                <td class="columnlabel1">หมายเหตุ&nbsp;:&nbsp;</td>
                                <td class="columnobject">
                                    <textarea class="text_inputs" name='remark' cols='40' rows='5' id="remark"><%=remark%></textarea>	          	
                                </td>
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
                                    <input type="button" class="cgcButton_5" name="button2" value="ยกเลิก" onClick="javascript:goBack();"/>      		  	
                                </td>
                            </tr>

                            <tr>
                                <td colspan='2' class='blankspace'>      		  	</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>