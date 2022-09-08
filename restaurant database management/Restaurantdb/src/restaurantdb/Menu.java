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
public class Menu {
    
     private int FoodNamesID;
     private String Name;
     private int Price;
     private int TypeID;

    public Menu(int FoodNamesID, String Name, int Price) {
        this.FoodNamesID = FoodNamesID;
        this.Name = Name;
        this.Price = Price;
        
    }

    public int getFoodNamesID() {
        return FoodNamesID;
    }

    public void setFoodNamesID(int FoodNamesID) {
        this.FoodNamesID = FoodNamesID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getTypeID() {
        return TypeID;
    }

    public void setTypeID(int TypeID) {
        this.TypeID = TypeID;
    }
     
     
    
}
