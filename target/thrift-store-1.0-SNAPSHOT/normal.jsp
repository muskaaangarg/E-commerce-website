

<%@page import="com.learn.thriftstore.helper.Helper"%>
<%@page import="com.learn.thriftstore.entities.Category"%>
<%@page import="com.learn.thriftstore.dao.CategoryDao"%>
<%@page import="com.learn.thriftstore.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.thriftstore.helper.FactoryProvider"%>
<%@page import="com.learn.thriftstore.dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <body>
        
        <%@include file="components/navbar.jsp" %>
        
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            
            
            <%
              
            String cat=request.getParameter("category");
              
            
            
            ProductDao dao=new ProductDao(FactoryProvider.getfactory());
            List<Product> list = null;
            if(cat!=null && !cat.trim().isEmpty() ){
            if (cat.trim().equals("all")) {
            
                list = dao.getAllProducts();
            
                }else {
                    try{
                    int cid=Integer.parseInt(cat.trim());
                    list = dao.getAllProductsById(cid);
                }catch(NumberFormatException e){
                list=dao.getAllProducts();
                }
                 }}else{
                        list=dao.getAllProducts();
                        }
            
            
            CategoryDao cdao=new CategoryDao(FactoryProvider.getfactory());
            List<Category> clist=cdao.getCategeories();

            %>
            
            
            <!--show categories -->
            <div class="col-md-2">
                
                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                      All products
                    </a>

                <%
                for(Category c: clist){
                
                %>
                
                <a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                    
                <%   
                }
                %>
                
                </div>

            </div>
                
            <!--show products -->
            
            <div class="col-md-10">
                
                <!--row -->
                <div class="row mt-4">
                    
                   <!--column:12 -->
                   <div class="col md-12">
                       
                       <div class="card-columns">
                           
                           <!--traversing products-->
                           <% 
                           for(Product p: list){
                           
                           %>
                           
                           
                           <!--product card--> 
                           <div class="card product-card">
                               
                               <div class="conatiner text-center">
                                   <img src="img/products/<%= p.getpPhoto() %>" style="max-height: 200px; max-width: 100%; width: auto; " class="card-img-top m-2">
                               </div>
                               
                               <div class="card-body">
                                   <h5 class="card-title"><%= p.getpName() %></h5>
                                   
                                   <p class="card-text">
                                       <%= Helper.get10Words(p.getpDescription()) %>
                                   </p>
                                   
                                   
                           </div>
                           
                                   <div class="card-footer text-center">
                                       
                                       <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId() %>, '<%= p.getpName().replace("'", "\\'") %>', <%= p.getPriceAfterAppplyingDiscount() %>)">
                                       Add to Cart
                                       </button>
                                       <button class="btn btn-outline-success">
                                           &#8377; <%= p.getPriceAfterAppplyingDiscount()%>/- <span class="text-secondary discount-label"> &#8377; <%= p.getpPrice() %> <%= p.getpDiscount() %>% off)</span>
                                       </button>
                                       
                                   </div>
                                   
                       </div>
                       <%}
                       if (list.size()==0){
                       out.println("<h3>No item in this category</h3>");
                        }
                       
                       %>
                       
                   </div> 
                </div>
                
                
            </div>
        </div>
        </div>
        </div>
                       
                       
        <%@include file="components/common_modals.jsp" %>
        <script src="<%= request.getContextPath() %>/js/script.js"></script>
    </body>
    </body>
</html>
