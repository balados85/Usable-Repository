package entities;
// Generated Aug 14, 2012 11:11:34 AM by Hibernate Tools 3.2.1.GA



/**
 * Investigation generated by hbm2java
 */
public class Investigation  implements java.io.Serializable {


     private Integer investigationId;
     private String investigation;
     private double price;

    public Investigation() {
    }

    public Investigation(String investigation, double price) {
       this.investigation = investigation;
       this.price = price;
    }
   
    public Integer getInvestigationId() {
        return this.investigationId;
    }
    
    public void setInvestigationId(Integer investigationId) {
        this.investigationId = investigationId;
    }
    public String getInvestigation() {
        return this.investigation;
    }
    
    public void setInvestigation(String investigation) {
        this.investigation = investigation;
    }
    public double getPrice() {
        return this.price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }




}


