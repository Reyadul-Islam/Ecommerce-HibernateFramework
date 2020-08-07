
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
           
           <h1>You already Login in the System</h1> 
           <br>
           <h2>You can Start your shopping</h1>
           
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
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container-fluid custom-bg text-center text-white mt-1" style="font-family:fantasy;">
        <h1 >Welcome to Easy-Shopping Collection</h1>
        </div>
        <div class="container" id="back">
            <div class="row">
                <div class="col-md-6 offset-md-3">

                    <div class="card mt-3">
                        <div class="card-header ">
                            <div class="container text-center">
                                
                            <img src="img/login1.png" style="width:200px;border-radius:50%;" >
                            </div>
                            <h3 class="text-center" style="font-family:fantasy;">Login Here</h3>

                        </div>
                        <div class="card-body" style="background:#7e57c2;color:white;">
                               <%@include file="components/message.jsp" %> 
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><h5>Email address</h5></label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                           
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1"><h5>Password</h5></label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                               <div class="container text-center">
                                   <a href="register.jsp" class="text-white"><h6>If not registered Click here!</h6></a>
                                   <br>
                                   <button type="submit" class="btn btn-primary border-0 "><b>Submit</b></button>
                                    <button type="reset" class="btn btn-danger border-0"><b>Reset</b></button>
                               </div>
                            </form>


                        </div>
                       



                    </div>



                </div>
            </div>  
        </div>
    </body>
</html>
