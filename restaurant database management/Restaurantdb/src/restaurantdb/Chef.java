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
public class Chef {
    
    private int ChefID;
    private String ChefName;
    private String ChefSurname;
    private String Gender;
    private int Birthyear;
    private int Salary;

    public Chef(int ChefID, String ChefName, String ChefSurname, String Gender, int Birthyear, int Salary) {
        this.ChefID = ChefID;
        this.ChefName = ChefName;
        this.ChefSurname = ChefSurname;
        this.Gender = Gender;
        this.Birthyear = Birthyear;
        this.Salary = Salary;
    }

    public int getChefID() {
        return ChefID;
    }

    public void setChefID(int ChefID) {
        this.ChefID = ChefID;
    }

    public String getChefName() {
        return ChefName;
    }

    public void setChefName(String ChefName) {
        this.ChefName = ChefName;
    }

    public String getChefSurname() {
        return ChefSurname;
    }

    public void setChefSurname(String ChefSurname) {
        this.ChefSurname = ChefSurname;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public int getBirthyear() {
        return Birthyear;
    }

    public void setBirthyear(int Birthyear) {
        this.Birthyear = Birthyear;
    }

    public int getSalary() {
        return Salary;
    }

    public void setSalary(int Salary) {
        this.Salary = Salary;
    }
    
    
    
}
