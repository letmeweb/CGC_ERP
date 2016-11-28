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
    <%@page import="java.text.DecimalFormat" %>
    <%@page import="java.sql.Date"%>    
    <%@page import="java.io.*"%>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">            
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
        <title>Morris.js Donut Chart Example</title>
    </head>
    <body onLoad="drawChart()">
        <div id="donut-example"></div>
    </body>

    <script>
        function drawChart() {
            var jsonData = $.getJSON("D:/CGC_FILE/json_data.json", function(json) {
                console.log(json); // show the info in console
            });
            Morris.Donut({
                element: 'donut-example',
                data: jsonData
            });
        }
    </script>
</html>

