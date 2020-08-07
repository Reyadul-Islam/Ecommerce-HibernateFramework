
<%@page import="java.util.Iterator"%>
<%@page import="com.learn.mycart.entities.PStore"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.entities.User"%>
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
        <title>Save to DB</title>
         <%@include file="components/common_css_js.jsp" %>
          <script src="js/script.js"></script>   
    </head>
    <body>
        <% 
            int id = Integer.parseInt(request.getParameter("p_id"));
            
            
        %>
        <%@include file="components/navbar.jsp" %>

         <div class="container mt-5">
             <%@include file="components/message.jsp" %>
            <div class="row offset-md-3">
                <div class="col-md-9">
                    <div class="card mb-5">
                        <div class="card-body custom-bg text-white">
                            <form action="SaveServlet" method="post">
                                 
                                <h3 class="text-center">Your Order Details..</h3>
                                 <div class="form-group">
                                    <label for="number">Product_Id:</label>
                                    <input type="number" name="Id" value="<%=id%>"class="form-control" id="exampleInputEmail1" required >
                            
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" value="<%=user.getUserEmail()%>"class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                            
                                </div>
                                <div class="form-group">
                                    <label for="text">Name:</label>
                                    <input type="text" name="name" value="<%=user.getUserName()%>" class="form-control" id="exampleInputPassword1" placeholder="Enter name" required>
                                </div>
                                <div class="form-group">
                                    <label for="number">Phone:</label>
                                    <input type="number" name="phone" value="<%=user.getUserPhone()%>" class="form-control" id="exampleInputPassword1" placeholder="Enter name" required>
                                </div>
                               
                                <div class="form-group">
                                    <label for="text">Address:</label>
                                    <input type="text" name="address" value="<%=user.getUserAddress()%>" class="form-control" id="exampleInputPassword1" placeholder="Enter Address" required>
                                </div>
                                <div class="container text-center">
                                <button type="submit" class="btn btn-primary ">Submit</button>
                                </div>

                      
                            </form>

                        </div>
                    </div>
                </div>

            </div>


        </div>


 <!----modal---->
   <%
    String ph=request.getParameter("u_phone");
   
    String tel=user.getUserPhone();
    
    List<Integer>list=null;
    List<Product> li=null;
    if(ph!=null||tel!=null){
    ProductDao dao=new ProductDao(FactoryProvider.getFactory()); 
    list =dao.getAllPhone(ph);
   // Iterator<Integer> itr=list.iterator();  
    //while(itr.hasNext()){  
       
   //}
    li=dao.getProduct(list);
    
    
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
            <form action="deleteServlet" method="post">
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
              ProductDao d=new ProductDao(FactoryProvider.getFactory());
              
              for(Product p :li)
              {
                 
                 int a = p.getpDiscount() * p.getpPrice();
                 int b = a / 100;
                 int c = p.getpPrice() - b;
                                       
                 
                 totalPrice+=c+50;
                
            %>
            
              
            
                <tr>
                    
                   <td ><%=p.getpName()%></td>
                  
                   <td><%=p.getpPrice()%></td>
                   <td><%=p.getpDiscount()%>%</td>
                   <td><%=c%></td>
                   
                   <td>
                      
                   <button class='btn btn-danger btn-sm' onclick="deleteProduct(<%=p.getPid()%>)">Remove</button>
                     
                   </td>
                   
                   
                   
                </tr>
                
           
         
             <%
                }
             %>
            
            
             </table>
        
              <div class="container text-center">
                    <h4>Total-Price:<%=totalPrice%></h4>
                    <h5>Delivery charge every product : 50 taka </h5>
                    <h5>Total service charge = <%=list.size()*50%> taka</h5>
              </div>
            </form>
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
