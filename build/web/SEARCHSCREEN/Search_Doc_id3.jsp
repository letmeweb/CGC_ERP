<%@page import="com.cgc.Util.SelectSearch_Doc_id" %>
<%@page import="com.cgc.Util.UtiDatabase"%>
<%@page import="com.cgc.DB.DBConnect"%>
<%@page import="javax.swing.JOptionPane"%>
<script type="text/javascript" src="../JS/myAjaxFramework.js"></script>
<%@ page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%@page import="java.sql.*"%>
<head>
    <script type="text/javascript">

    </script>
    <title></title>
    <!--<META Http-Equiv="Cache-Control" Content="no-cache">
    <META Http-Equiv="Pragma" Content="no-cache">-->
    <meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
    <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
    <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
    <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css"> <link href="../CSS/component.css" rel="stylesheet" type="text/css">

</head>
<%!    String stadment;
%>
<%
//JOptionPane.showConfirmDialog(null, stadment);
    if (request.getParameter("stadment") != null) {
        stadment = new String(request.getParameter("stadment").getBytes("ISO8859-1"), "TIS-620");
    } else {
        stadment = "";
    }


%>
<body>
    <form name="serForm" method="get" action="Search_Doc_id3.jsp">

        <input type="hidden" name="table" value="<%=request.getParameter("table")%>">
        <input type="hidden" name="page" value="<%=request.getParameter("page")%>">
        <input type="hidden" name="coloum" value="<%=request.getParameter("coloum")%>">
        <input type="hidden" name="stadment" value="<%=stadment%>">
        <%
            SelectSearch_Doc_id ss = new SelectSearch_Doc_id();
            int inputpage = Integer.parseInt(request.getParameter("page"));
            String inputtable = request.getParameter("table");
            String[] memcolom, memcoloumShow, memcoloumFill;
            String SQL, SQL2, Encode, strid, memURLShowdeatil, memID, memfillname;

        %>
        <div style="width: 600px;">
            <table width="64%" cellpadding="0"  cellspacing="0">
                <tr >
                    <td width="20" class="ftopleft"></td>
                    <td  class="ftopcenter" colspan="2">���Ң�����&nbsp;</td>
                    <td width="7" class="ftopright"></td>
                </tr>
                <tr >
                    <td class="fcenterleft"></td>
                    <td  colspan="2" class="fcentercenter">
                        <div style="width: 500px;" align="center">
                            <table width="550" cellpadding="0" cellspacing="0" border="0">
                                <!--tr>
                                    <td width="90"><input type="button" name="bt1" class="cgcButton_5" value="��͹��Ѻ" onClick="javascript:window.close();"/></td>
                                    <td width="46">����  : &nbsp;</td>
                                    <td width="199"><input type='text' class="inputs" name="searchid" value="" size="40"/></td>
                                    <td width="199">&nbsp;</td>
                                    <td width="16" colspan="2"></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>���� : &nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td><input type='text' class="inputs" name="searchtxt" value="" size="40"/></td>
                                    <td><input type="submit" class="cgcButton_6" id="submit" value="����"></td>
                                    <td colspan="2"></td>
                                </tr-->
                                <tr>
                                    <td width="46">����  : &nbsp;</td>
                                    <td width="199"><input type='text' class="inputs" name="searchid" id="searchid" value="" size="40"/></td>
                                </tr>
                                <tr>
                                    <td>���� : &nbsp;</td>
                                    <td><input type='text' class="inputs" name="searchtxt" id="searchtxt" value="" size="40"/></td>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>                                    
                                 <td><input type="button" class="cgcButton_5" name="bt1" value=" ��͹��Ѻ " onClick="javascript:window.close();"/></td>                                 
                                 <td><input type="submit" class="cgcButton_6" id="submit" value="����"></td>                             
                                </tr>                                      

                            </table>
                        </div>
                        <div style="width: 500px; height: 300px; overflow: auto;" align="center">
                            <table cellpadding="0" cellspacing="0" >
                                <tr>
                                    <%
                                        memcoloumFill = ss.SelectFillName(inputpage, inputtable);

                                        for (int i = 0; i < memcoloumFill.length; i++) {%>
                                    <td class="header2"><div align="left"><%= memcoloumFill[i]%></div></td>
                                    <%
                                        }
                                    %>
                                </tr>
                                <%
                                    //memtable = ss.SelectTable(inputtable);
                                    memcolom = ss.SelectColoum(inputpage, inputtable);
                                    memID = ss.SelectID(inputpage, inputtable);
                                    memcoloumShow = ss.SelectColoumShow(inputpage, inputtable);
                                    memURLShowdeatil = ss.SelectURLShowDetail(inputpage, inputtable);

                                    int start, screen;
                                    int row_page = 12;
                                    int total = 0;
                                    int count = 0;
                                    UtiDatabase objut = new UtiDatabase();
                                    DBConnect db = new DBConnect();
                                    Connection Conn = db.openNewConnection();
                                    if (request.getParameter("searchid") == null && request.getParameter("searchtxt") == null) {
                                        SQL = "Select Count(*) As num from  " + inputtable + " where delete_flag <> 'Y' " + stadment;
                                        total = objut.numRowdatabase(SQL);
                                    } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") != null) {
                                        strid = new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620");
                                        Encode = new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620");
                                        SQL = "Select Count(*) As num from  " + inputtable + " where delete_flag <> 'Y' and " + memcolom[0] + " like '%" + strid + "%' and " + memcolom[1] + " like '%" + Encode + "%' " + stadment;
                                        total = objut.numRowdatabase(SQL);
                                    } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") == null) {
                                        strid = new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620");
                                        SQL = "Select Count(*) As num from  " + inputtable + " where delete_flag <> 'Y' and " + memcolom[0] + " like '%" + strid + "%' " + stadment;
                                        total = objut.numRowdatabase(SQL);
                                    } else {
                                        Encode = new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620");
                                        SQL = "Select Count(*) As num from  " + inputtable + " where delete_flag <> 'Y' and " + memcolom[1] + " like '%" + Encode + "%' " + stadment;
                                        total = objut.numRowdatabase(SQL);
                                    }
                                    if (total == 0) {%>
                                <tr>
                                    <td  align="left"></td>
                                    <td  align="left">��辺��觷�����</td>
                                </tr></table>
                                <%}
                                    int total_page = (int) Math.ceil((double) total / (double) row_page);
                                    if (request.getParameter("screen") == null) {
                                        screen = 1;
                                    } else {
                                        screen = Integer.parseInt(request.getParameter("screen"));
                                    }
                                    if (screen >= 1 && screen <= total) {
                                        start = (screen - 1) * row_page;
                                        //row_page=row_page*screen;


                                %>
                                <%!ResultSet rs2;
                                    String getshowdata;%>
                                <%
                                    rs2 = null;
                                    try {
                                        String sql2;
                                        if (request.getParameter("searchid") == null && request.getParameter("searchtxt") == null) {

                                            sql2 = "select * from " + inputtable + " where delete_flag <> 'Y' " + stadment + "  order by to_number(doc_id,'999999') desc limit " + row_page + " offset " + start;
                                            rs2 = Conn.createStatement().executeQuery(sql2);
                                        } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") != null) {
                                            sql2 = "select * from " + inputtable + " where delete_flag <> 'Y' and " + memcolom[0] + " like '%" + new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620") + "%' and " + memcolom[1] + " like '%" + new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620") + "%' " + stadment + " order by to_number(doc_id,'999999') desc limit " + row_page + " offset " + start;
                                            rs2 = Conn.createStatement().executeQuery(sql2);
                                        } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") == null) {
                                            sql2 = "select * from " + inputtable + " where delete_flag <> 'Y' and " + memcolom[0] + " like '%" + new String(request.getParameter("searchid").getBytes("ISO8859-1"), "TIS-620") + "%' " + stadment + " order by to_number(doc_id,'999999') desc limit " + row_page + " offset " + start;
                                            rs2 = Conn.createStatement().executeQuery(sql2);
                                        } else {
                                            sql2 = "select * from " + inputtable + " where delete_flag <> 'Y' and " + memcolom[1] + " like '%" + new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620") + "%' " + stadment + " order by to_number(doc_id,'999999') desc limit " + row_page + " offset " + start;
                                            rs2 = Conn.createStatement().executeQuery(sql2);
                                        }
                                        while (rs2.next()) {

                                            count++;
                                            getshowdata = "";
                                            for (int i = 0; i < memcolom.length; i++) {

                                                if (i != (memcolom.length - 1)) {

                                                    getshowdata += rs2.getString(memcolom[i]) + "|";
                                                } else {

                                                    getshowdata += rs2.getString(memcolom[i]);

                                                }

                                                //JOptionPane.showConfirmDialog(null, getshowdata);
                                            }
                                %>
                            <tr>
                                <%
                                    if (request.getParameter("page").equals("36") || request.getParameter("page").equals("40") || request.getParameter("page").equals("32") || request.getParameter("page").equals("306") || request.getParameter("page").equals("322")) {
                                        for (int y = 0; y < memcoloumShow.length; y++) {
                                            if (y == 0) {


                                %>
                                <td  class="detailLeft"><a  href="#" onClick="gettoShow_Doc_id2('<%=objut.DecodeNewLine(getshowdata)%>', '<%=memID%>', '<%=memURLShowdeatil%>', 'show','show2', '<%=rs2.getString(memcolom[0])%>')" class="link_transparent"><%=rs2.getString(memcoloumShow[y])%></a></td>
                                <%
                                } else {

                                %>

                                <td  class="detailLeft"><%= rs2.getString(memcoloumShow[y])%></td>
                                <%
                                        }
                                    }
                                } else {
                                    for (int y = 0; y < memcoloumShow.length; y++) {
                                        if (y == 0) {


                                %>
                                <td  class="detailLeft"><a  href="#" onClick="gettoShow_Doc_id('<%=objut.DecodeNewLine(getshowdata)%>', '<%=memID%>', '<%=memURLShowdeatil%>', 'show', '<%=rs2.getString(memcolom[0])%>')" class="link_transparent"><%=rs2.getString(memcoloumShow[y])%></a></td>
                                <%
                                } else {

                                %>

                                <td  class="detailLeft"><%= rs2.getString(memcoloumShow[y])%></td>
                                <%
                                            }
                                        }


                                    }

                                %>
                            </tr>
                            <%	}

                            %>
            </table>
        </div >
        <div align="center">
            <%
                if (screen > 1) {
                    if (request.getParameter("searchid") == null && request.getParameter("searchtxt") == null) {%>
            <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=screen - 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&stadment=<%=stadment%>" class="link_transparent">��͹��Ѻ</a>
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") != null) {%>
            <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=screen - 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>" class="link_transparent">��͹��Ѻ</a>
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") == null) {%>
            <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=screen - 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&stadment=<%=stadment%>" class="link_transparent">��͹��Ѻ</a>
            <%
            } else {%>
            <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=screen - 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>" class="link_transparent">��͹��Ѻ</a>
            <%
                    }
                }
                if ((screen % 10) != 0 && screen <= 10) {
                    for (int i = 1; i <= 10 && i <= total_page; i++) {

                        if (i == screen) {
            %>
            <%="<b><font color='blue'>[" + i + "]</font></b>"%>
            <%
            } else {
                if (request.getParameter("searchid") == null && request.getParameter("searchtxt") == null) {%>
            | <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=i%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&stadment=<%=stadment%>" class="link_transparent"><%=i%></a> |
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") != null) {%>
            | <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=i%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>" class="link_transparent"><%=i%></a> |
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") == null) {%>
            | <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=i%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&stadment=<%=stadment%>" class="link_transparent"><%=i%></a> |
            <%
            } else {%>
            | <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=i%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>" class="link_transparent"><%=i%></a> |
            <%
                        }
                    }

                }
            } else {
                for (int y = (screen - 5); y <= (screen + 5) && y <= total_page; y++) {
                    if (y == screen) {
            %>
            <%="<b><font color='blue'>[" + y + "]</font></b>"%>
            <%
            } else {
                if (request.getParameter("searchid") == null && request.getParameter("searchtxt") == null) {%>
            | <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=y%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&stadment=<%=stadment%>" class="link_transparent"><%=y%></a> |
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") != null) {%>
            | <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=y%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>" class="link_transparent"><%=y%></a> |
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") == null) {%>
            | <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=y%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&stadment=<%=stadment%>" class="link_transparent"><%=y%></a> |
            <%
            } else {%>
            | <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=y%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>" class="link_transparent"><%=y%></a> |
            <%
                            }
                        }
                    }
                }
                if (screen < total_page) {
                    if (request.getParameter("searchid") == null && request.getParameter("searchtxt") == null) {%>
            <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=screen + 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&stadment=<%=stadment%>" class="link_transparent">仢�ҧ˹��</a>
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") != null) {%>
            <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=screen + 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>" class="link_transparent">仢�ҧ˹��</a>
            <%
            } else if (request.getParameter("searchid") != null && request.getParameter("searchtxt") == null) {%>
            <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=screen + 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchid=<%=request.getParameter("searchid")%>&stadment=<%=stadment%>" class="link_transparent">仢�ҧ˹��</a>
            <%
            } else {%>
            <a href="../SEARCHSCREEN/Search_Doc_id3.jsp?screen=<%=screen + 1%>&page=<%=request.getParameter("page")%>&table=<%=request.getParameter("table")%>&searchtxt=<%=new String(request.getParameter("searchtxt").getBytes("ISO8859-1"), "TIS-620")%>&stadment=<%=stadment%>" class="link_transparent">仢�ҧ˹��</a>
            <%
                            }
                        } else {
                            ;

                        }
                    } catch (Exception e) {
                        e.printStackTrace(System.out);
                    } finally {
                        if (rs2 != null) //JOptionPane.showConfirmDialog(null, "close rs");
                        {
                            rs2.close();
                        }
                        if (Conn != null) //JOptionPane.showConfirmDialog(null, "close con");
                        {
                            Conn.close();
                        }
                    }


                }
            %>
        </div></td>
    <td class="fcenterright"></td>
</tr>
<tr bordercolor="0069B3" style="height: 5px">
    <td width="20" class="ffootleft"></td>
    <td  class="ffootcenter" colspan="2" ></td>
    <td width="7" class="ffootright"></td>
</tr>
</table>
</div>
</form>
</body>
