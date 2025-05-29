
package com.learn.thriftstore.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int pId;
    private String pName;
    @Column(length=3000)
    private String pDescription;
    private String pPhoto;
    private int pPrice;
    private int pDiscount;
    private int pQuantity;
    @ManyToOne
    @JoinColumn (name = "category_categoryId")
    private Category category;
    
    public Product() {
    }

    public Product(String pName, String pDescription, String pPhoto, int pPrice, int pDiscount, int pQuantity, Category category) {
        this.pName = pName;
        this.pDescription = pDescription;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.category=category;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDescription() {
        return pDescription;
    }

    public void setpDescription(String pDescription) {
        this.pDescription = pDescription;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    
    @Override
    public String toString() {
        return "Product{" + "pId=" + pId + ", pName=" + pName + ", pDescription=" + pDescription + ", pPhoto=" + pPhoto + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + '}';
    }
    
//    calculate price after discount
    public int getPriceAfterAppplyingDiscount(){
        int d=(int) ((this.getpDiscount()/100.0)*this.getpPrice());
        return this.getpPrice() - d;
        
    }
    
    
    
}
