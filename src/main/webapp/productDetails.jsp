<%@page import="com.learn.mycart.entities.LikeOption"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.LikeDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%
   User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not login!Login first");
        response.sendRedirect("login.jsp");
        
        return;
        

    }

%>


<%
   
  int productId = Integer.parseInt(request.getParameter("product_id")); 
  int uid=Integer.parseInt(request.getParameter("user_id"));
  
  
  ProductDao d=new ProductDao(FactoryProvider.getFactory());
  Product p=d.getProductByProductId(productId);
  
 
  
    
%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpName() %></title>
        <%@include file="components/common_css_js.jsp" %>
         <script src="js/myjs.js"></script>   
         <div id="fb-root"></div>
       <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v7.0" nonce="4gakuUfC"></script>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
         
         <div class="container">
             
             <div class="row my-4">
                
                 <div class="col-md-8 offset-md-2">
                     
                     <div class="card">
                         
                         <div class="card-header text-center">
                             
                             <h4><%= p.getpName()%></h4>
                            <img class="card-img-top mt-2 text-center" style="max-height:250px;max-width:400px;width:auto;" src="img/products/<%=p.getpPhoto()%>" alt="Card image cap">
                             
                         </div>
                         <div class="card-body custom-bg text-white" style="font-family:serif;font-style: italic;font-weight:bold;font-size:20px;">
                             
                             <p><u style="font-size:40px;">Features:</u><%=p.getpDesc()%></p>
                             <br>
                             
                              <h3>Product Quantity:<%=p.getpQuantity()%></h3>
                               
                              <h3>Product Original Price:<%=p.getpPrice()%> taka</h3>
                           
                              
                              <h3>Product Discount:<%=p.getpDiscount()%>%</h3>
                         
                              <%
                               int a=p.getpDiscount()*p.getpPrice();
                               int b=a/100;
                               int c=p.getpPrice()-b;
                              %>   
                              <h3>After Discount Product Price:<%=c%> taka</h3>
                             
                            </div>
                              <%
                                  LikeDao like=new LikeDao(FactoryProvider.getFactory());
                                  List<Integer> count=like.countLikeOnPost(productId);
                                  List<Integer>list=like.isLikedByUser(productId,uid);
                                   
                                    if(list.size()!=0)
                                     {
                                      
                                         out.println("<h6 class='text-center'>You like this product..please comment</h6>");
                                      //   boolean o=like.deleteLike(productId, uid);
                                      
                                      
                                     
                                     
                                     }  



                              %> 
                                   
                                  
                                  
                                
                                  
                                             
                                              

                                <div class="card-footer  text-center" style="background:#e2e2e2;">
                                    <button  onclick="doLike(<%=productId %>,<%=uid%>)"class="btn btn-outline-primary "><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=count%></span></button>
                                   
                                     <a  class="btn custom-bg text-white" href="ProductSave.jsp?p_id=<%=p.getPid()%>&u_phone=<%=user.getUserPhone()%>">Add-Cart</a> 
                                 
                                    <button class="btn btn-outline-primary " ><i class="fa fa-commenting-o"></i><span>20</span></button> 
                                   
                                    <a href="index.jsp?ur_phone=<%=user.getUserPhone()%>" class="btn btn-success text-white">Back</a>       
                                  </div> 
                                      
                                    <div class="card-footer">
                                        
                                        <div class="fb-comments" data-href="http://localhost:8089/mycart/productDetails.jsp?product_id=<%=p.getPid()%>&amp;user_id=<%=user.getUserId()%>&amp;ur_phone=<%=user.getUserPhone()%>" data-numposts="5" data-width=""></div>
                                        
                                        
                                        
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
    ProductDao dao=new ProductDao(FactoryProvider.getFactory()); 
    list1 =dao.getAllPhone(ph);
    
    li=dao.getProduct(list1);
    
    
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
