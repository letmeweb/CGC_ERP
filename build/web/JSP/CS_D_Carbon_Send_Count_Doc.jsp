<%@page language="java" contentType="text/html; charset=TIS-620" pageEncoding="TIS-620"%>
<%@page import="com.cgc.Util.Display_Document_Status"%>
<%@page import="com.cgc.bean.DataBean_Display_Document_Status"%>
<%@page isThreadSafe="false"%>
<%
    DataBean_Display_Document_Status obj_record = new DataBean_Display_Document_Status();
    Display_Document_Status r_c = new Display_Document_Status();
    int statusck = 0;
    String Sql_Str = "";
    String runer_id = request.getParameter("runer_id");
    //System.out.println("runer_id = " + runer_id);
    if (runer_id != null) {

        if (runer_id.equals("1")) {
            // Lab Check Confirm PT ����͹
            Sql_Str = " select count(*) as record_count from vd_carbon_send_product_header where doc_type = 'PM' and  quality_confirm <> 'Y'   ";
        } else if (runer_id.equals("2")) {
            // Lab Check Confirm PM �ҹ��
            Sql_Str = " select count(*) as record_count from vd_carbon_send_product_header where doc_type = 'PT' and  quality_confirm <> 'Y'   ";
        } else if (runer_id.equals("3")) {
            // Check Confirm WH ����͹
            Sql_Str = " select count(*) as record_count from vd_carbon_send_product_header where doc_type = 'PM' and  complete_flag <> 'Y'   ";
        } else if (runer_id.equals("4")) {
            // Check Confirm WH �ҹ��
            Sql_Str = " select count(*) as record_count from vd_carbon_send_product_header where doc_type = 'PT' and  complete_flag <> 'Y'   ";
        } else if (runer_id.equals("5")) {
            // Lab Check ��ҹ�͡�ҡ�� CS_D_carbon_out_analysis_new
            Sql_Str = " select count(*) as record_count from vd_carbon_out_analysis_header where approve_status <> 'Y'   ";                    
        } else if (runer_id.equals("6")) {
            // Check ����ԡ��ҹ������ CS_023
            Sql_Str = " select count(*) as record_count from vd_rawmatt_withdraw_header where complete_flag <> 'Y'   ";            
        }        

        statusck = 5;
        //System.out.println("runer_id <> null = " + runer_id);

        //System.out.println("Sql_Str  = " + Sql_Str);
        obj_record = r_c.Fn_Record_Count(obj_record, Sql_Str);
    }

    //System.out.println("statusck = " + statusck);
    switch (statusck) {

        case 5:
            out.print(obj_record.getRecord_count());
            //System.out.println("Record Count = " + obj_record.getRecord_count());
            break;
        default:
            out.print("No Statment");
            break;
    }

%>