
import java.net.UnknownHostException;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;
import com.mongodb.MongoException;

/**
 * Java + MongoDB in Secure Mode
 *
 */
public class TestMongoDB {
    
    public static void main(String[] args) {
        
        try {
            
            Mongo mongo = new Mongo("192.168.1.41", 27017);
            DB db = mongo.getDB("message_db");
            
            boolean auth = db.authenticate("user", "system".toCharArray());
            System.out.println("auth = " + auth);
            
            if (auth) {
                
                DBCollection table = db.getCollection("d_service_message");
                
                BasicDBObject document = new BasicDBObject();
                document.put("name", "beck");
                table.insert(document);
                
                System.out.println("Login is successful!");
            } else {
                System.out.println("Login is failed!");
            }
            System.out.println("Done");
            
        } catch (UnknownHostException | MongoException e) {
            System.out.println(e);
        }
    }
}
