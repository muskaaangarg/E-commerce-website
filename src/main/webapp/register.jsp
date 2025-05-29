<%-- 
    Document   : register
    Created on : 27 Mar 2025, 7:37:00 pm
    Author     : MUSKAN GARG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        
        <%@include file="components/common_css_js.jsp" %>
     
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="conatiner-fluid">
            
            <div class="row mt-3">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    
                <%@include file="components/message.jsp" %> 
                <div class="card-header custom-bg text-white">     
                    <h3 class="text-center my-3">Sign up here!</h3>
                </div>
                
                <div class="card-body px-5">
                    <form action="RegisterServlet" method="post">
   
                <div class="form-group">
                    <label for="name">UserName</label>
                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label for="email">UserEmail</label>
                    <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter here" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label for="password">UserPassword</label>
                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label for="phone">UserPhone</label>
                    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label for="address">UserAddress</label>
                    <textarea name="user_address" style="height: 150px" class="form-control" placeholder="Enter your address"></textarea>
                </div>
                
                    <div class="container text-center">
                        <button type="register" class="btn btn-primary custom-bg border-0">Register</button>
                        <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
                    </div>    
                    
                </form>
            
                        
                    </div>
                </div>
            
            </div>
        </div>
            
        </div>
        
        
        
        
    </body>
</html>
