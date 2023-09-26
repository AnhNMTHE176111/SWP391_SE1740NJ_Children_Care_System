/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author dmx
 */
public class DAOSlotDoctor extends DBContext {
    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAOSlotDoctor() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }
}
