
import org.apache.commons.codec.binary.Base64;

public class encode64 {

    public static void main(String args[]) {
        String UserID = "cgc", Password = "systemadmin";
        String PassEncode = "QWRtaW5OdW1iZXI3Nw==";

        encode64(UserID, Password, PassEncode);

    }

    private static void encode64(String UserID, String Password, String PassEncode) {
        try {

            byte[] user_encode = Base64.encodeBase64(UserID.getBytes());
            byte[] pass_encode = Base64.encodeBase64(Password.getBytes());
            byte[] pass_decode = Base64.decodeBase64(PassEncode.getBytes());

            System.out.println("username_encode = " + UserID + " | " + new String(user_encode));
            System.out.println("password_encode = " + Password + " | " + new String(pass_encode));
            System.out.println("password_encode = " + PassEncode + " | " + new String(pass_decode));

        } catch (Exception ex) {
            System.out.println("ERROR");
        }
    }
}
