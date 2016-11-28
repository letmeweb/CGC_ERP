/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cgc.Util;

import com.cgc.DB.DBConnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author beckpalmx
 */
public class Find_Product_Price {

    public double Product_Pirce_Unit(String Doc_date, String Product_Group, String Product_ID, String Iodine) throws Exception {

        double Price_Per_Unit = 0;

        String inputSQL;
        String Price_Month = Doc_date.substring(3, 5);
        String Price_Year = Doc_date.substring(6, 10);
        
        System.out.println("Doc_date = " + Doc_date + " , Price_Month = " + Price_Month + " , Price_Year = " + Price_Year);
        
        int Month = Integer.parseInt(Price_Month);
        
        System.out.println("Month = " + Month);

        if (Product_Group.equals("IMP") || Product_Group.equals("WIP-FC") || Product_Group.equals("RAW")) {
            inputSQL = " Select * from mproduct_price "
                    + " where delete_flag <> 'Y' "
                    + " and price_year = '" + Price_Year + "'"
                    + " and pgroup_id = '" + Product_Group + "'"
                    + " and product_id = '" + Product_ID + "'";
        } else {
            inputSQL = " Select * from mproduct_price "
                    + " where delete_flag <> 'Y' "
                    + " and price_year = '" + Price_Year + "'"
                    + " and pgroup_id = '" + Product_Group + "'"
                    + " and iodine = '" + Iodine + "'";
        }

        DBConnect objcon = new DBConnect();
        //Connection con = objcon.openTestConnection();
        Connection con = objcon.openNewConnection();
        ResultSet rs = con.createStatement().executeQuery(inputSQL);
        try {
            while (rs.next()) {

                switch (Month) {

                    case 1:
                        // MonthString = "January";
                        Price_Per_Unit = (rs.getDouble("price_month_1"));
                        break;
                    case 2:
                        // MonthString = "February";
                        Price_Per_Unit = (rs.getDouble("price_month_2"));
                        break;
                    case 3:
                        // MonthString = "March";
                        Price_Per_Unit = (rs.getDouble("price_month_3"));
                        break;
                    case 4:
                        // MonthString = "April";
                        Price_Per_Unit = (rs.getDouble("price_month_4"));
                        break;
                    case 5:
                        // MonthString = "May";
                        Price_Per_Unit = (rs.getDouble("price_month_5"));
                        break;
                    case 6:
                        // MonthString = "June";
                        Price_Per_Unit = (rs.getDouble("price_month_6"));
                        break;
                    case 7:
                        // MonthString = "July";
                        Price_Per_Unit = (rs.getDouble("price_month_7"));
                        break;
                    case 8:
                        // MonthString = "August";
                        Price_Per_Unit = (rs.getDouble("price_month_8"));
                        break;
                    case 9:
                        // MonthString = "September";
                        Price_Per_Unit = (rs.getDouble("price_month_9"));
                        break;
                    case 10:
                        // MonthString = "October";
                        Price_Per_Unit = (rs.getDouble("price_month_10"));
                        break;
                    case 11:
                        // MonthString = "November";
                        Price_Per_Unit = (rs.getDouble("price_month_11"));
                        break;

                    default:
                        // MonthString = "December";
                        Price_Per_Unit = (rs.getDouble("price_month_12"));
                        break;
                }
                
                System.out.println("Price_Per_Unit = " + Price_Per_Unit) ; 
                System.out.println("inputSQL = " + inputSQL) ; 

            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } finally {
            con.close();
        }
        return Price_Per_Unit;
    }

}
