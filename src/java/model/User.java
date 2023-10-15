/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dmx
 */
public class User {

    private String status,
            firstName,
            lastName,
            gender,
            email,
            password,
            address,
            phone, 
            dob,
            avatar, 
            createdAt;
    private int userId, roleId;

    public User() {
    }

    public User(String status, String firstName, String lastName, String gender, String email, String password, String address, String phone, String dob, String avatar, String createdAt, int userId, int roleId) {
        this.status = status;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.dob = dob;
        this.avatar = avatar;
        this.createdAt = createdAt;
        this.userId = userId;
        this.roleId = roleId;
    }
    
    

    public User(String status, String firstName, String lastName, String gender, String email, String password, String address, String phone, String dob, String avatar, int roleId) {
        this.status = status;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.dob = dob;
        this.avatar = avatar;
        this.roleId = roleId;
    }

    
    public User(String status, String firstName, String lastName, String email, String password, String address, String phone, String dob, String avatar, int roleId) {
        this.status = status;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.dob = dob;
        this.avatar = avatar;
        this.roleId = roleId;
    }

    public User(String firstName, String lastName, String email, String password, String address, String phone, String dob) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.dob = dob;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
