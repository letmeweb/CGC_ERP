/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cgc.report;

import com.cgc.bean.Print_Chart_Stock_Bean;
import com.cgc.DB.DBConnect;
import com.cgc.Util.UtiDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DecimalFormat;

/**
 *
 * @author Beckpalmx No7
 */
public class Print_Chart_Stock {

    public String ShowDetail(String month_id, String price_year, String location_id) throws Exception {
        Print_Chart_Stock_Bean objbean = new Print_Chart_Stock_Bean();
        StringBuilder Return_String = new StringBuilder();
        Connection con = new DBConnect().openNewConnection();
        PreparedStatement p = null;
        UtiDatabase objuti = new UtiDatabase();
        ResultSet rs;
        int count_line = 1;
        double zero = 0;
        String Cond0, Cond1 ;
        DecimalFormat df = new DecimalFormat("#,###,##0.00");

        String SQL_Del = "delete from tmp_rawmatt_summary_bigbag ; ALTER SEQUENCE seq_tmp_rawmatt_summary_bigbag RESTART WITH 1;";

        System.out.println("param 1 " + price_year);
        System.out.println("param 2 " + month_id);
        System.out.println("param 3 " + location_id);

        String Str = location_id;

        String[] Str_Cond = new String[2];
        int i = 0;
        for (String retval : Str.split("\\?", 2)) {
            Str_Cond[i] = retval;
            System.out.println("value = " + i + " : " + Str_Cond[i]);

            if (!(Str_Cond[0].equals("-"))) {
                Cond1 = " and location_id = '" + Str_Cond[0] + "' ";
            } else {
                Cond1 = " and location_id like '%' ";
            }

            System.out.println("loop " + i + " Cond1 = " + Cond1);

            i++;
        }

        //String condition = Cond0 + Cond1 + " and (process_id = 'PR_025' or process_id = 'PR_057') ";
        String condition = "";

        try {

            if (month_id.equals("") && price_year.equals("")) {
                Cond0 = "Where month like '%' and year like '%' ";
            } else {
                Cond0 = "Where (month = '" + month_id + "') and year = '" + price_year + "' ";

            }

            String prev_month;

            if (Integer.parseInt(month_id) > 1) {
                prev_month = String.format("%02d", Integer.parseInt(month_id) - 1);
            } else {
                prev_month = month_id;
            }

            String SQL = " SELECT "
                    + " pgroup_id,sum(weight_total) as sum_weight_total "
                    + " FROM vt_transaction_stock_process_report "
                    + Cond0
                    + " GROUP BY pgroup_id,pgroup_name ";

            System.out.println("SQL = " + SQL);

            Return_String.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner3'>\n");
            Return_String.append(("<td class=\"headergrid\" width=\"100%\">เดือน " + month_id + " ปี " + price_year + "</td>\n"));
            Return_String.append("</table>");
            Return_String.append("<table width='100%' align='center' border='0' cellpadding='0' cellspacing='1' class='inner3'>\n");
            Return_String.append("<tr>\n");
            Return_String.append(("<td class=\"row5\" width=\"7%\">ประเภท</td>\n"));
            Return_String.append(("<td class=\"row5\" width=\"6%\">คงเหลือ</td>\n"));

            //System.out.println(Return_String);                
            rs = con.createStatement().executeQuery(SQL);
            while (rs.next()) {
                Return_String.append("<tr>\n");
                Return_String.append(("<td class=\"forborder\" width=\"5%\">" + rs.getString("pgroup_id") + "</td>\n"));
                Return_String.append(("<td class=\"forborder\" width=\"6%\"><p align = \"right\">" + df.format(rs.getDouble("sum_weight_total")) + "</p></td>\n"));
                Return_String.append("</tr>\n");
                count_line += 1;
            }

            Return_String.append("</table>");

        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace(System.out);
        } finally {
        }
        return Return_String.toString();

    }

}
