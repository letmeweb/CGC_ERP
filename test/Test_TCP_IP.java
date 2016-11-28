
import java.net.*;  // for InetAddress

public class Test_TCP_IP {

    public static void main(String[] args) {

        // Get name and IP address of the local host
        try {
            InetAddress address = InetAddress.getLocalHost();
            System.out.println("Local Host:");
            System.out.println("\t" + address.getHostName());
            System.out.println("\t" + address.getHostAddress());
            System.out.println("\t" + address.getAddress());
            System.out.println("\t" + address.getCanonicalHostName());
        } catch (UnknownHostException e) {
            System.out.println("Unable to determine this host's address");
        }
        for (String arg : args) {
            // Get name(s)/address(es) of hosts given on command-line
            try {
                InetAddress[] addressList = InetAddress.getAllByName(arg);
                System.out.println(arg + ":");
                // Print the first name.  Assume array contains at least one entry.
                System.out.println("\t" + addressList[0].getHostName());
                for (InetAddress addressList1 : addressList) {
                    System.out.println("\t" + addressList1.getHostAddress());
                }
            } catch (UnknownHostException e) {
                System.out.println("Unable to find address for " + arg);
            }
        }
    }
}
