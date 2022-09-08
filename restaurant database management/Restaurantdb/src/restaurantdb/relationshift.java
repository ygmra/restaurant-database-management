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
public class relationshift {
    
     private int RelationSID;
     private int WaiterID;
     private int ShiftID;

    public relationshift(int RelationSID, int WaiterID, int ShiftID) {
        this.RelationSID = RelationSID;
        this.WaiterID = WaiterID;
        this.ShiftID = ShiftID;
    }

    public int getRelationSID() {
        return RelationSID;
    }

    public void setRelationSID(int RelationSID) {
        this.RelationSID = RelationSID;
    }

    public int getWaiterID() {
        return WaiterID;
    }

    public void setWaiterID(int WaiterID) {
        this.WaiterID = WaiterID;
    }

    public int getShiftID() {
        return ShiftID;
    }

    public void setShiftID(int ShiftID) {
        this.ShiftID = ShiftID;
    }
     
     
     
}
