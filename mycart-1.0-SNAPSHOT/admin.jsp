  
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.dao.UserDao"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not login!Login first");
        response.sendRedirect("login.jsp");
        return;

    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin!Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
       
        <%@include file="components/common_css_js.jsp" %>
        
        <style>
            
            .admin
            {
                background-image: url("img/back.jpg"); 
                font-family:fantasy;
                margin-bottom:20px;
            }
            .admin .card
            {
                border:1px solid #673ab7;
            }
            .admin .card:hover
            {
                background:#7c4dff;
                cursor:pointer;
                color:white;
            }
            h1:hover{
                font-size:50px; 
            }
            p:hover
            {
                font-size:25px;
                color:black;
            }

        </style>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container admin">
            
            <div class="container-fluid mt-3">
                
                <%@include file="components/message.jsp" %>
                
            </div>
                 
            <div class="row mt-3">
                <!--first col-->
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:125px;border-radius:50%;" class="img-fluid" src="img/totaluser.png" alt="user_icon">
                            </div>
                            <%  
                            UserDao u=new UserDao(FactoryProvider.getFactory());
                            List<Integer> l=u.getUserCount();
                            
                          
                            
                            
                            %>
                            <h1><%=l.get(0)%></h1>
                            <h1 class="text-uppercase ">Users</h1>



                        </div>


                    </div>



                </div>
                <!--second col-->
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:125px;border-radius:50%;" class="img-fluid" src="img/list.png" alt="user_icon">
                            </div>
                             <%
                              CategoryDao d=new CategoryDao(FactoryProvider.getFactory());  
                              List<Integer> lis=d.getCategoryCount();
                             
                            %>   
                            <h1><%= lis.get(0)%></h1>
                           
                            <h1 class="text-uppercase">Categories</h1>



                        </div>


                    </div>


                </div>
                <!--Third col-->
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:125px;border-radius:50%;" class="img-fluid" src="img/list1.png" alt="user_icon">
                            </div>
                           
                            
                             <%
                            ProductDao pd=new ProductDao(FactoryProvider.getFactory());
                            List<Integer> li=pd.getProductCount();
                               
                               
                              %>  
                            <h1><%= li.get(0)%></h1>
                            
                            
                            
                            <h1 class="text-uppercase ">Products</h1>



                        </div>


                    </div>


                </div>

            </div>
            <!--second row-->
            <div class="row mt-4">
                <!--second row:first column-->
                <div class="col-md-6">


                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:125px;border-radius:50%;" class="img-fluid" src="img/category.png" alt="user_icon">
                            </div>
                            <p><b>Click here to add new Category</b></p>
                            <h1 class="text-uppercase ">Add Category</h1>






                        </div>


                    </div>

                </div>
                <!--second row:second column-->
                <div class="col-md-6">


                    <div class="card " data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:125px;border-radius:50%;" class="img-fluid" src="img/product.png" alt="user_icon">
                            </div>
                            <p><b>Click here to add new product</b></p>
                            <h1 class="text-uppercase ">Add Product</h1>





                        </div>


                    </div>

                    
                </div>


            </div>




        </div>

        <!--category modal-->
       

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        
                        <form action="ProductOperationServlet" method="post" style="font-family:fantasy;">
                            <input type="hidden" name="operation" value="addcategory">
                          <div class="form-group">
                              
                              <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required>
                              
                              
                              
                          </div>
                             <div class="form-group">
                                 <textarea style="height:300px;" class="form-control" placeholder="Enter category description" name="catDescription" ></textarea>
                                
                             </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                
                            </div>
                            
                        </form>
                    </div>
                   
                </div>
            </div>
        </div>
  <!--End Add Category modal-->

  <!--product modal-->
  
  

<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg">
        <h5 class="modal-title text-white" id="exampleModalLabel">Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <div class="modal-body">
        <!--form-->
        
        
            <form action="ProductOperationServlet" method="post" enctype="multipart/form-data" style="font-family:fantasy;">
            <input type="hidden" name="operation" value="addproduct"/> 
            <!--product title-->
            <div class="form-group mt-2">
             <input type="text" class="form-control" 
                    placeholder="Enter title of product" name="pName" required/> 
             <!--product description-->
            </div>
             <div class="form-group mt-3">
                 <textarea style="height:150px;" class="form-control" placeholder="Enter product description" name="pDesc" required></textarea>
                   
             </div>
             <!--product price-->
                <div class="form-group">
                    <input type="number" class="form-control" 
                    placeholder="Enter price of product" name="pPrice" required/> 
                
               </div>
            
            <!--product discount-->
              <div class="form-group">
             <input type="number" class="form-control" 
                    placeholder="Enter product discount" name="pDiscount" required/> 
                
               </div>
            <!---product discount-->
            <div class="form-group">
             <input type="number" class="form-control" 
                    placeholder="Enter product Quantity" name="pQuantity" required/> 
                
             </div>
            
             
            
            <!--<%
               
                CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                List<Category> list=cdao.getCategories();
                
             %>
            
            
            <!---product categories-->
            <div class="form-group">
                <select name="catId" class="form-control" id="" >
                    <%
                     for(Category c:list)
                  {
                    %>
                    <option value="<%= c.getCategoryId() %>"/><%=c.getCategoryTitle()%></option>
                  
                    <%
                        }



                    %>
                    
                </select>
                
             </div>
             
            <!--product file-->
            
            <div class="form-group">
                <label for="pPic"><b >Select Picture of product</b></label>
                <br>
                <input type="file" id="pPic" name="pPic" required/>
                
            </div>
            <!--Submit-button-->
            <div class="container text-center">
                <button class="btn btn-outline-success">Add product</button>
                
            </div>
            
             <div class="modal-footer">
             <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       
            </div>
          </form>
            
        
        </div>
       </div>
    </div> 
  </div>
 
        <!--form-->
   
    
  </div>
</div>
  
  
  
  <!--End Product modal-->
    </body>
</html>
