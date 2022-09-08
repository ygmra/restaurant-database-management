/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package restaurantdb;

/**
 *
 * @author YAĞMUR
 */
public class orderinfo {
    
    private int orderID;
     private String OrderDay;
     private int Product_quantity;
     private int CustomerID;

    public orderinfo(int orderID, String OrderDay, int Product_quantity, int CustomerID) {
        this.orderID = orderID;
        this.OrderDay = OrderDay;
        this.Product_quantity = Product_quantity;
        this.CustomerID = CustomerID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getOrderDay() {
        return OrderDay;
    }

    public void setOrderDay(String OrderDay) {
        this.OrderDay = OrderDay;
    }

    public int getProduct_quantity() {
        return Product_quantity;
    }

    public void setProduct_quantity(int Product_quantity) {
        this.Product_quantity = Product_quantity;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }
    
     
}
