<%@page import="java.util.Map"%>
<%@page import="com.learn.thriftstore.helper.Helper"%>
<%@page import="com.learn.thriftstore.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.thriftstore.helper.FactoryProvider"%>
<%@page import="com.learn.thriftstore.dao.CategoryDao"%>
<%@page import="com.learn.thriftstore.entities.User"%>
<%  
    User user= (User) session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message","You are not logged in");
        response.sendRedirect("login.jsp");
        return;
    }else{
        if (user.getUserType().equals("normal")){
        session.setAttribute("message", "You are not the admin!");
        response.sendRedirect("login.jsp");
        return;
    }
    }

%>

<%            
CategoryDao cdao=new CategoryDao(FactoryProvider.getfactory());
List<Category> list=cdao.getCategeories();
//getting count

Map<String,Long> m = Helper.getCounts(FactoryProvider.getfactory());

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
        
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
                
            </div>
                 
        <div class="row mt-3">
          
            
            <!--first col -->
            <div class="col-md-4">
                
                <div class="card" data-toggle="tooltip" data-placement="left" title="Number of Users on this website">
                    
                    <div class="card-body text-center">
                        
                        <div class="container">
                            
                            <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/man.png" alt="user_icon">
                        </div>
                        
                        
                        <h1><%=m.get("userCount")%></h1>
                        <h1 class="text-uppercase text-muted">Users</h1>
                    </div>
                    
                </div>
                
                
            </div>
            <!--second col -->
            <div class="col-md-4">
                
                <div class="card" data-toggle="tooltip" data-placement="top" title="Number of Categories on this website">
                    
                    <div class="card-body text-center">
                        
                        <div class="container">
                            
                            <img style="max-width: 125px;" class="img-fluid " src="img/checklist.png" alt="user_icon">
                        </div>
                        <h1><%= list.size() %></h1>
                        <h1 class="text-uppercase text-muted">Categories</h1>
                    </div>
                    
                </div>
                
                
            </div>
            
            <!--third col -->
            <div class="col-md-4">
                
                <div class="card" data-toggle="tooltip" data-placement="right" title="Number of Products on this website">
                    
                    <div class="card-body text-center">
                        
                        <div class="container">
                            
                            <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/dairy-products.png" alt="user_icon">
                        </div>
                        <h1><%= m.get("productCount") %></h1>
                        
                        <h1 class="text-uppercase text-muted">Products</h1>
                    </div>
                    
                </div>
                
                
            </div>
            
        </div>
            <!-- second row -->
            <div class="row mt-3">
                
                <div class="col-md-6 d-flex align-items-stretch">
                    
                    <div class="card w-100" data-toggle="modal" data-target="#add-category-modal">
                    
                    <div class="card-body text-center">
                        
                        <div class="container">
                            
                            <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon">
                        </div>
                       
                        <p class="mt-3">Click here to add new category</p>
                        <h1 class="text-uppercase text-muted">Add Category</h1>
                    </div>
                    
                </div>
                    
                </div>
                
                <div class="col-md-6 d-flex align-items-stretch">
                    
                    <div class="card w-100" data-toggle="modal" data-target="#add-product-modal">
                    
                    <div class="card-body text-center">
                        
                        <div class="container">
                            
                            <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon">
                        </div>
                        <p class="mt-3">Click here to add new product</p>
                        <h1 class="text-uppercase text-muted">Add Product</h1>
                    </div>
                    
                </div>
                    
                </div>
                
            </div>         
</div>

<!--category modal -->


<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog moddal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post">
              
              <input type="hidden" name="operation" value="addCategory">
              
              <div class="form-group">
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter category details" required>
              </div>
              <div class="form-group">
                  <textarea style="height: 250px;" class="form-control" name="catDescription" placeholder="Enter category description" required></textarea>
              </div> 
              <div class="container text-center">
                  <button class="btn btn-outline-success">Add Category</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      
              </div>
              
          </form>
          
          
      </div>
      <div class="modal-footer">
        </div>
    </div>
  </div>
</div>
<!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
<!--add product modal -->


<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!--form-->
        
        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
            
            <input type="hidden" name="operation" value="addProduct" />
            
            
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Enter title of the product" name="pName" required/>
                
            </div>
            
            <div class="form-group">
                <textarea style="height: 150px;" class="form-control" placeholder="Enter product description" name="pDescription"></textarea>
            </div>
            
            <div class="form-group">
               <input type="number" class="form-control" placeholder="Enter price of the product" name="pPrice" required/>

            </div>
            
            <div class="form-group">
               <input type="number" class="form-control" placeholder="Enter product Discount" name="pDiscount" required/>

            </div>
            
            <div class="form-group">
               <input type="number" class="form-control" placeholder="Enter product Quantity" name="pQuantity" required/>

            </div>
            
            <!--product category-->
            
            
            
            <div class="form-group">
                <select name="catId" class="form-control">
                    
                    <%
                    for(Category c: list){
                    %>
                    
                    <option value="<%=c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                    <% }%>
                    
                </select>
                
            </div>
            
                    
            <!--product file-->
            
            <div class="form-group">
                <label for="pPhoto">Select picture of the product</label>
                <br>
                <input type="file" name="pPhoto" required />
                
            </div>
            
            <div class="container text-center">
                <button class="btn btn-outline-success">Add product</button>
            </div>
            
        </form>
    
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


    <%@include file="components/common_modals.jsp" %>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
          })
    </script>
    </body>
</html>
