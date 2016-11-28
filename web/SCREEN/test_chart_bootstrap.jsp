<html>
    <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.sql.Statement" %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.*" %>
    <%@page import="com.cgc.Util.Serchselect" %>
    <%@page import="com.cgc.Util.UtiDatabase"%>
    <%@page import="com.cgc.DB.DBConnect"%>
    <%@page import="com.cgc.DB.Get_Data_Stock"%>    
    <%@page import="java.text.DecimalFormat" %>
    <%@page import="java.sql.Date"%>    
    <%@page import="java.io.*"%>

    <%!    String data;
    %>    

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    <script language="javascript" src="../JS/myAjaxFramework.js"></script>
    <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
    <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
    <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">
    <link href="../CSS/cgc_table.css" rel="stylesheet" type="text/css">                     
    <link href="../CSS/component.css" rel="stylesheet" type="text/css">            

    <script>
        var data_rec = "";
        function Get_Data() {
            data_rec = "";
            AjaxRun_id("data", "../JSP/CS_Get_Data_Stock.jsp?runer_id=2");
        }

        function Get_Value(offset) {
            var ret = [];
            ret = document.getElementById("data").value;
            alert(ret);
            return ret;
        }

        function Gen_Graph() {
            //var data_rec1 = " [" + document.getElementById("data") + "], ";                        
            //data_rec = [{pgroup_name: 'WIP', weight_total: 2930161.00}, {pgroup_name: 'FG', weight_total: 602466.00}, {pgroup_name: 'WIP-FC', weight_total: 40829.00}, {pgroup_name: 'RAW', weight_total: 50692.60}, {pgroup_name: 'IMP', weight_total: 41860.00}];
            //alert(data_rec);

            Morris.Bar({
                element: 'graph',
                //data: [{pgroup_name: 'WIP', weight_total: 2930161.00}, {pgroup_name: 'FG', weight_total: 602466.00}, {pgroup_name: 'WIP-FC', weight_total: 40829.00}, {pgroup_name: 'RAW', weight_total: 50692.60}, {pgroup_name: 'IMP', weight_total: 41860.00}],
                data: Get_Value(0),
                xkey: 'pgroup_name',
                ykeys: ['weight_total'],
                labels: ['weight_total']
            }).on('click', function(i, row) {
                console.log(i, row);
            });

        }

    </script>    

    <body onLoad="Get_Data();">

        <div id="graph" style="height: 250px;"></div>
        <input name='data' type='hidden' id="data" value='<%=data%>'/>
        <input type="button" class="cgcButton_11" name="myBut" value=" Process " onclick="Gen_Graph()"/>

    </body>
</html>
