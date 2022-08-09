/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.regex;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;


/**
 *
 * @author ADMIN
 */
public class ValidateAnDate {

    public static boolean isImportDateBeforeToday(String strDate) {
        boolean check = false;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date importDate = null;
        Date today = null;
        try {
            today = sdf.parse(sdf.format(new Date()));
            importDate = sdf.parse(strDate);
            if (importDate.before(today)) {
                check = true;
            }

        } catch (Exception e) {          
            e.printStackTrace();
        }
        return check;
    }

    public static boolean isImportDateAfterUsingDate(String strFirstDate, String strSecDate) {
        boolean check = false;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date importDate = sdf.parse(strFirstDate);
            Date usingDate = sdf.parse(strSecDate);
            if (importDate.after(usingDate)) {
                check = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public static boolean dayIsBeforeFirstDateV2(String stringDate) {
        boolean check = false;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date expiredDate = null;
        Date today = new Date();
        do {
            try {
                df.setLenient(false);
                df.parse(stringDate);
                check = false;
                expiredDate = df.parse(stringDate);
                if (expiredDate.before(today)) {
                    check = true;
                    break;
                }
            } catch (Exception e) {
                check = true;
                break;
            }
        } while (check);
        return check;
    }

    public static void main(String[] args) {
        String stringDate = "";
        Scanner sc = new Scanner(System.in);
        System.out.println("PLEASE ENTER EXPIRATION DATE THE CORRECT FORMAT(dd-MM-yyyy): ");
        stringDate = sc.nextLine();
        dayIsBeforeFirstDateV2(stringDate);

    }
}
