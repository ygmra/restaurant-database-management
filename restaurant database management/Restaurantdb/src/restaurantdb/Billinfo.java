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
public class Billinfo {
    
    private int BillID;
     private String DayOfBill;
     private int OrderID;

    public Billinfo(int BillID, String BillOfDay, int OrderID) {
        this.BillID = BillID;
        this.DayOfBill = BillOfDay;
        this.OrderID = OrderID;
    }

    public int getBillID() {
        return BillID;
    }

    public void setBillID(int BillID) {
        this.BillID = BillID;
    }

    public String getDayOfBill() {
        return DayOfBill;
    }

    public void setDayOfBill(String DayOfBill) {
        this.DayOfBill = DayOfBill;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }
     
     
    
}
