/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cgc.report;

import com.cgc.DB.DBConnect;
import com.cgc.Util.PeriodDate;
import com.cgc.Util.UtiDatabase;
import com.cgc.bean.DataBean_MData_export;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;

/**
 *
 * @author Beck
 */
public class PrintCSV_RAWMAT_BIGBAG {

    static DataBean_MData_export objMdata_export;
    UtiDatabase objuti;
    PeriodDate period = new PeriodDate();

    public void ExportCSV(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        String[] Return_param_value = new String[]{};
        String Str_Writer = "";
        String SQL = "", Str_Balance;
        int count = 1;
        String location_id = "1";
        String doc_type = "+";
        String iodine = "0";
        String date_from = request.getParameter("date_from");
        String date_to = request.getParameter("date_to");
        String wh_out = request.getParameter("wh_out");

        String Where1 = "";
        if (!wh_out.equals("-")) {

            Where1 = " and wh_out = '" + wh_out + "'";
        }

        String start_year = period.Start_Year("S");
        String end_year = period.End_Year("S");

        System.out.println("start_year = " + start_year);
        System.out.println("end_year = " + end_year);

        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        Return_Fill_MData_Export(request.getParameter("export_id"), con, rs);

        SQL = "select * "
                + " from vd_rawmatt_bigbag_withdraw_detail "
                + " where  to_date(format_date(doc_date),'YYYY-MM-DD')"
                + " between to_date(format_date('" + date_from + "'),'YYYY-MM-DD') AND to_date(format_date('" + date_to + "'),'YYYY-MM-DD') "
                + Where1
                + " order by pgroup_id desc ,product_id,to_date(format_date(doc_date),'YYYY-MM-DD'),wh_out desc ";

        Str_Balance = "การเบิกถ่านถุงใหญ่ : ";

        System.out.println(SQL);

        objuti = new UtiDatabase();
        response.setContentType("application/csv");
        java.util.Date date = new java.util.Date();
        System.out.println(new Timestamp(date.getTime()));
        response.setHeader("Content-Disposition", "inline; filename=\"filename.csv\"");

        //response.setHeader( "Content-Disposition", "attachment;filename=" + new Timestamp(date.getTime())+".csv\"" );
        response.setBufferSize(1024);
        //ServletOutputStream out = response.getOutputStream();
        try {

            rs = con.createStatement().executeQuery(SQL);
            PrintWriter pw = response.getWriter();
            pw.println("รายการเบิกถ่านถุงใหญ่");
            pw.println("ช่วงวันที่ " + date_from + " ถึง " + date_to + "\n");
            pw.println("รหัส-ชื่อถ่าน,วันที่,เบิกจากกองที่,เบิกไป,น้ำหนัก");
            while (rs.next()) {

                Str_Writer = rs.getString("prod_name") + ",";
                Str_Writer += rs.getString("doc_date") + ",";
                Str_Writer += rs.getString("location_id") + ",";
                Str_Writer += rs.getString("wh_out_desc") + ",";
                Str_Writer += rs.getString("weight") + ",";

                pw.println(Str_Writer);
                System.out.println("Str_Writer = " + Str_Writer);
                Str_Writer = null;
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace(System.out);
        } finally {
        }
    }

    private void Return_Fill_MData_Export(String export_id, Connection con, ResultSet rs) throws Exception {
        String SQL_export = "select * from mdata_export where export_id = '" + export_id + "' and delete_flag = 'N'";
        objMdata_export = new DataBean_MData_export();
        objuti = new UtiDatabase();
        try {
            rs = con.createStatement().executeQuery(SQL_export);
            while (rs.next()) {
                objMdata_export.setParam_value((rs.getString("param_value")));//จะได้ชื่อColoumภายในDataBaseเพื่อทำการดึงข้อมูลออกมา
                objMdata_export.setParam_name((rs.getString("param_name")));//จะทำการระบุชื่อหัวของColoum
                objMdata_export.setParam_from((rs.getString("param_from")));//จะเป็นช่องของ Doc_id
                objMdata_export.setParam_value_from((rs.getString("param_value_from")));//จะเป็นชื่อของ Doc_date
                objMdata_export.setLookup_name((rs.getString("lookup_name")));//ชื่อของTableที่จะExport
                objMdata_export.setStatus((rs.getString("status")));
                objMdata_export.setName_t((rs.getString("name_t")));//ชื่อของ Process นั้น
                objMdata_export.setOrder_by((rs.getString("order_by")));//เป็น Statement ในการเรียงลำดับข้อมูล
                objMdata_export.setComplete_flag((rs.getString("complete_flag")));
                objMdata_export.setDelete_flag((rs.getString("delete_flag")));
                objMdata_export.setRetro_flag((rs.getString("retro_flag")));
                objMdata_export.setCancel_flag((rs.getString("cancel_flag")));
                //objMdata_export.setParam_type((rs.getString("param_type")));//จะเป็นการระบุ flag ต่างๆๆ
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    private String[] String_sprit(String input) {
        return input.split(",");
    }
}
