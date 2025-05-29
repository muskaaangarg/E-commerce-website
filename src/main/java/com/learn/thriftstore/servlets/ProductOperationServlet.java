
package com.learn.thriftstore.servlets;

import com.learn.thriftstore.dao.CategoryDao;
import com.learn.thriftstore.dao.ProductDao;
import com.learn.thriftstore.entities.Category;
import com.learn.thriftstore.entities.Product;
import com.learn.thriftstore.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            //add category
            //add product
            
            String op=request.getParameter("operation");
            
            if(op.trim().equals("addCategory")){
                
                //add category
                //fetching data
                String title= request.getParameter("catTitle");
            
                String description= request.getParameter("catDescription");
            
                Category category=new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                
                //category database save
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getfactory());
                
                int catId = categoryDao.saveCategory(category);
               // out.println("Category Saved");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category added Successfully: "+catId);
                response.sendRedirect("admin.jsp");
                return;
                
                
                
            }else if (op.trim().equals("addProduct")){
                
                //add product
                String pName = request.getParameter("pName");
                String pDescription = request.getParameter("pDescription");
                int pPrice=Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
                int catId=Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPhoto");
                
                Product p = new Product();
                p.setpName(pName);
                p.setpDescription(pDescription);
                p.setpDiscount(pDiscount);
                p.setpPrice(pPrice);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                
                CategoryDao cdoa = new CategoryDao(FactoryProvider.getfactory());
                Category category = cdoa.getCategoryById(catId);
                
                p.setCategory(category);
                
                //productsave
                ProductDao pdao=new ProductDao(FactoryProvider.getfactory());
                pdao.saveProduct(p);
                
                //pic upload
                
                String path= request.getServletContext().getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
                System.out.println(path);
                
                //uploading code
                try {
                    
                
                FileOutputStream fos=new FileOutputStream(path);
                
                InputStream is=part.getInputStream();
                
                //reading data
                byte []data=new byte[is.available()];
                is.read(data);
                
                //writing data
                fos.write(data);
                fos.close();
                
                }catch (Exception e) {
                        e.printStackTrace();
                }
                
                
                out.println("Product Save Success.....");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Product is added successfully!!");
                response.sendRedirect("admin.jsp");
                return;
                
                
                
            }
            
            
            
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
