/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Date;

/**
 *
 * @author Mai
 */
public class Oder {
    private int oderID;
    private String userID;
    private String email;
    private String address;
    private String phone;
    private Double total;
    private Date oderDate;
    private String statusID;
    private String paymentStatus;

    public Oder() {
    }

    public Oder(int oderID, String userID, String email, String address, String phone, Double total, Date oderDate, String statusID, String paymentStatus) {
        this.oderID = oderID;
        this.userID = userID;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.total = total;
        this.oderDate = oderDate;
        this.statusID = statusID;
        this.paymentStatus = paymentStatus;
    }

    public int getOderID() {
        return oderID;
    }

    public void setOderID(int oderID) {
        this.oderID = oderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Date getOderDate() {
        return oderDate;
    }

    public void setOderDate(Date oderDate) {
        this.oderDate = oderDate;
    }

    public String getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) {
        this.statusID = statusID;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
    
}
