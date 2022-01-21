
package database;


import data.Stocks;
import data.User;
import data.User2;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBUser {
    
    User user1 = new User();
    static final String DB_URL = "jdbc:mysql://localhost:3306/stoktakip";
    static final String USER="root";
    static final String PASSWORD="123456";
    
    public static boolean entry_permit = false;
    public   String cekad ;
    public   String ceksoyad ;        
    public   String ceknumara;        
    public   String cekplaka;        
    public   String cekeposta;        
    public   String ceksifre;
    public String insertProduct(String Title, String Description, int StockAmount, double Price, String StockCode, String Barcode ){
        Connection con =null;
        PreparedStatement psnt = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            
            
            String sql ="INSERT INTO stocks(Title, Description, StockAmount, Price, StockCode, Barcode) VALUES(?, ?, ?, ?, ?, ?)";
            psnt = con.prepareStatement(sql);
            
            // veri tabanına bilgilerin yazdırıldığı kısım
            psnt.setString(1,Title);
            psnt.setString(2,Description);
            psnt.setInt(3,StockAmount);
            psnt.setDouble(4,Price);
            psnt.setString(5,StockCode);
            psnt.setString(6,Barcode);
            
            psnt.executeUpdate();
         
           // veri tabanı kullanıldıktan sonra kapatılıyor
            
           psnt.close();
            con.close();
            return "ok";
        } catch (Exception e) {
            System.out.println("HATA :  "+ e);
            return "hata";
        }
    }
    public void saveOrder(){
        
    }
    public void removeProduct(int id){
        Connection con =null;
        Statement st = null;
        
        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();  
             String sql = "delete from stocks where Id= ?";
             
             PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

                ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : " );
            
        }
    }
    public  void insert(User user) {
        
        Connection con =null;
        PreparedStatement psnt = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            
            
            String sql ="INSERT INTO kisiler(ad, soyad, numara, plaka, eposta, sifre) VALUES(?, ?, ?, ?, ?, ?)";
            psnt = con.prepareStatement(sql);
            
            // veri tabanına bilgilerin yazdırıldığı kısım
            psnt.setString(1,user.getFirstName());
            psnt.setString(2,user.getLastName());
            psnt.setString(3,user.getPhone_number());
            psnt.setString(4,user.getCar_plate());
            psnt.setString(5,user.getEmail());
            psnt.setString(6,user.getPassword1());
            
            psnt.executeUpdate();
         
           // veri tabanı kullanıldıktan sonra kapatılıyor
            
           psnt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("HATA :  "+ e);
        }
        
    }
    
    /*
    Database'den veri çekiliyor
    */
    public  ResultSet vericek(String mail, String sifre){
    Connection con =null;
    Statement st = null;
    ResultSet rs=null;
   
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();
            String sql ="SELECT * FROM stoktakip.users where UserName = '" +mail+ "' and Password = '"+sifre+"'";
            
            rs = st.executeQuery(sql);
            
            entry_permit = false;
            
            while(rs.next()) {
                if( mail.equals(rs.getString("UserName")) && sifre.equals(rs.getString("Password"))    ){
                    entry_permit =true;
                    
                    System.out.println("BAŞARILI");
                    break;
                }else{
                    System.out.println("BAŞARISız");

                }
                  
            }
            
        }catch(Exception e){
            System.out.println(" HATA2 : " + e);
        }
            return rs;
            
    }

    
    public ResultSet getProducts(){
        Connection con =null;
        Statement st = null;
        ResultSet rs=null;
        
        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();  
            String sql ="select * from stocks";
            
            rs = st.executeQuery(sql);
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : " );
            
        }
        return rs;
    }
    
    public  ResultSet verigetir(String eposta) {
        Connection con =null;
        Statement st = null;
        ResultSet rs=null;
        
        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();  
            String sql ="SELECT * FROM users WHERE UserName='" + eposta + "'";
            
            rs = st.executeQuery(sql);
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : " );
            
        }
        return rs;
    }
    
    
    
    
      public  ResultSet verigetirr(String eposta) {
        Connection con =null;
        Statement st = null;
        ResultSet rs=null;
        
        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();  
            String sql ="SELECT * FROM yonetici WHERE eposta='" + eposta + "'";
            
            rs = st.executeQuery(sql);
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : " );
            
        }
        return rs;
    }
    
    //////////////////////////////////////////////////////////////7
    
    
    public  void yonetici_guncelle(User2 user2){
        Connection con =null;
    Statement st = null;
    ResultSet rs=null;
   
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();
            String sql ="UPDATE yonetici set ad='" + user2.getYon_ad() + "', soyad='" + user2.getYon_soyad() + 
                            "', eposta='"+ user2.getEposta_yon()+ "', sifre='" + user2.getPassword_yon() + "' WHERE ID='1'";
            
            
            
            st.executeUpdate(sql);
      
        }catch(Exception e){
            System.out.println(" HATA2 : " + e);
        }
        
        
    }
    
    
    
    
    
    
       public  void kullanici_guncelle(User2 user2, String eposta){
        Connection con =null;
    Statement st = null;
    ResultSet rs=null;
   
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();
            String sql ="UPDATE kisiler set ad='" + user2.getYon_ad() + "', soyad='" + user2.getYon_soyad() + 
                            "', numara='" + user2.getYon_numara() + "', plaka='" + user2.getYon_plaka() +
                            "', eposta='"+ user2.getEposta_yon()+ "', sifre='" + user2.getPassword_yon() + "' WHERE eposta='"+ eposta+"'";
            
            
            
            st.executeUpdate(sql);
      
        }catch(Exception e){
            System.out.println(" HATA2 : " + e);
        }
        
        
    }
   
    
    public  void yonetici_vericek(String mail, String sifre){
    Connection con =null;
    Statement st = null;
    ResultSet rs=null;
   
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();
            String sql ="SELECT * FROM yonetici";
            
            rs = st.executeQuery(sql);
           
            while(rs.next()) {
                if( mail.equals(rs.getString("eposta")) && sifre.equals(rs.getString("sifre"))){
                    entry_permit =true;
                 
                    break;
                }else{
                    entry_permit=false;
                }
             
            }
      
        }catch(Exception e){
            e.printStackTrace();
            System.out.println(" HATA2 : ");
        }
            
            
    }


  public  ResultSet kullaniciGetir() {
        Connection con =null;
        Statement st = null;
        ResultSet rs=null;
        
        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);   
            st = con.createStatement();  
            String sql ="SELECT * FROM kisiler";
            
            rs = st.executeQuery(sql);
      
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : " );
            
        }
        return rs;
    }


    public  void kullanicisil(int id){
     Connection conn = null;  
         PreparedStatement sorgu = null;
        
         
          try {
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             
             sorgu = conn.prepareStatement("DELETE   FROM kisiler WHERE ID='" + id + "'");
             sorgu.executeUpdate();
            
                
             
        } catch (Exception ex) {
            ex.printStackTrace();
                    
        }
    }
}
