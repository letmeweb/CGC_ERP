package com.cgc.DB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Get_Data_Stock {

    public String Get_Value(String SQL) throws Exception {
        String Return_Value = "";
        DBConnect objcon = new DBConnect();
        Connection con = objcon.openTestConnection();
        ResultSet rs;
        int loop = 1;
        //Return_Value = "data: ["; 
        try {
            rs = con.createStatement().executeQuery(SQL);
            while (rs.next()) {
                if (loop == 5) {
                    //Return_Value += "{pgroup_name : '" + rs.getString(1) + "', weight_total:" + rs.getString(2) + "} ],";
                    Return_Value += "{pgroup_name : '" + rs.getString(1) + "', weight_total:" + rs.getString(2) + "}"; 
                } else {
                    Return_Value += "{pgroup_name : '" + rs.getString(1) + "', weight_total:" + rs.getString(2) + "},";
                }
                loop++;
            }
        } finally {
            try {
                //rs.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace(System.out);
            }
        }
        System.out.println("DB Return_Value = " + Return_Value);
        return Return_Value;

    }
}
