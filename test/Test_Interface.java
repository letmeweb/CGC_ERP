
interface Shape {

    public double area();

    public double volume();
}

public class Test_Interface implements Shape {

    static int x, y;

    public Test_Interface() {
        x = 1;
        y = 2;
        System.out.println("Test point: " + x + "," + y);
    }

    @Override
    public double area() {
        return 2;
    }

    @Override
    public double volume() {
        return 4;
    }

    public static void print() {
        System.out.println("point: " + x + "," + y);
    }

    public static void main(String args[]) {
        Test_Interface p = new Test_Interface();
        Test_Interface.print();
    }
}
