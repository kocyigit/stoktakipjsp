<%-- 
    Document   : index
    Created on : 16.Ara.2021, 17:39:13
    Author     : CELAL
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="data.Stocks"%>
<%@page import="database.DBUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>


    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

    <title>Ürün Listesi</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body style="background-image: url()">
    <%
        if(request.getSession().getAttribute("username") == null)
            response.sendRedirect("login.jsp");
        if(request.getSession().getAttribute("usertype") != null)
        {
            if((int)request.getSession().getAttribute("usertype") == 2){
                response.sendRedirect("productList.jsp");

                }
        }
        
    %>
    <div class="container">
        <div class="row  justify-content-end-"><a href="cikis.jsp" class="btn btn-sm btn-danger">Çıkış</a></div>
                <div class="row  justify-content-center-">
                    <% if(request.getParameter("error") != null){ %>
                        <div style="color:black"> <%= "Ürün Eklenemedi"%></div>
                    <%}%>
                </div>

        <div class="col-12">
            <button class="btn  btn-sm btn-success mb-5 " style="float:right"onclick=" AddProduct()">Ürün Ekle</button>
        </div>
        
        <div id="Ekle" class="mt-5 mb-2" style="display:none;">
            <form class="form mt-1" action="" method="post"> 
                <div class="form-body">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="projectinput1">Ürün Adı</label>
                                <input type="text" id="ProductName" class="form-control" placeholder="Ürün İsmi" name="ProductName">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="projectinput1">Stok Kodu</label>
                                <input type="text" id="StockCode" class="form-control" placeholder="Stok Kodu" name="StockCode">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="projectinput1">Barkod</label>
                                <input type="text" id="Barcode" class="form-control" placeholder="Barkod" name="Barcode">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="projectinput2">Stok Miktarı</label>
                                <input type="number" id="StockAmount" class="form-control" placeholder="Stok Miktarı" name="StockAmount">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="projectinput3">Fiyatı</label>
                                <input type="number" step="0.01" id="Price" class="form-control" placeholder="Fiyatı" name="Price">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="projectinput4">Açıklama </label>
                                <input type="text" id="ProductDescription" class="form-control" placeholder="Ürün Açıklaması" name="ProductDescription"/>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="btn btn-warning mr-1 " style="margin-top:30px">
                                <i class="ft-x"></i> Kapat
                            </button>
                            <button type="submit" name="btnSave" class="btn btn-primary" style="margin-top:30px">
                                <i class="fa fa-check-square-o"></i> Kaydet
                            </button>
                        </div>
                    </div>
                </div>           
            </form>
        </div>
<% 
    if(request.getParameter("btnSave") != null){
        
            String productName = request.getParameter("ProductName");
           int stockAmount = Integer.parseInt(request.getParameter("StockAmount")) ;
           String stockCode = request.getParameter("StockCode");
           String barcode = request.getParameter("Barcode");

           double price = Double.parseDouble(request.getParameter("Price").replace(',', '.'));
           String productDescription = request.getParameter("ProductDescription"); 
           Stocks stocks = new Stocks(productName,productDescription,stockAmount,price,stockCode,barcode);%>
         
           <%
           
            DBUser db =  new DBUser();
            
             String addResponse =  db.insertProduct(productName,productDescription,stockAmount,price,stockCode,barcode);
      if(addResponse == "hata"){
                  response.sendRedirect("index.jsp?error=500");
      }
    }
   
%>
        <div class="table mt-4">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead style="border: 1px solid rgba(0, 0, 0, .06);font-size: 14px;width:auto; background-color: aliceblue!important; ">
                        <tr>
                            <th>Ürün Adı</th>
                            <th>Ürün Açıklaması</th>
                            <th>Stok Miktarı</th>
                            <th>Fiyat</th>
                            <th>Stok Kodu</th>
                            <th>Barkod</th>
                            <th>İşlemler</th>

                        </tr>
                    </thead>
                    <tbody>
                         <%
                            DBUser dbb = new DBUser();

                            ResultSet r = dbb.getProducts();
                    while(r.next()){ %>
                        <tr>
                            <td><%=r.getString("Title")%></td>
                            <td><%=r.getString("Description")%></td>
                            <td><%=r.getInt("StockAmount")%></td>
                            <td><%=r.getDouble("Price")%></td>
                            <td><%=r.getString("StockCode")%></td>
                            <td><%=r.getString("Barcode")%></td>
                            <td><form action="" method="post"><input type="hidden" name="id" value="<%=r.getInt("Id")%>" /> <button class="btn btn-sm btn-danger" type="submit" name="removeBtn" >Sil</button>  </form></td>
                        </tr>
                      <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
                    
                    <%
                        if(request.getParameter("removeBtn") != null){ %>
                        <%
                               DBUser db =  new DBUser();
                               db.removeProduct(Integer.parseInt(request.getParameter("id")));
                                       response.sendRedirect("index.jsp");

                        }
                        %>
</body>


</html>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
    function AddProduct() {
        $("#Ekle").html();
        $("#Ekle").css("display", "");
    }

    function UpdateProduct() {

    }
</script>