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
class Waiter {

    private int WaiterID;
    private String WaiterName;
    private String WaiterSurname;
    private String Gender;
    private int Birthyear;
    private int Salary;

    public Waiter(int WaiterID, String WaiterName, String WaiterSurname, String Gender, int Birthyear, int Salary) {
        this.WaiterID = WaiterID;
        this.WaiterName = WaiterName;
        this.WaiterSurname = WaiterSurname;
        this.Gender = Gender;
        this.Birthyear = Birthyear;
        this.Salary = Salary;
    }

    public int getWaiterID() {
        return WaiterID;
    }

    public void setWaiterID(int WaiterID) {
        this.WaiterID = WaiterID;
    }

    public String getWaiterName() {
        return WaiterName;
    }

    public void setWaiterName(String WaiterName) {
        this.WaiterName = WaiterName;
    }

    public String getWaiterSurname() {
        return WaiterSurname;
    }

    public void setWaiterSurname(String WaiterSurname) {
        this.WaiterSurname = WaiterSurname;
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
