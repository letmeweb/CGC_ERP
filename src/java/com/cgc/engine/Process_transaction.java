/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cgc.engine;

import com.cgc.DB.Process_transactionDB;
import com.cgc.DB.Process_transaction_rawmat_DB;
import com.cgc.DB.Check_MProduct_Price;
import com.cgc.DB.Transfer_MProduct_Price;
import com.cgc.DB.Transfer_MRawmat_Price;
import com.cgc.DB.Check_MRawmat_Price;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author Beckpalmx No7
 */
public class Process_transaction {

    /**
     * @param date_from
     * @param date_to
     * @param username
     * @param process_for
     * @return
     * @throws java.lang.Exception
     */
    public String main_check(String date_from, String date_to, String username, String process_for) throws Exception {
        StringBuilder String_return = new StringBuilder();
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss");
        Timestamp cur_time = new Timestamp(new java.util.Date().getTime());
        String start_time = sdf.format(cur_time);

        // TODO code application logic here
        try {
            Random r = new Random();
            Check_MProduct_Price obj_prd_price = new Check_MProduct_Price();
            Check_MRawmat_Price obj_rawmat_price = new Check_MRawmat_Price();

            //Calc_Rawmat_Price obj_rawmat_calc_price = new Calc_Rawmat_Price();
            //Calc_Rawmat_Price_Location obj_rawmat_calc_price_location = new Calc_Rawmat_Price_Location();
            Process_transactionDB obj = new Process_transactionDB();
            Process_transaction_rawmat_DB obj_rawmat = new Process_transaction_rawmat_DB();
            //Process_transaction_wh_summaryDB obj_sum = new Process_transaction_wh_summaryDB();
            //Process_transaction_rawmat_friction_summaryDB obj_rawmat_friction_sum = new Process_transaction_rawmat_friction_summaryDB();
            Transfer_MProduct_Price obj_transfer_prd_price = new Transfer_MProduct_Price();
            Transfer_MRawmat_Price obj_transfer_raw_price = new Transfer_MRawmat_Price();

            String r_create = Long.toString(Math.abs(r.nextLong()), 36);
            //เรียกใช้งานให้ส่ง Parameter ตามนี้ obj.generater_transaction_process(date_from, date_to,process_id,table,doc_type); 
            switch (process_for) {
                case "RAWMAT":
                    System.out.println("Begin RAWMAT ");
                    obj_transfer_raw_price.generater_transaction_process(date_from, date_to, "RAWMAT_PRICE", "mproduct_price", "Y", r_create, username);
                    obj_rawmat_price.generater_transaction_process(date_from, date_to, "RAWMAT_PRICE", "mproduct_price", "Y", r_create, username);
                    obj.generater_transaction_process(date_from, date_to, "PR_022", "vd_rawmatt_receive", "+", r_create, username);
                    obj.generater_transaction_process(date_from, date_to, "PR_023", "vd_rawmatt_withdraw_detail", "-", r_create, username);
                    obj.generater_transaction_process(date_from, date_to, "PR_025", "vd_carbon_friction_receive_detail_2", "+", r_create, username);
                    obj.generater_transaction_process(date_from, date_to, "PR_057", "vd_rawmatt_bigbag_withdraw_detail", "-", r_create, username);                    
                    
       
                    obj.generater_transaction_process(date_from, date_to, "PR_117", "vd_adjust_rawmat_detail", "*", r_create, username);
                    
                    obj_rawmat.generater_transaction_process(date_from, date_to, "PR_022", "vd_rawmatt_receive", "+", r_create, username);
                    obj_rawmat.generater_transaction_process(date_from, date_to, "PR_023", "vd_rawmatt_withdraw_detail", "-", r_create, username);
                    obj_rawmat.generater_transaction_process(date_from, date_to, "PR_024", "vd_carbon_friction_withdraw_detail", "-", r_create, username);
                    
/*                    
                    obj_rawmat.generater_transaction_process("24-12-2556", date_to, "PR_022", "vd_rawmatt_receive", "+", r_create, username);
                    obj_rawmat.generater_transaction_process("24-12-2556", date_to, "PR_023", "vd_rawmatt_withdraw_detail", "-", r_create, username);
                    obj_rawmat.generater_transaction_process("24-12-2556", date_to, "PR_024", "vd_carbon_friction_withdraw_detail", "-", r_create, username);
*/        

                    System.out.println("End RAWMAT ");
                    break;
                case "WAREHOUSE":
                    System.out.println("Begin WAREHOUSE ");
                    obj_transfer_prd_price.generater_transaction_process(date_from, date_to, "PRODUCT_PRICE", "mproduct_price", "X", r_create, username);
                    obj_prd_price.generater_transaction_process(date_from, date_to, "PRODUCT_PRICE", "mproduct_price", "X", r_create, username);                    
                    obj.generater_transaction_process(date_from, date_to, "PR_029", "vd_carbon_burn_out_detail_wh_complete", "+", r_create, username);
                    obj.generater_transaction_process(date_from, date_to, "PR_034", "vd_carbon_withdraw_detail_wh", "-", r_create, username);
                    obj.generater_transaction_process(date_from, date_to, "PR_036", "vd_product_receive_detail_prod_wh_report", "+", r_create, username);
                    obj.generater_transaction_process(date_from, date_to, "PR_040", "vd_packing_product_detail_wh", "-", r_create, username);
                    obj.generater_transaction_process(date_from, date_to, "PR_041", "vd_packing_product_detail_prod_wh", "+", r_create, username);
                    obj.generater_transaction_process(date_from, date_to, "PR_042", "vd_requisition_product_detail_wh", "-", r_create, username);
                    obj.generater_transaction_process(date_from, date_to, "PR_114", "vd_carbon_return_detail_wh", "+", r_create, username);
                    obj.generater_transaction_process(date_from, date_to, "PR_115", "vd_adjust_product_detail", "*", r_create, username);
                    obj.generater_transaction_process(date_from, date_to, "PR_060", "vd_carbon_send_product_detail", "+", r_create, username);
                    System.out.println("End WAREHOUSE ");
                    break;
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        //String_return.append(" ");

        Timestamp cur_time2;
        cur_time2 = new Timestamp(new java.util.Date().getTime());
        String stop_time = sdf.format(cur_time2);
        Date d1 = sdf.parse(start_time);
        Date d2 = sdf.parse(stop_time);

        long diff = d2.getTime() - d1.getTime();
        long diffSeconds = diff / 1000 % 60;
        long diffMinutes = diff / (60 * 1000) % 60;
        long diffHours = diff / (60 * 60 * 1000) % 24;
	//long diffDays = diff / (24 * 60 * 60 * 1000);

        System.out.println("END Transaction Process ... " + '\n');
        String_return.append("ประมวลผลเสร็จสิ้น " + '\n');
        String_return.append("เริ่มประมวลผลเวลา : ").append(start_time).append('\n');
        StringBuilder append = String_return.append("เสร็จสิ้นเวลา :           ").append(stop_time).append('\n');
        String_return.append("ใช้เวลาทั้งสิ้น (ช.ม.:นาที:วินาที) : ").append((String.format("%02d", diffHours) + ":" + String.format("%02d", diffMinutes) + ":" + String.format("%02d", diffSeconds)));

        return String_return.toString();

    }
}
