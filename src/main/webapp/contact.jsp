<%-- 
    Document   : contact
    Created on : 30 Apr 2025, 9:06:32 am
    Author     : MUSKAN GARG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Page</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="conatiner-fluid">
            
            <div class="row mt-3">
            <div class="col-md-4 offset-md-4">
                    <div class="card">    
                        <div class="card-header custom-bg text-white">
                            <h3 class="text-center my-3">Contact Us</h3>
        <form>
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="inputEmail4">Name</label>
                <input type="email" class="form-control" id="inputEmail4" placeholder="your name">
              </div>
            </div>
            <div class="form-group">
              <label for="inputAddress">Phone Number</label>
              <input type="text" class="form-control" id="inputAddress" placeholder="123XXXXXXX">
            </div>
            <div class="form-group">
                <textarea style="height: 150px;" class="form-control" name="catDescription" placeholder="Enter message" required></textarea>
            </div> 
            </div>
            <div class="container text-center">
                <button type="submit" class="btn btn-success border-0">Submit</button>
                <button type="reset" class="btn btn-primary border-0">Reset</button>
            </div>
        </form>
      </div> 
    </div></div></div></div>
    </body>
</html>
