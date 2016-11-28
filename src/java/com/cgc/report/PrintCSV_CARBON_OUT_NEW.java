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
import java.sql.Connection;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.SQLException;
import java.sql.Timestamp;

/**
 *
 * @author Beck
 */
public class PrintCSV_CARBON_OUT_NEW {

    static DataBean_MData_export objMdata_export;
    UtiDatabase objuti;

    public void ExportCSV(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        String[] Return_param_value = new String[]{};
        int count = 1;
        String SQL = "", Statement_where = "", rq_date_from, rq_date_to, Str_Writer = "";
        rq_date_from = request.getParameter("date_from_format");
        rq_date_to = request.getParameter("date_to_format");
        String doc_year = request.getParameter("doc_year");

        DBConnect objcon = new DBConnect();
        Connection con = objcon.openNewConnection();
        ResultSet rs = null;
        Return_Fill_MData_Export(request.getParameter("export_id"), con, rs);

        if (request.getParameter("export_id").equals("EXP009")) {
            SQL = " SELECT year,month,substring(machine_id from 4 for 1) as machine_id,size_name,wh_iodine_real,sum(to_number(weight,'999999999.99')) as sum_weight ";
            SQL += " FROM vd_carbon_send_product_detail_report ";
            SQL += " WHERE year = '" + doc_year + "' AND delete_flag <> 'Y' ";
            SQL += " and doc_type = 'PT' and size_name not like 'คาร์บอน%' and size_name <> '' " ;
            SQL += " GROUP BY year,month,machine_id,size_name,wh_iodine_real ";
            SQL += " ORDER BY year,month,machine_id,size_name,wh_iodine_real ";
            System.out.println(SQL);
        }

        System.out.println("Final = " + SQL);

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
            try (PrintWriter pw = response.getWriter()) {
                pw.println("รายการสรุปถ่านออกจากเตา");
                pw.println("ช่วงวันที่ " + objuti.Format_Date_For_Mysql(request.getParameter("date_from_format")) + " ถึง " + objuti.Format_Date_For_Mysql(request.getParameter("date_to_format")) + "\n");
                pw.println("ปี,เดือน,ขนาดถ่าน,ไอโอดีน,เตา,น้ำหนัก (กก.)\n");
                int i = 6;
                int row = 6;
                while (rs.next()) {
                    Str_Writer = objuti.NotNull(rs.getString("year")) + ",";
                    Str_Writer += objuti.NotNull(rs.getString("month")) + ",";
                    Str_Writer += objuti.NotNull(rs.getString("size_name")) + ",";
                    Str_Writer += objuti.NotNull(rs.getString("wh_iodine_real")) + ",";
                    Str_Writer += objuti.NotNull(rs.getString("machine_id")) + ",";
                    Str_Writer += objuti.NotNull(rs.getString("sum_weight")) + ",";
                    i++;
                    row++;
                    pw.println(Str_Writer);
                    Str_Writer = "\n";
                }

                System.out.println("Before Final Str_Writer = " + Str_Writer);
                Str_Writer += ",";
                Str_Writer += ",";
                Str_Writer += ",";
                Str_Writer += "ยอดถ่านออกจากเตารวม (กก.) ,";
                Str_Writer += ",";
                Str_Writer += "=SUM(F6..F" + (row - 1) + "),";
                //Str_Writer += Sum_Price_Total;
                pw.println(Str_Writer);

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

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    private String[] String_sprit(String input) {
        return input.split(",");
    }
}
