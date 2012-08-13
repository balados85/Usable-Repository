package entities;
// Generated Aug 13, 2012 3:00:10 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * ItemsTable generated by hbm2java
 */
public class ItemsTable  implements java.io.Serializable {


     private Integer itemsId;
     private String code;
     private String items;
     private int quantity;
     private String unit;
     private double price;
     private String supplier;
     private Date date;
     private Date expDate;
     private String itemType;
     private String drugType;
     private int RQuantity;
     private int EQuantity;
     private String locationId;

    public ItemsTable() {
    }

    public ItemsTable(String code, String items, int quantity, String unit, double price, String supplier, Date date, Date expDate, String itemType, String drugType, int RQuantity, int EQuantity, String locationId) {
       this.code = code;
       this.items = items;
       this.quantity = quantity;
       this.unit = unit;
       this.price = price;
       this.supplier = supplier;
       this.date = date;
       this.expDate = expDate;
       this.itemType = itemType;
       this.drugType = drugType;
       this.RQuantity = RQuantity;
       this.EQuantity = EQuantity;
       this.locationId = locationId;
    }
   
    public Integer getItemsId() {
        return this.itemsId;
    }
    
    public void setItemsId(Integer itemsId) {
        this.itemsId = itemsId;
    }
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    public String getItems() {
        return this.items;
    }
    
    public void setItems(String items) {
        this.items = items;
    }
    public int getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public String getUnit() {
        return this.unit;
    }
    
    public void setUnit(String unit) {
        this.unit = unit;
    }
    public double getPrice() {
        return this.price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }
    public String getSupplier() {
        return this.supplier;
    }
    
    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
    public Date getExpDate() {
        return this.expDate;
    }
    
    public void setExpDate(Date expDate) {
        this.expDate = expDate;
    }
    public String getItemType() {
        return this.itemType;
    }
    
    public void setItemType(String itemType) {
        this.itemType = itemType;
    }
    public String getDrugType() {
        return this.drugType;
    }
    
    public void setDrugType(String drugType) {
        this.drugType = drugType;
    }
    public int getRQuantity() {
        return this.RQuantity;
    }
    
    public void setRQuantity(int RQuantity) {
        this.RQuantity = RQuantity;
    }
    public int getEQuantity() {
        return this.EQuantity;
    }
    
    public void setEQuantity(int EQuantity) {
        this.EQuantity = EQuantity;
    }
    public String getLocationId() {
        return this.locationId;
    }
    
    public void setLocationId(String locationId) {
        this.locationId = locationId;
    }




}


