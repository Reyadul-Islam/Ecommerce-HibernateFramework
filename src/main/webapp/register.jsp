
<%
    User user = (User) session.getAttribute("current-user");
    if (user != null) {
       // session.setAttribute("message", "You are not login!Login first");
       // response.sendRedirect("login.jsp");
       %>
       <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>User Login : MyCart</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
            #back
            {
                background-image:url("img/ecom.png");
                background-size:cover;
                background-attachment:fixed;
            }
        </style>
    </head>
    <body id="back">
       <%@include file="components/navbar.jsp" %>
       <div class="container text-center custom-bg text-white"  style="height:150px;font-family:fantasy; margin-top:130px;">
           
           <h1>You already registered in the System</h1> 
           <br>
           <h2>You are a member of Easy Shopping</h1>
           
       </div>
    </body> 
</html>  
       
       
        <%
        return;

    }

%>







<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
          <%@include file="components/common_css_js.jsp" %>
          <style>
            #back
            {
                background-image:url("img/silon.png");
                background-size:cover;
                background-attachment:fixed;
            }
        </style>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
         <div class="container-fluid" id="back">
         <div class="container-fluid custom-bg text-center text-white mt-1"  style="font-family:fantasy;">
          <h1 >Welcome to Easy-Shopping Registration_Page</h1>
          <h2>Register here and your shopping is ready...</h2>
        </div>
         <div class="container-fluid">
         <div class="row mt-5">
             <div class="col-md-5 offset-md-4">
                 <div class="card text-white" style="background:#3f51b5;margin-bottom:20px;">
                     <%@include file="components/message.jsp" %> 
                     <div class="card-body px-5">
                         <div class="container text-center">
                             <img src="img/s.jpg" style="width:150px;border-radius:50%;">                                                                                                    
                         </div>
                        <h3 class="text-center my-3" style="font-family:fantasy;">Sign-up here!!</h3>
                 <form action="RegisterServlet" method="post">
                      <div class="form-group">
                          <label for="name"><h6>User Name</h6></label>
                          <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter username" aria-describedby="emailHelp" required>
                        
                     </div>
                     
                      <div class="form-group">
                          <label for="email"><h6>User Email</h6></label>
                          <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter email" aria-describedby="emailHelp" required>
                        
                     </div>
                     
                      <div class="form-group">
                          <label for="password"><h6>User password</h6></label>
                          <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter password" aria-describedby="emailHelp" required>
                        
                     </div>
                     
                      <div class="form-group">
                          <label for="phone"><h6>User phone</h6></label>
                          <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter phone-number" aria-describedby="emailHelp" required>
                        
                     </div>
                     
                      <div class="form-group">
                          <label for="address"><h6>User Address</h6></label>
                          <textarea name="user_address" style="height:200px;" class="form-control" placeholder="Enter your address" required></textarea>
                        
                     </div>
                     <div class="container text-center" >
                         
                         <button class="btn btn-outline-success" style="color:white;"><b>Register</b></button>
                         <button class="btn btn-outline-warning" style="color:white;"><b>Reset</b></button>
                     </div>
                     
                </form>
                  
                         
                         
                         
                     </div>
                     
                     
                     
                 </div>
                 
                 
             </div>
             
         </div>
     </div>
         </div>
    </body>
</html>
