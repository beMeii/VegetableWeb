/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author Mai
 */
public class OderDetail {
    int detailID;
    int oderID;
    String productID;
    int quantity;
    Double price;
    int statusID;

    public OderDetail() {
    }

    public OderDetail(int detailID, int oderID, String productID, int quantity, Double price, int statusID) {
        this.detailID = detailID;
        this.oderID = oderID;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
        this.statusID = statusID;
    }


    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public int getOderID() {
        return oderID;
    }

    public void setOderID(int oderID) {
        this.oderID = oderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    
}
