/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cgc.report;

import com.cgc.DB.DBConnect;
import com.cgc.Util.UtiDatabase;
import com.cgc.bean.DataBean_MData_export;
import java.io.IOException;
import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.sql.*;

/**
 *
 * @author Beck
 */
public class PrintCSV_RawMat_Summary_Month_EXPORT {

    static DataBean_MData_export objMdata_export;
    UtiDatabase objuti;

    public void ExportCSV(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        String Str_Writer, SQL;
        //DBConnect objcon = new DBConnect();
        //Connection con = objcon.openNewConnection();
        Connection con = new DBConnect().openNewConnection();
        ResultSet rs = null;
        objuti = new UtiDatabase();
        response.setContentType("application/csv");
        java.util.Date date = new java.util.Date();
        System.out.println(new Timestamp(date.getTime()));
        String FileName = date.toString();

        String rq_date_from = request.getParameter("date_from_format");
        String rq_date_to = request.getParameter("date_to_format");
        String cred_code = request.getParameter("cred_code");
        String data_for = request.getParameter("data_for");

        System.out.println("cred_code = " + cred_code);

        //response.setHeader("Content-Disposition", "inline; filename=\"filename.csv\"");
        response.setHeader("Content-disposition", "inline; filename=\"Excell_" + FileName + ".csv\"");

        response.setBufferSize(1024);
        try {

            if (data_for.equals("1")) {
                SQL = "select * from v_rawmatt_summary_month ";
            } else {
                SQL = "select * from v_rawmatt_summary_month ";
            }

            //SQL += "WHERE to_date(format_date(doc_date),'YYYY-MM-DD') BETWEEN to_date(format_date2('" + rq_date_from + "'),'YYYY-MM-DD') AND to_date(format_date2('" + rq_date_to + "'),'YYYY-MM-DD') ";

            //if (request.getParameter("cred_code") != null && !request.getParameter("cred_code").equals("")) {
                //SQL += SQL.indexOf("WHERE") != -1 ? " AND cred_code = '" + request.getParameter("cred_code") + "' " : " WHERE cred_code = '" + request.getParameter("cred_code") + "' ";
            //}

            //SQL += " order by to_date(format_date(doc_date),'YYYY-MM-DD')";

            System.out.println("SQL = " + SQL);
            rs = con.createStatement().executeQuery(SQL);
            try (PrintWriter pw = response.getWriter()) {
                pw.println("รายการสรุปการรับวัตถุดิบ");
                pw.println("ช่วงวันที่ " + objuti.Format_Date_For_Mysql(request.getParameter("date_from_format")) + " ถึง " + objuti.Format_Date_For_Mysql(request.getParameter("date_to_format")) + "\n");
                pw.println("ปี,เดือน,น้ำหนักรับเข้า,น้ำหนักสุทธิ\n");
                //Return_param_value = String_sprit(objMdata_export.getParam_value());
                int i = 6;
                while (rs.next()) {
                    Str_Writer = objuti.NotNull(rs.getString("ryear")) + ",";
                    Str_Writer += objuti.NotNull(rs.getString("rmonth")) + ",";
                    Str_Writer += objuti.NotNull(rs.getString("weight_receive")) + ",";
                    Str_Writer += objuti.NotNull(rs.getString("weight_total")) + ",";
                    //Str_Writer += "=K"+i+"*"+"L"+i;
                    //Str_Writer += System.getProperty("line.separator");
                    
                    pw.println(Str_Writer);
                    //System.out.println(Str_Writer);
                    //Str_Writer = null;
                    i++;
                }
            }

        } catch (IOException | SQLException e) {
            e.printStackTrace(System.out);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    /*
     private void Return_Fill_MData_Export(String export_id, Connection con, ResultSet rs) throws Exception {
     String SQL_export = "select * from mdata_export where export_id = '" + export_id + "' and delete_flag = 'N'";
     objMdata_export = new DataBean_MData_export();
     objuti = new UtiDatabase();
     try {
     rs = con.createStatement().executeQuery(SQL_export);
     while (rs.next()) {
     objMdata_export.setParam_value(objuti.NotNull(rs.getString("param_value")));//จะได้ชื่อColoumภายในDataBaseเพื่อทำการดึงข้อมูลออกมา
     objMdata_export.setParam_name(objuti.NotNull(rs.getString("param_name")));//จะทำการระบุชื่อหัวของColoum
     objMdata_export.setParam_from(objuti.NotNull(rs.getString("param_from")));//จะเป็นช่องของ Doc_id
     objMdata_export.setParam_value_from(objuti.NotNull(rs.getString("param_value_from")));//จะเป็นชื่อของ Doc_date
     objMdata_export.setLookup_name(objuti.NotNull(rs.getString("lookup_name")));//ชื่อของTableที่จะExport
     objMdata_export.setStatus(objuti.NotNull(rs.getString("status")));
     objMdata_export.setName_t(objuti.NotNull(rs.getString("name_t")));//ชื่อของ Process นั้น
     objMdata_export.setOrder_by(objuti.NotNull(rs.getString("order_by")));//เป็น Statement ในการเรียงลำดับข้อมูล
     objMdata_export.setComplete_flag(objuti.NotNull(rs.getString("complete_flag")));
     objMdata_export.setDelete_flag(objuti.NotNull(rs.getString("delete_flag")));
     objMdata_export.setRetro_flag(objuti.NotNull(rs.getString("retro_flag")));
     objMdata_export.setCancel_flag(objuti.NotNull(rs.getString("cancel_flag")));
     //objMdata_export.setParam_type(objuti.NotNull(rs.getString("param_type")));//จะเป็นการระบุ flag ต่างๆๆ
     }

     } catch (Exception e) {
     e.printStackTrace(System.out);
     }
     }

     private String[] String_sprit(String input) {
     return input.split(",");
     }
     * */
}
