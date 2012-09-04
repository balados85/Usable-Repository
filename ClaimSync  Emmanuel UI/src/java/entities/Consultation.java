package entities;
// Generated Sep 4, 2012 2:01:55 PM by Hibernate Tools 3.2.1.GA



/**
 * Consultation generated by hbm2java
 */
public class Consultation  implements java.io.Serializable {


     private Integer conid;
     private String contype;
     private double amount;

    public Consultation() {
    }

    public Consultation(String contype, double amount) {
       this.contype = contype;
       this.amount = amount;
    }
   
    public Integer getConid() {
        return this.conid;
    }
    
    public void setConid(Integer conid) {
        this.conid = conid;
    }
    public String getContype() {
        return this.contype;
    }
    
    public void setContype(String contype) {
        this.contype = contype;
    }
    public double getAmount() {
        return this.amount;
    }
    
    public void setAmount(double amount) {
        this.amount = amount;
    }




}


