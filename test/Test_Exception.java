
import java.util.InputMismatchException;
import java.util.Scanner;

public class Test_Exception {

    public static void main(String[] args) {
        boolean isNumber = false;
        int number = 0;

        Scanner scan = new Scanner(System.in);

        while (!isNumber) {
            try {
                System.out.print("Enter an integer: ");
                number = scan.nextInt();

                System.out.print("Your integer is: " + number);

                scan.close(); // close resources for good practice

                // not true = false, exits loop on integer input
                isNumber = true; // break; can also be used

            } catch (InputMismatchException ime) {
                System.out.print("Input is not a number!\n\n");

                scan.nextLine(); // clears input buffer

                // not false = true, re-enters while loop on catch
                isNumber = false;
            }
        }
    }
}
