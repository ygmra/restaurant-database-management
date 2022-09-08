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
public class R_Waiter_Lang {
    
     private int RelationLangWaiterID;
     private int WaiterID;
     private int LanguageID;

    public R_Waiter_Lang(int RelationLangWaiterID, int WaiterID, int LanguageID) {
        this.RelationLangWaiterID = RelationLangWaiterID;
        this.WaiterID = WaiterID;
        this.LanguageID = LanguageID;
    }

    public int getRelationLangWaiterID() {
        return RelationLangWaiterID;
    }

    public void setRelationLangWaiterID(int RelationLangWaiterID) {
        this.RelationLangWaiterID = RelationLangWaiterID;
    }

    public int getWaiterID() {
        return WaiterID;
    }

    public void setWaiterID(int WaiterID) {
        this.WaiterID = WaiterID;
    }

    public int getLanguageID() {
        return LanguageID;
    }

    public void setLanguageID(int LanguageID) {
        this.LanguageID = LanguageID;
    }
     
     
    
}
