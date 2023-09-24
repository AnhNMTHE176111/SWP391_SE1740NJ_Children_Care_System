/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAO.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author dmx
 */
public class DAOSlot extends DBContext {

    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAOSlot() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }
}
