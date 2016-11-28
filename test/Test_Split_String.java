/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author beckpalmx
 */
public class Test_Split_String {

    public static void main(String[] args) {

        String a = "This,year,2013,Welcome to,ThaiCreate.Com,Version 2013";

        String[] arrB = a.split(",");
        for (String c : arrB) {
            System.out.println(c);
        }

        System.out.println("======================");

        for (String arrB1 : arrB) {
            System.out.println(arrB1);
        }

    }

}
