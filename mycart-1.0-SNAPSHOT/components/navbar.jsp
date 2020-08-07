 

<%@page import="com.learn.mycart.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");


%>
<html>
    <head>
        <title>This is navbar page</title>  
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark  custom-bg">
            <div class="container">
                
                <a class="navbar-brand" href="index.jsp"><i class="fa fa-users mr-1"></i>MyCart</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <%
                                if(user1!=null)
                                {
                                %>
                            <a class="nav-link" href="index.jsp?ur_phone=<%=user1.getUserPhone()%>"><i class="fa fa-home mr-1"></i>Home <span class="sr-only">(current)</span></a>
                            <%
                                }
                               else
                                   {
                             %>
                           <a class="nav-link" href="index.jsp><i class="fa fa-home mr-1"></i>Home <span class="sr-only">(current)</span></a>
                           
                            <%
                                 }
                             %>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-briefcase"></i> Categories
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </li>

                    </ul>   
                    <ul class="navbar-nav ml-auto">
                        
                        <li class="nav-item active">
                           <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus mr-1 " style="font-size:22px;"></i><!--<span class="cart-items"></span>--> </a>
                        
                        </li>
                      
                        
                        <%              
                            if (user1 == null)
                           {
                        %>
                        <li class="nav-item active">
                            <a class="nav-link" href="login.jsp"><i class="fa fa-address-book-o mr-1"></i>Login </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="register.jsp"><i class="fa fa-address-card-o mr-1"></i>Register </a>
                        </li>

                        <%
                        } else {
                        %>
                        <li class="nav-item active">
                            <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><i class="fa fa-user-circle mr-1"></i><%= user1.getUserName()%></a>
                        </li>

                        <!--profile modal-->


                        <!-- Modal -->
                        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header custom-bg text-white text-center">
                                        <h5 class="modal-title" id="exampleModalLabel">Easy Shopping</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body text-center">

                                        <div class="container text-center">
                                            <img src="pics/<%= user1.getUserPic()%>" style="border-radius:50%;max-width:150px;" class="mx-auto"/>
                                        </div>
                                        <div class="container text-center">
                                            <h5 class="modal-title mt-3 mx-auto" id="exampleModalLabel"><%= user1.getUserName()%></h5>
                                        </div>
                                        <!--details-->
                                        <div id="profile-details">
                                        <table class="table">
                                            
                                            <tbody>
                                                <tr>
                                                    <th scope="row">ID:</th>
                                                    <td><%=user1.getUserId() %></td>
                                                    
                                                </tr>
                                                <tr>
                                                    <th scope="row">Email:</th>
                                                    <td><%= user1.getUserEmail()%></td>
                                                    
                                                </tr>
                                                <tr>
                                                    <th scope="row">Address:</th>
                                                    <td><%=user1.getUserAddress()%></td>
                                                   
                                                </tr>
                                                <tr>
                                                    <th scope="row">Phone:</th>
                                                    <td><%=user1.getUserPhone()%></td>
                                                   
                                                </tr>
                                            </tbody>
                                        </table>

                                        </div>
                            <!---profile edit-->
                            <div id="profile-edit" style="display:none;" >
                                
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                               <td>ID:</td>
                                               <td><%=user1.getUserId() %></td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= user1.getUserEmail()%>"></td>
                                             
                                            
                                        </tr>
                                        <tr>
                                            <td>Name:</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= user1.getUserName()%>"></td>
                                             
                                            
                                        </tr>
                                         <tr>
                                            <td>Password:</td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%= user1.getUserPassword()%>"></td>
                                             
                                            
                                        </tr>
                                         <tr>
                                            <td>Address:</td>
                                            <td><input type="text" class="form-control" name="user_address" value="<%= user1.getUserAddress()%>"></td>
                                             
                                            
                                         </tr>
                                         <tr>
                                            <td>User-Type:</td>
                                            <td><%= user1.getUserType()%></td>
                                             
                                            
                                         </tr>
                                          <tr>
                                            <td>Phone:</td>
                                            <td><input type="phone" class="form-control" name="user_phone" value="<%= user1.getUserPhone()%>"></td>
                                             
                                            
                                         </tr>
                                         
                                          <tr>
                                            <td>New profile:</td>
                                            <td>
                                                <input type="file" name="image" class="form-control">
                                            </td>
                                             
                                            
                                         </tr>
                                        
                                        
                                    </table>
                                            <div class="container">
                                                <button type="submit" class="btn btn-outline-primary mx-auto">Save</button>
                                            </div>
                                    
                                </form>
                                
                            </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!--end of profile-->  


                        <li class="nav-item active">
                            <a class="nav-link" href="LogoutServlet"><i class="fa fa-address-book mr-1"></i>Logout</a>
                        </li> 


                        <%
                            }

                        %>





                    </ul>

                </div>
            </div>

        </nav>

        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
                
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
       <script src="js/script.js" type="text/javascript"></script>    
      
         
        <script>
        
        $(document).ready(function(){
        
        let editStatus=false;
        
        $('#edit-profile-button').click(function(){
        
        if(editStatus==false)
        {
            $('#profile-details').hide();
            $('#profile-edit').show();
             editStatus=true;
             $(this).text("Back");
        }
        else
        {
            $('#profile-details').show();
            $('#profile-edit').hide();
            editStatus=false; 
            $(this).text("Edit");
        }
            
        });
        
         });
        
        
        </script>
         
         
         

    </body>
</html>