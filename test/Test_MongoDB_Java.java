
import java.net.UnknownHostException;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.Mongo;
import com.mongodb.MongoException;

public class Test_MongoDB_Java {

    public static void main(String[] args) {
        try {
            Mongo m = new Mongo("192.168.1.41", 27017);

            // Database Name
            DB db = m.getDB("message_db");

            // Collection Name
            DBCollection coll = db.getCollection("d_service_message");

            // Find Data
            DBObject myDoc = coll.findOne();
            //System.out.println(myDoc);

            // Find Data
            DBCursor cur = coll.find();
            while (cur.hasNext()) {
                System.out.println(cur.next());
            }

        } catch (UnknownHostException | MongoException e) {
            System.out.println(e);
        }
    }
}
