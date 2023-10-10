/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dmx
 */
public class Doctor {

    private int doctorId, ExperienceYears, specialtyId;
    private double rating;
    private String Description, Position, email, phone, specialtyName;
    private String name, specialty;
    
//code riêng dùng trong màn hình services của HongNT
    private String lastname, firstname;

    public Doctor(int doctorId, String lastname, String firstname) {
        this.doctorId = doctorId;
        this.lastname = lastname;
        this.firstname = firstname;
    }

    public Doctor(String name, int specialtyId, int doctorId) {
        this.name = name;
        this.specialtyId = specialtyId;
        this.doctorId = doctorId;
    }

    public Doctor(int ExperienceYears, double rating, String Description, String Position, String firstname, String lastname, String email, String phone, String specialtyName) {
        this.ExperienceYears = ExperienceYears;
        this.rating = rating;
        this.Description = Description;
        this.Position = Position;
        this.email = email;
        this.phone = phone;
        this.specialtyName = specialtyName;
        this.lastname = lastname;
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSpecialtyName() {
        return specialtyName;
    }

    public void setSpecialtyName(String specialtyName) {
        this.specialtyName = specialtyName;
    }
//getter setter dùng trong  màn hình services của HongNT

    public Doctor() {
    }

    public Doctor(int doctorId, int ExperienceYears, double rating, String name, String specialty, String Description, String Position) {
        this.doctorId = doctorId;
        this.ExperienceYears = ExperienceYears;
        this.rating = rating;
        this.name = name;
        this.specialty = specialty;
        this.Description = Description;
        this.Position = Position;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public int getExperienceYears() {
        return ExperienceYears;
    }

    public void setExperienceYears(int ExperienceYears) {
        this.ExperienceYears = ExperienceYears;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecialty() {
        return specialty;
    }

    public int getSpecialtyId() {
        return specialtyId;
    }

    public void setSpecialtyId(int specialtyId) {
        this.specialtyId = specialtyId;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getPosition() {
        return Position;
    }

    public void setPosition(String Position) {
        this.Position = Position;
    }

}
