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
public class Customer {
    
    private int CustomerID;
    private String CustomerName;
    private String CustomerSurname;
    private String Gender;
    private String Status;
    private int WaiterID;

    public Customer(int CustomerID, String CustomerName, String CustomerSurname, String Gender, String Status, int WaiterID) {
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.CustomerSurname = CustomerSurname;
        this.Gender = Gender;
        this.Status = Status;
        this.WaiterID = WaiterID;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public String getCustomerSurname() {
        return CustomerSurname;
    }

    public void setCustomerSurname(String CustomerSurname) {
        this.CustomerSurname = CustomerSurname;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public int getWaiterID() {
        return WaiterID;
    }

    public void setWaiterID(int WaiterID) {
        this.WaiterID = WaiterID;
    }
    
    
    
}
