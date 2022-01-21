/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.io.Serializable;

/**
 *
 * @author osmtr
 */
public class Stocks implements Serializable{
     private String Title;
     private String Description;
     private int StockAmount;
     private double Price;
     private String StockCode;
     private String Barcode;
     
     public Stocks() {
      
        
    }

    public Stocks(String Title, String Description, int StockAmount, double Price, String StockCode, String Barcode) {
        this.Title = Title;
        this.Description = Description;
        this.StockAmount=StockAmount;
        this.Price = Price;
        this.StockCode = StockCode;
        this.Barcode = Barcode;
    }
    public String getTitle() {
        return Title;
    }
    public String getDescription() {
        return Description;
    }
    public int getStockAmount() {
        return StockAmount;
    }
    public double getPrice() {
        return Price;
    }
    public String getStockCode() {
        return StockCode;
    }
    public String getBarcode() {
        return Barcode;
    }
    
     public void setTitle(String Title) {
        this.Title = Title;
    }
    public void setDescription(String Description) {
        this.Description = Description;
    }
    public void setStockAmount(int StockAmount) {
        this.StockAmount = StockAmount;
    }
    public void setPrice(double Price) {
        this.Price = Price;
    }
    public void setStockCode(String StockCode) {
        this.StockCode = StockCode;
    }
    public void setBarcode(String Barcode) {
        this.Barcode = Barcode;
    }
}
