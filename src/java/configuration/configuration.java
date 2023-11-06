/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package configuration;

import dal.DBContext;
import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import model.Customer;

/**
 *
 * @author dmx
 */
public class configuration extends DBContext {

    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public void connect() {
        cnn = super.connection;
    }

    public int NUMBER_OF_APPOINTMENT_DATE;
    public ArrayList<String> DATE_OFF = new ArrayList<>();

    public configuration() {
        connect();
    }

    public int getNUMBER_OF_APPOINTMENT_DATE() {
        try {
            String strSQL = "select * from NUMBER_OF_APPOINTMENT_DATE where id = 1";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();

            int num = 0;

            while (rs.next()) {
                num = rs.getInt(2);
            }
            return num;
        } catch (SQLException e) {
            System.out.println("SQL getNUMBER_OF_APPOINTMENT_DATE: " + e.getMessage());
            return 0;
        } catch (Exception e) {
            System.out.println("getNUMBER_OF_APPOINTMENT_DATE: " + e.getMessage());
            return 0;
        }
    }

    public void setNUMBER_OF_APPOINTMENT_DATE(int num) {
        try {
            String strSQL = "update NUMBER_OF_APPOINTMENT_DATE\n"
                    + "set num = ? where id = 1";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, num);
            pstm.executeQuery();
        } catch (SQLException e) {
            System.out.println("SQL setNUMBER_OF_APPOINTMENT_DATE: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("setNUMBER_OF_APPOINTMENT_DATE: " + e.getMessage());
        }
    }

    public HashMap<Integer, String> getDATE_OFF() {
        HashMap<Integer, String> list = new HashMap<>();
        try {
            String strSQL = "SELECT * FROM DateOff ";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();

            while (rs.next()) {
                list.put(rs.getInt(1), rs.getString(2));
            }
            return list;
        } catch (SQLException e) {
            System.out.println("SQL getDATE_OFF: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("getDATE_OFF: " + e.getMessage());
            return null;
        }
    }

    public boolean addDATE_OFF(String date) {
        HashMap<Integer, String> list = getDATE_OFF();
        if (list.containsValue(date)) {
            return false;
        } else {
            try {
                String strSQL = "insert into DateOff(date) values ( ? ) ";
                pstm = cnn.prepareStatement(strSQL);
                pstm.setString(1, date);
                pstm.executeQuery();
                return true;
            } catch (SQLException e) {
                System.out.println("SQL getDATE_OFF: " + e.getMessage());
            } catch (Exception e) {
                System.out.println("getDATE_OFF: " + e.getMessage());
            }
        }
        return false;
    }

    public boolean removeDATE_OFF(int id) {
        try {
            String strSQL = "delete from DateOff where id = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, id);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            System.out.println("SQL removeDATE_OFF: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("removeDATE_OFF: " + e.getMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        configuration k = new configuration();
        HashMap<Integer, String> list = k.getDATE_OFF();
        for (Map.Entry<Integer, String> entry : list.entrySet()) {
            Object key = entry.getKey();
            Object val = entry.getValue();
            
        }
        System.out.println(list.toString());
    }
}
