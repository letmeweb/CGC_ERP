
import java.io.FileWriter;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.cgc.DB.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author Crunchify.com
 */
public class JsonToFile {

    @SuppressWarnings("unchecked")
    public static void main(String[] args) throws IOException, Exception {
        JSONObject obj = new JSONObject();
        DBConnect dbConnect = new DBConnect();
        ResultSet rs;
        Connection con = dbConnect.openTestConnection();
        String SQL_Data = " SELECT "
                + " product_id,name_t "
                + " FROM mproduct "
                + " where pgroup_id = 'RAW' ";

        /*         
         String SQL_Data = " SELECT "
         + " pgroup_id,sum(weight_total) as sum_weight_total "
         + " FROM vt_transaction_stock_process_report "
         + " GROUP BY pgroup_id,pgroup_name ";
         */
        PreparedStatement p;

        p = con.prepareStatement(SQL_Data);
        rs = p.executeQuery();
        //JSONArray Data = new JSONArray();
        while (rs.next()) {

            //obj.put(rs.getString("pgroup_id"), rs.getString("sum_weight_total"));
            //Data.add("Compnay: Google");
            //Data.add(rs.getString("pgroup_id") + " : " + rs.getString("sum_weight_total"));
            //Data.add(rs.getString("product_id") + " : " + rs.getString("name_t"));
            obj.put(rs.getString("product_id"), rs.getString("name_t"));
        }

        //obj.put("", Data);
        // try-with-resources statement based on post comment below :)
        try (FileWriter file = new FileWriter("d:/Temp/file1.txt")) {
            file.write(obj.toJSONString());
            System.out.println("Successfully Copied JSON Object to File...");
            System.out.println("\nJSON Object: " + obj);
        }
    }
}
