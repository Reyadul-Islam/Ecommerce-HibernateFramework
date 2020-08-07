<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user2=(User)session.getAttribute("current-user");
    if(user2==null)
    {
       session.setAttribute("message","You are not login!Login first");
       response.sendRedirect("login.jsp");
       return;
       
    }
   
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
        >
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans+Condensed:ital,wght@1,300&family=Playfair+Display:ital,wght@1,600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>My learning templete</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         <link rel="stylesheet" href="css/owl.carousel.min.css">
         <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"
          />
        <link rel="stylesheet" href="css/owl.theme.default.css">
        <%@include file="components/common_css_js.jsp" %>
        <style>
            body
{
 font-family: 'Open Sans Condensed', sans-serif;
font-family: 'Playfair Display', serif;

}

.header
{
    height:90vh;
    width:100%;
    background-size: cover;
    background:linear-gradient(to right,rgb(62,32,233),rgba(235, 67, 11, 0.5)),url(https://images.pexels.com/photos/3861958/pexels-photo-3861958.jpeg?cs=srgb&dl=woman-coding-on-computer-3861958.jpg&fm=jpg);
    color:white;
   
}
.h-100
{
    height:100%;
    width:100%;
}
.btn
{
    border-radius: 10rem !important;
    padding:1.25rem 2.25rem !important;
}
p
{
    font-size: large;
    font-weight: bold;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
.message
{
   background-image: linear-gradient(to top, #fad0c4 0%, #ffd1ff 100%);
}
.myicon
{
    padding:20px;
    font-size: 50px;
}
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <!--coding area-->
        
        <!--Header section-->
        <header class="header" id="home_section">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-md-12  text-center">
                        <h1 class="animate__animated animate__backInDown wow">Welcome to user Panel...</h1>
                        <p class="animate__animated animate__fadeIn wow" data-wow-delay="700ms">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit.
                            Quia, tempore atque? Debitis delectus quae repellat voluptatum placeat maiores ex, 
                            deleniti quas perferendis similique, saepe odio. Quasi atque molestias aspernatur ipsa 
                            alias vero culpa quae aliquam pariatur, expedita odio a? 
                           Aliquid corrupti maxime tempora error veniam eius in provident sequi aut!
                        </p>
                        <button type="button" class="btn btn-primary animate__animated animate__backInUp wow">Start learning</button>
                    </div>
                </div>
            </div>
        </header>
        <!--end of Header Section-->
        <!--start of message section -->
        <section class="message py-5 " id="about_section">
            <div class="container text-center">
                <h1 class="animate__animated animate__zoomIn wow">How to start shopping??</h1>
                <p class="animate__animated animate__zoomIn wow">
                    An application that runs on the server side and creates a dynamic page is called a web application. Currently, Servlet, JSP, Struts, Spring, Hibernate, JSF, etc.
                     technologies are used for creating web applications in Java.
                </p>
                <button class="btn btn-primary animate__animated animate__bounceInUp wow">Check it out!</button>
            </div>
        </section>
        <!--end of message section-->
        <!--Services Section--->
        <section class="services mt-3" id="service_section">
            <div class="container text-center">
                <h1>About our Services</h1>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card animate__animated animate__zoomIn wow">
                            <div class="card-body">
                                <i class="fa fa-bar-chart myicon" style="font-size: 50px;"></i>
                                <h1>Best Explanation</h1>
                                <p>
                                    An application that is distributed in nature, such as banking applications, etc. is called enterprise application. It has advantages of the high-level security, load balancing, and clustering. 
                                           In Java, EJB is used for creating enterprise applications
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card animate__animated animate__zoomIn wow">
                            <div class="card-body">
                                <i class="fa fa-bell-o myicon" style="font-size: 50px;"></i>
                                <h1>Best Explanation</h1>
                                <p>
                                    An application that is distributed in nature, such as banking applications, etc. is called enterprise application. It has advantages of the high-level security, load balancing, and clustering. 
                                           In Java, EJB is used for creating enterprise applications
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card animate__animated animate__zoomIn wow">
                            <div class="card-body">
                                <i class="fa fa-braille myicon" style="font-size: 50px;"></i>
                                <h1>Best Explanation</h1>
                                <p>
                                    An application that is distributed in nature, such as banking applications, etc. is called enterprise application. It has advantages of the high-level security, load balancing, and clustering. 
                                           In Java, EJB is used for creating enterprise applications
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--end of services section-->
        <!--Download section-->
        <section class="message py-5 mt-5">
            <div class="container text-center animate__animated animate__zoomIn wow">
                <h1>Download and Start!</h1>
                <p>
                    An application which is created for mobile devices is called a mobile application.
                   Currently, Android and Java ME are used for creating mobile applications.
                </p>
                <button class="btn btn-primary animate__animated animate__zoomIn wow">Check it out!</button>
            </div>
        </section>
        <!--end of Download section-->
        <!--Contact section-->
        <section class="contact animate__animated animate__zoomIn wow" id="contact_section">
            <div class="container text-center">
                <h1>Let's Get in Touch</h1>
                <p>
                    It is an enterprise platform which is mainly used to develop web and enterprise applications. It is built on the top of the Java SE platform.
                     It includes topics like Servlet, JSP, Web Services, EJB, JPA, etc.
                </p>
                <i class="fa fa-phone myicon text-warning" style="font-size:50px;"></i>
                <i class="fa fa-heart text-danger" style="font-size:50px;"></i>
                <h3>01761-922661</h3>
                <h3>www.javatpoint.com</h3>
            </div>
        </section>
        <!--end of Contact section-->

       




        <!--links section-->
        <section class="message py-5 animate__animated animate__zoomIn wow">
            <div class="container text-center">
                <h1>Important links</h1>
                <div class="row">
                    <div class="col-md-6">
                           <p>Facebook</p>

                           <p>Instagram</p>

                           <p>Google</p>

                           <p>Twitter</p>
                    </div>
                    <div class="col-md-6">
                             <p>Facebook</p>

                           <p>Instagram</p>

                           <p>Google</p>
                           
                           <p>Twitter</p>
                    </div>
                </div>
                <button class="btn btn-primary">Thanks</button>
            </div>
        </section>
        <!--end of link section-->

        <!--footer section-->

        <section class="footer bg-dark">
            <div class="container py-5 text-white text-center">
                   <h5>Copy 0 2020-Learn code with us</h5>
            </div>
        </section>

        <!--end of footer section-->



        <!---end of coding area-->
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js"></script>
        <script src="https://use.fontawesome.com/2fe3b39662.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/wow.min.js"></script>
        <script>
         $(document).ready(function(){
              $(".owl-carousel").owlCarousel(
                  {
                      autoplay:true,
                       loop:true,
                       margin:10,
                    
                       responsive:{
        0:{
            items:1,
            nav:true
        },
        600:{
            items:3,
            nav:false
        },
        1000:{
            items:3,
            nav:true,
            loop:false
        }
    }
                  }
              );
    });
        </script>

         <script>
              new WOW().init();
        </script>
        <script>
            $(document).ready(function () {

            $(".menus li a").click(function (e) {
      
       //how to 
        let target = $(this).attr("href");
        $("html,body").animate({

            scrollTop: $(target).offset().top-58,

        }, 3000);
        
        e.preventDefault();
        

    });

});
        </script>
          <!----modal---->
   <%
    String ph=user2.getUserPhone();
   
    String tel=user2.getUserPhone();
    
    
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

