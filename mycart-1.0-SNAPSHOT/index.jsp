
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not login!Login first");
        response.sendRedirect("login.jsp");

        return;

    }

%>






<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My-Cart : Home</title>
        <%@include file="components/common_css_js.jsp" %>

        <style>
            .product-card:hover
            {
                background:#e2e2e2;
                cursor:pointer;
            }
           

        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <%  String cat = request.getParameter("category");
                    //String user_id=request.getParameter("user_id");
                    // int u_id=Integer.parseInt(user_id);
                    //out.println(st); 
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;

                     if (cat == null || cat.trim().equals("all")) {

                        list = dao.getAllProducts();
                        

                    } else {
                        int cid = Integer.parseInt(cat);
                        list = dao.getAllProductsById(cid);

                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                   
                     List<Category> clist = cdao.getCategories();


                %>


                <!--show categories-->

                <div class="col-md-3">
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all&ur_phone=<%=user.getUserPhone()%>" class=" list-group-item list-group-item-action active">
                            <h5>All products</h5>
                        </a>



                        <%                        for (Category c : clist) {

                        %>     
                        <a href="index.jsp?category=<%=c.getCategoryId()%>&user=<%= user.getUserId()%>&ur_phone=<%=user.getUserPhone()%>" class="list-group-item list-group-item-action"><h5><%= c.getCategoryTitle()%></h5></a>
                                <%

                                    }

                                %>

                    </div>
                </div>
                <!--show products-->
                <div class="col-md-9">

                    <!--row-->
                    <div class="row ">

                        <!--col-->
                        <div class="col-md-12">


                            <div class="card-columns">

                                <!--traversing products-->
                                <%                               for (Product p : list) {
                                %>   

                                <div class="card product-card mt-5" style="max-height:530px;">

                                    <div class="card-header">

                                        <div class="container text-center" style="height:180px;">

                                            <img class="card-img-top mt-2 text-center" style="max-height:180px;max-width:100%;width:auto;" src="img/products/<%=p.getpPhoto()%>" alt="Card image cap">

                                        </div>

                                    </div>

                                    <div class="card-body" style="max-height:260px;">

                                        <h5 class="card-title"><%= p.getpName()%> </h5>

                                        <h6 class="card-text">

                                            <%= Helper.get10Words(p.getpDesc())%>

                                        </h6>

                                        <h5>Original Price:<%=p.getpPrice()%> taka</h5>

                                        <h3><%=p.getpDiscount()%>% Off</h3>

                                        <%
                                            int a = p.getpDiscount() * p.getpPrice();
                                            int b = a / 100;
                                            int c = p.getpPrice() - b;
                                        %>   
                                 <h6>After Discount Product Price:<%=c%> taka</h6>


                                    </div>


                                    <div class="card-footer " style="background:#e2e2e2;" style="max-height:20px; ">



                                        <a class="btn btn-success text-white" href="productDetails.jsp?product_id=<%=p.getPid()%>&user_id=<%=user.getUserId()%>&ur_phone=<%=user.getUserPhone()%>">R-more</a> 

                                       <!-- <button class="btn btn-outline-primary "><i class="fa fa-commenting-o"></i><span>20</span></button> --> 

                                   
                                        <a class="btn custom-bg text-white" href="ProductSave.jsp?p_id=<%=p.getPid()%>&u_phone=<%=user.getUserPhone()%>">Add to Cart</a>



                                    </div>        


                                </div>   

                                <%

                                    }
                                    if (list.size() == 0) {
                                %>
                                <div class="container custom-bg text-center text-white" style="font-family:fantasy; margin-top:300px;">

                                    <h2>No items in this Category</h2>

                                </div>
                                <%
                                    }

                                %>

                            </div>


                        </div>




                    </div>

                </div>





            </div>
                                
        </div>
        
        <!----modal---->
   <%
    String ph=request.getParameter("ur_phone");
   
    String tel=user.getUserPhone();
    
    
    List<Integer>list1=null;
    List<Product> li=null;
    if(ph!=null||tel!=null){
    ProductDao dao1=new ProductDao(FactoryProvider.getFactory()); 
    list1 =dao1.getAllPhone(ph);
    
    li=dao1.getProduct(list1);
    
    
    //out.println(li);
    
                                                                                                                                                                                                                                                                                                                                                               
    }
   
    
   %>                                
                                    
                                    
                                    
          <!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Your cart</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <!---Modal body-->
        <%
            int totalPrice=0;
            
            %>
      <div class="modal-body">
           <caption><h2 class="text-center">List of Products</h2></caption>
           <table class="table">
           
            <thead>
                   <tr>
                   <th>Name</th>
                   <th>price</th>
                   <th>Discount</th>
                   <th>Dis-Price</th>
                   <th>Action</th>
                   
                   </tr>
            </thead>
          <%
           for(Product p1 :li)
              {
                 
                 int a1 = p1.getpDiscount() * p1.getpPrice();
                 int b1 = a1/ 100;
                 int c1 = p1.getpPrice() - b1;
                                        
                 
                 totalPrice+=c1+50;
            %>
            
              
                <tr>
                    
                   <td ><%=p1.getpName()%></td>
                   <td><%=p1.getpPrice()%></td>
                   <td><%=p1.getpDiscount()%>%</td>
                   <td><%=c1%></td>
                   
                   <td><button class='btn btn-danger btn-sm'>Remove</button></td>
                   
                   
                </tr>
                
           
         
             <%
                }
             %>
            
            
             </table>
              <div class="container text-center">
                    <h4>Total-Price:<%=totalPrice%></h4>
                    <h5>Delivery charge every product : 50 taka </h5>
                    <h5>Total service charge = <%=list1.size()*50%> taka</h5>
              </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary checkout-btn" onclick="goToCheckout()">Checkout</button>
      </div>
    </div>
  </div>
</div>

<div id="toast">
    
</div>
       
        
    </body>
</html>
