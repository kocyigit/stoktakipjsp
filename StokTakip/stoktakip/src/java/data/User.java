package data;

import java.io.Serializable;

public class User implements Serializable {

    private String firstName;
    private String lastName;
    private String phone_number;
    private String car_plate;
    private String email;
    private String password1;
    private String password2;
    
    private String email_load;
    public  String password_load;
    
    private String yon_email;
    private String yon_sifre;
  
    
    public User() {
      
        
    }

    public User(String firstName, String lastName, String phone_number, String car_Plate, String email, String password1, String password2) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone_number=phone_number;
        this.car_plate = car_Plate;
        this.email = email;
        this.password1 = password1;
        this.password2 = password2;
    }
    
    
    
    
    public User(String email_load, String password_load){
        this.email_load = email_load;
        this.password_load = password_load;
    }
    
   
   
    
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getCar_plate() {
        return car_plate;
    }

    public void setCar_plate(String car_plate) {
        this.car_plate = car_plate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword1() {
        return password1;
    }

    public void setPassword1(String password1) {
        this.password1 = password1;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public String getEmail_load() {
        return email_load;
    }

    public void setEmail_load(String email_load) {
        this.email_load = email_load;
    }

    public String getPassword_load() {
        return password_load;
    }

    public void setPassword_load(String password_load) {
        this.password_load = password_load;
    }



   
    
    
    
    
    
}
