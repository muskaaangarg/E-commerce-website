<%   
User user= (User) session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message","You are not logged in! Login first to  access checkout page.");
        response.sendRedirect("login.jsp");
        return;
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
            
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                   <!--card--> 
                    
                   <div class="card">
                       <div class="card-body">
                           
                           <h3 class="text-center mb-5">Your selected items</h3>
                           
                           <div class="cart-body">
                               
                           </div>
                       </div>
                   </div>
                  
                </div>
                <div class="col-md-6">
                    <!--form details-->
                    <div class="card">
                       <div class="card-body">
                           
                           <h3 class="text-center mb-5">Your details for order</h3>
                           <form action="#!">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted"></small>
                                </div>
                                <div class="form-group">
                                    <label for="name">Your name</label>
                                    <input value="<%= user.getUserName() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>
                                <div class="form-group">
                                    <label for="name">Your contact</label>
                                    <input value="<%= user.getUserPhone() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter contact number">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Your shipping address</label>
                                    <textarea  class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your address" rows="3"><%= user.getUserAddress() %></textarea>
                                </div>
                                <!-- Order Now Button -->
                                <div class="container text-center">
                                    <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#confirmOrderModal">
                                        Order Now
                                    </button>
                                    <a href="index.jsp" class="btn btn-outline-primary">Continue Shopping</a>
                                </div>
  
                           </form>
                           
                       </div>
                   </div>
                </div>
            </div>
            
        </div>



            <%@include file="components/common_modals.jsp" %>
            
            <!-- Order Confirmation Modal -->
            
            <div class="modal fade" id="confirmOrderModal" tabindex="-1" role="dialog" aria-labelledby="confirmOrderModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                  <div class="modal-header">
                    <h5 class="modal-title" id="confirmOrderModalLabel">Confirm Your Order</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>

                  <div class="modal-body text-center">
                    🛒 Are you sure you want to place this order?
                  </div>

                  <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">No, Cancel</button>
                    <button type="button" class="btn btn-success" onclick="placeOrder()">Yes, Place Order</button>
                  </div>

                </div>
              </div>
            </div>

            <script>
            function placeOrder() {
                window.location.href = "orderConfirmation.jsp"; 
            }
            </script>




    </body>
</html>
