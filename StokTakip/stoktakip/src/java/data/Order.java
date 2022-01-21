/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author osmtr
 */
public class Order implements Serializable{
    private int Id;
    private String OrderNumber;
    private Date OrderDate;
}
