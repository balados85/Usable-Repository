/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import helper.HibernateUtil;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author afuaantwi
 */
public class HMSHelper {

    Session session = null;

    public HMSHelper() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    /*
     * Creating or adding new instances / rows into the database
     */

    public Patient createPatient(String patientid, String fname, String lname, String midname, String gender, String Address, String employer, String dob, String contact, String emergencyperson, String emergencycontact, String email) throws Exception {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Patient patient = new Patient();
        DateFormat formatter;
        Date date;
        formatter = new SimpleDateFormat("yyyy-MM-dd");
        date = (Date) formatter.parse(dob);
        patient.setFname(fname);
        patient.setLname(lname);
        patient.setPatientid(patientid);
        patient.setAddress(Address);
        patient.setContact(contact);
        patient.setDateofbirth(date);
        patient.setEmail(email);
        patient.setEmployer(employer);
        patient.setEmergencyperson(emergencyperson);
        patient.setGender(gender);
        patient.setMidname(midname);
        patient.setEmergencycontact(emergencycontact);
        patient.setDateofregistration(new Date());

        session.save(patient);

        session.getTransaction().commit();
        return patient;
    }

    public Folder createFolder(String foldernumber, String shelvenumber, String status, String previouslocation) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Folder folder = new Folder();
        folder.setFoldernumber(foldernumber);
        folder.setShelvenumber(shelvenumber);
        folder.setStatus(status);
        folder.setPreviouslocation(previouslocation);
        session.save(folder);
        session.getTransaction().commit();
        return folder;

    }

    public Sponsorship createSponsor(String sponsorName, String sponsorType, String sponsorAddress, String sponsorContact, String sponsorEmail) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Sponsorship sponsor = new Sponsorship();
        sponsor.setAddress(sponsorAddress);
        sponsor.setContact(sponsorContact);
        sponsor.setEmail(sponsorEmail);
        sponsor.setSponsorname(sponsorName);
        sponsor.setType(sponsorType);
        session.save(sponsor);
        session.getTransaction().commit();
        return sponsor;
    }

    public Sponsorhipdetails createPatientSponsorshipDetails(String patientID, String membershipID, String type, String benefitPlan, int companyName) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Sponsorhipdetails sponsorDetails = new Sponsorhipdetails();
        sponsorDetails.setPatientid(patientID);
        sponsorDetails.setBenefitplan(benefitPlan);
        sponsorDetails.setSponsorid(companyName);
        sponsorDetails.setType(type);
        sponsorDetails.setMembershipid(membershipID);
        session.save(sponsorDetails);
        session.getTransaction().commit();
        return sponsorDetails;
    }

    public Units addUnit(String name) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Units unit = new Units();
        unit.setUnitname(name);

        session.save(unit);
        session.getTransaction().commit();
        return unit;
    }

    public Ward addWard(String name, int numberofbeds) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Ward unit = new Ward();
        unit.setWardname(name);
        unit.setNumberofbeds(numberofbeds);
        unit.setOccupied(0);

        session.save(unit);
        session.getTransaction().commit();
        return unit;
    }

    public Admissionnotes addAdmissionNoteint (int visitid, String doctorid, String note) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Admissionnotes admissionnotes = new Admissionnotes();
        admissionnotes.setDoctorsid(doctorid);
        admissionnotes.setNote(note);
        admissionnotes.setVisitid(visitid);
        admissionnotes.setDate(new Date());

        session.save(admissionnotes);
        session.getTransaction().commit();
        return admissionnotes;
    }

    public Consultingrooms addConRoom(String name) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Consultingrooms conroom = new Consultingrooms();
        conroom.setConsultingroom(name);

        session.save(conroom);
        session.getTransaction().commit();
        return conroom;
    }

    public Visitationtable createNewVisit(String patientID, String doctor, String vitals, String status) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Visitationtable visitation = new Visitationtable();
        visitation.setPatientid(patientID);
        visitation.setVitals(vitals);
        visitation.setDoctor(doctor);
        visitation.setDate(new Date());
        visitation.setStatus(status);
        visitation.setPatientstatus("Out Patient");
        //visitation.setAdmissiondate(new Date());
       // visitation.setDischargedate(discharge);
        visitation.setPreviouslocstion("Records");
        session.save(visitation);
        session.getTransaction().commit();
        return visitation;
    }

    public ItemsTable addItem(String code, String items, int quantity, String unit, double price, String supplier, Date date, Date expDate, int Equantity, int Rquantity, String drug, String type, String locationId) throws ParseException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        ItemsTable item = new ItemsTable();
        item.setCode(code);
        item.setItems(items);
        item.setQuantity(quantity);
        item.setUnit(unit);
        item.setPrice(price);
        item.setSupplier(supplier);
        item.setDate(date);
        item.setExpDate(expDate);

        item.setDrugType(drug);
        item.setItemType(type);
        item.setRQuantity(Rquantity);
        item.setEQuantity(Equantity);
        item.setLocationId(locationId);
        session.save(item);
        session.getTransaction().commit();
        return item;
    }

    public Treatment createNewVisit(String treatment) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Treatment treatmentObj = new Treatment();
        treatmentObj.setTreatment(treatment);

        session.save(treatmentObj);
        session.getTransaction().commit();
        return treatmentObj;
    }

    public Diagnosis addANewDiagnosis(String code, String diagnosis) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Diagnosis diagnosisObj = new Diagnosis();
        diagnosisObj.setDiagnosisCode(code);
        diagnosisObj.setDiagnosis(diagnosis);

        session.save(diagnosisObj);
        session.getTransaction().commit();
        return diagnosisObj;
    }

    public Investigation addAnInvestigation(String investigation) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Investigation investigationObj = new Investigation();
        investigationObj.setInvestigation(investigation);

        session.save(investigationObj);
        session.getTransaction().commit();
        return investigationObj;
    }

    public Patientinvestigation addPatientInvestigation(String patientid, String code, int investigationid, String result, Double price, int visitationid, String visitDate, String performed, String notes, int qty) throws ParseException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        DateFormat formatter;
        Date date;
        formatter = new SimpleDateFormat("yyyy-MM-dd");
        date = (Date) formatter.parse(visitDate);

        Patientinvestigation patientInvestigation = new Patientinvestigation();
        //patientInvestigation.setId(patientid);
        patientInvestigation.setCode(code);
        patientInvestigation.setPrice(price);
        //patientInvestigation.setInvestigation(investigation);
        patientInvestigation.setInvestigationid(investigationid);
        patientInvestigation.setResult(result);
        patientInvestigation.setDate(date);
        patientInvestigation.setPatientid(patientid);
        patientInvestigation.setVisitationid(visitationid);
        patientInvestigation.setPerformed(performed);
        patientInvestigation.setNote(notes);
        patientInvestigation.setQuantity(qty);

        session.save(patientInvestigation);
        session.getTransaction().commit();
        return patientInvestigation;
    }

    public Patienttreatment addPatientTreatment(String patientid, String code, int treatementid, String dosage, Double price, String dispensed, int visitationid, String visitDate, String notes, int qty, String type) throws ParseException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Date date;
        SimpleDateFormat formatter;
        formatter = new SimpleDateFormat("yyyy-MM-dd");
        date = (Date) formatter.parse(visitDate);

        Patienttreatment patientTreatment = new Patienttreatment();
        patientTreatment.setDate(date);
        patientTreatment.setCode(code);
        patientTreatment.setPrice(price);
        patientTreatment.setDispensed(dispensed);
        patientTreatment.setDosage(dosage);
        patientTreatment.setPatientid(patientid);
        patientTreatment.setTreatmentid(treatementid);
        // patientTreatment.setTreatment(treatement);
        patientTreatment.setNote(notes);
        patientTreatment.setQuantity(qty);
        patientTreatment.setType(type);
        patientTreatment.setVisitationid(visitationid);

        session.save(patientTreatment);
        session.getTransaction().commit();
        return patientTreatment;
    }

    public Patientdiagnosis addPatientDiagnosis(String patientid, int diagnosisid, String code, int visitationid, String visitDate) throws ParseException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        DateFormat formatter;
        Date date;
        formatter = new SimpleDateFormat("yyyy-MM-dd");
        date = (Date) formatter.parse(visitDate);

        Patientdiagnosis patientdiagnosis = new Patientdiagnosis();
        patientdiagnosis.setDate(date);
        //patientdiagnosis.setDiagnosis(diagnosis);
        patientdiagnosis.setDiagnosisid(diagnosisid);
        patientdiagnosis.setCode(code);
        patientdiagnosis.setPatientid(patientid);
        patientdiagnosis.setVisitationid(visitationid);

        session.save(patientdiagnosis);
        session.getTransaction().commit();
        return patientdiagnosis;
    }
    
    public Dosagemonitor addDosageMonitor(int visitid, int patienttreatmentid, String morning, String afternoon, String evening, Date givenday) throws ParseException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        
        Dosagemonitor dosagemonitor = new Dosagemonitor();
        dosagemonitor.setAfternoon("No");
        dosagemonitor.setEvening("No");
        dosagemonitor.setGivenday(givenday);
        dosagemonitor.setMorning("No");
        dosagemonitor.setPatienttreatmentid(patienttreatmentid);
        dosagemonitor.setVisitid(visitid);

        session.save(dosagemonitor);
        session.getTransaction().commit();
        return dosagemonitor;
    }
    
    public Newborn addNewborn(Date year, String month, String day, Date time, String patientid, String supervisor, String complications) throws ParseException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        
        Newborn newborn = new Newborn();
        newborn.setComplications(complications);
        newborn.setDay(day);
        newborn.setMomsid(patientid);
        newborn.setMonth(month);
        newborn.setSupervisingmidwife(supervisor);
        newborn.setTime(time);
        newborn.setYear(year);
        session.save(newborn);
        session.getTransaction().commit();
        return newborn;
    }
    
    public Symptoms addSymptom(String symptomname) throws ParseException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        
        Symptoms symptoms = new Symptoms();
        symptoms.setSymptomname(symptomname);
        session.save(symptoms);
        session.getTransaction().commit();
        return symptoms;
    }

    // Add Item Type
    public Itemtype addType(String itemType) throws ParseException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Itemtype type = new Itemtype();
        type.setItemType(itemType);
        // type.setId(id);
        session.save(type);
        session.getTransaction().commit();
        return type;
    }

    public Drugtype addDrugType(String drugType) throws ParseException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Drugtype type = new Drugtype();
        type.setDrugType(drugType);
        // type.setId(id);
        session.save(type);
        session.getTransaction().commit();
        return type;
    }

    // below is for posting to other units
    public Receive postItems(Date date, String items, String itemId, int quantity, String unit, String receiver, String transactionId, int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        // Query result = session.createQuery("update ItemsTable set items='"+items+"',quantity="+quantity+",price="+price+",date='"+date+"', exp_date='"+expDate+"' where items_id = "+id);

        //  Receive itm = (Receive) session.get(Receive.class, id);
        // System.out.println(items+" "+quantity+" "+price+" "+date+" "+expDate+" "+id);
        Receive itm = new Receive();
        itm.setDate(date);
        itm.setItems(items);
        itm.setItemId(itemId);
        itm.setQuantity(quantity);
        itm.setUnit(unit);
        itm.setReceiver(receiver);
        itm.setTransactionId(transactionId);
        itm.setId(id);
        session.save(itm);
        session.getTransaction().commit();
        return itm;
    }

    // below are for supliers 
    public Post addSupplier(Date date, String firstName, String lastName, String address, String tellNumber, String item, int quantity) throws ParseException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Post sup = new Post();
        sup.setDate(date);
        sup.setFirstName(firstName);
        sup.setLastName(lastName);
        sup.setAddress(address);
        sup.setTellNumber(tellNumber);
        sup.setItemSupplied(item);
        sup.setQuantity(quantity);
        session.save(sup);
        session.getTransaction().commit();
        return sup;
    }

    /*
     * End of database additions
     *
     * Querying the database for a list of objects 
     */
    public List listSponsors() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Sponsorship").list();
        session.getTransaction().commit();
        return result;
    }

    public List listFolders() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Folder").list();
        session.getTransaction().commit();
        return result;
    }

    public List listPatients() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Patient").list();
        session.getTransaction().commit();
        return result;
    }

    public List listUnits() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Units").list();
        session.getTransaction().commit();
        return result;
    }
    
    public List listPatientAdmissionNote(int visitid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Admissionnotes where visitid="+visitid).list();
        session.getTransaction().commit();
        return result;
    }

    public List listConRooms() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Consultingrooms").list();
        session.getTransaction().commit();
        return result;
    }

    public List listVisitations() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Visitationtable").list();
        session.getTransaction().commit();
        return result;
    }

    public List listVisitations(String patiencestatus) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Visitationtable where patiencestatus ='" + patiencestatus + "'").list();
        session.getTransaction().commit();
        return result;
    }

    public List listUnitVisitations(String status, String today) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Visitationtable where status='" + status + "' and date='" + today + "'").list();
        session.getTransaction().commit();
        return result;
    }

    public List listRecentVisits(String today) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Visitationtable where date='" + today + "'").list();
        session.getTransaction().commit();
        return result;
    }
    
    public List listRecentVisits(String today, String pstatus) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Visitationtable where date='" + today + "' and patientstatus='"+pstatus+"'").list();
        session.getTransaction().commit();
        return result;
    }

    public List patientHistory(String patientid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Visitationtable where patientid='" + patientid + "'").list();
        session.getTransaction().commit();
        return result;
    }
    
    public List patientAdmissionHistory(String patientid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Visitationtable where patientid='" + patientid + "' and patientstatus='In Patient'").list();
        session.getTransaction().commit();
        return result;
    }

    public List listDiagnosis() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Diagnosis").list();
        session.getTransaction().commit();
        return result;
    }

    public List listDiagnosisShow(String letters) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Diagnosis WHERE diagnosis like %'" + letters + "%'").list();
        session.getTransaction().commit();
        return result;
    }

    public List listTreatmentShow(String letters) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Treatment WHERE treatment like %'" + letters + "%'").list();
        session.getTransaction().commit();
        return result;
    }

    public List listInvestigationShow(String letters) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Investigation WHERE investigation like %'" + letters + "%'").list();
        session.getTransaction().commit();
        return result;
    }

    public List listNhisInvesigation(String letters) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Nhisinvestigation WHERE investigation like %'" + letters + "%'").list();
        session.getTransaction().commit();
        return result;
    }

    public List listNhisTreatment(String letters) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Nhistreatment WHERE drug like %'" + letters + "%'").list();
        session.getTransaction().commit();
        return result;
    }

    public List listNhisInvesigation() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Nhisinvestigation").list();
        session.getTransaction().commit();
        return result;
    }

    public List listNhisTreatment() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Nhistreatment").list();
        session.getTransaction().commit();
        return result;
    }

    public List listInvestigation() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Investigation").list();
        session.getTransaction().commit();
        return result;
    }

    public List listTreatments() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Treatment").list();
        session.getTransaction().commit();
        return result;
    }
    
    public List listDosageMonitor(int visitid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Dosagemonitor where visitid="+visitid).list();
        session.getTransaction().commit();
        return result;
    }

    public List patientDiagnosis(int visitationid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Patientdiagnosis where visitationid=" + visitationid).list();
        session.getTransaction().commit();
        return result;
    }

    public List patientTreatment(int visitationid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Patienttreatment where visitationid=" + visitationid).list();
        session.getTransaction().commit();
        return result;
    }

    public List patientInvestigation(int visitationid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Patientinvestigation where visitationid=" + visitationid).list();
        session.getTransaction().commit();
        return result;
    }

    public List listItems() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from ItemsTable").list();
        session.getTransaction().commit();
        return result;
    }

    public List listCategory(String type) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("itemType from ItemsTable").list();
        session.getTransaction().commit();
        return result;
    }

    public List CheckItems() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from ItemsTable where (exp_Date < curdate() or exp_Date = curdate())").list();
        session.getTransaction().commit();
        return result;
    }

    public List EditItems(int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from ItemsTable where items_id =" + id).list();
        session.getTransaction().commit();
        return result;
    }

    public List EditSups(int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Post where id =" + id).list();
        session.getTransaction().commit();
        return result;
    }

    public List searchItems(String items) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from ItemsTable where items like '%" + items + "%' ").list();
        session.getTransaction().commit();
        return result;
    }

    public List searchByCategory(String types) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from ItemsTable where itemType = '" + types + "' ").list();
        session.getTransaction().commit();
        return result;
    }

    public List listItemType() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Itemtype ").list();
        session.getTransaction().commit();
        return result;
    }

    public List listDrugType() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Drugtype ").list();
        session.getTransaction().commit();
        return result;
    }

    public List listAllPatientTreatmentsForDate(Date specificDate) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Patienttreatment where date = '" + specificDate + "'").list();
        session.getTransaction().commit();
        return result;
    }

    public List listAllPatientTreatmentsForDuration(Date startDate, Date endDate) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Patienttreatment where date between '" + startDate + "' and '" + endDate + "'").list();
        session.getTransaction().commit();
        return result;
    }

    public List listAllPatientInvestigationForDate(Date specificDate) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Patientinvestigation where date = '" + specificDate + "'").list();
        session.getTransaction().commit();
        return result;
    }

    public List listAllPatientInvestigationForDuration(Date startDate, Date endDate) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Patientinvestigation where date between '" + startDate + "' and '" + endDate + "'").list();
        session.getTransaction().commit();
        return result;
    }
    
    public List listAllPatientBabies(String patientid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Newborn where momsid = '" + patientid + "'").list();
        session.getTransaction().commit();
        return result;
    }

    /* public List listPatien(Date startDate, Date endDate) {
     session = HibernateUtil.getSessionFactory().getCurrentSession();
     session.beginTransaction();
     List result = session.createQuery("from Patientinvestigation where date between '" + startDate + "' and '" + endDate + "'").list();
     session.getTransaction().commit();
     return result;
     }*/
    public List patientHistoryForDate(String patientid, Date date) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        String query = "from Visitationtable where patientid='" + patientid + "' and date = '" + date + "'";
        System.out.println("query : " + query);
        List result = session.createQuery(query).list();
        session.getTransaction().commit();
        return result;
    }

    public List patientHistoryForDateDuration(String patientid, Date startDate, Date endDate) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        String query = "from Visitationtable where patientid='" + patientid + "' and date between '" + startDate + "' and '" + endDate + "'";
        System.out.println("query : " + query);
        List result = session.createQuery(query).list();
        session.getTransaction().commit();
        return result;
    }
    
    public List listNewbornByYear(Date year) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        String query = "from Newborn where year='" + year + "'";
        System.out.println("query : " + query);
        List result = session.createQuery(query).list();
        session.getTransaction().commit();
        return result;
    }
    
    public List listNewbornByYearNMonth(Date year, String month) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        String query = "from Newborn where year='" + year + "' and month= '" + month + "'";
        System.out.println("query : " + query);
        List result = session.createQuery(query).list();
        session.getTransaction().commit();
        return result;
    }
    
    public List listNewbornBetweenYears(Date startYear, Date endYear) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        String query = "from Newborn between year='" + startYear + "' and year='"+endYear+"'";
        System.out.println("query : " + query);
        List result = session.createQuery(query).list();
        session.getTransaction().commit();
        return result;
    }
    
    public List listNewbornDay(Date startYear, String month, String day) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        String query = "from Newborn where year='" + startYear + "' and month='" + month + "' and day = '" + day + "'";
        System.out.println("query : " + query);
        List result = session.createQuery(query).list();
        session.getTransaction().commit();
        return result;
    }
    
    public List listNewbornBetweenYearNMonth(Date startYear, String startMonth, Date endYear, String endMonth) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        String query = "from Newborn between (year='" + startYear + "' and month= '" + startMonth + "') and (year='"+endYear+"' month='"+endMonth+"')";
        System.out.println("query : " + query);
        List result = session.createQuery(query).list();
        session.getTransaction().commit();
        return result;
    }

    public List listAllPatientInvestigation() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Patientinvestigation").list();
        session.getTransaction().commit();
        return result;
    }

    public List listAllPatientTreatments() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Patienttreatment").list();
        session.getTransaction().commit();
        return result;
    }

    public List postItem(int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from ItemsTable where items_id =" + id + "").list();
        session.getTransaction().commit();
        return result;
    }

    public List listRecievers() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Receive ").list();
        session.getTransaction().commit();
        return result;
    }

    public List listSuppliers() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Post ").list();
        session.getTransaction().commit();
        return result;
    }

    public List listWard() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Ward").list();
        session.getTransaction().commit();
        return result;
    }

    public List listSymptoms() {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        List result = session.createQuery("from Symptoms").list();
        session.getTransaction().commit();
        return result;
    }
    /*
     * End of methods for collecting /retrieving objects
     * 
     * Update database rows
     */
    public Folder updateFolderLocation(String lastlocation, String currentlocation, String foldernumber) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Folder folder = (Folder) session.get(Folder.class, foldernumber);

        folder.setStatus(currentlocation);
        folder.setPreviouslocation(lastlocation);
        session.update(folder);
        session.getTransaction().commit();
        return folder;
    }

    public Sponsorhipdetails updatePatientSponsorDetails(String benefitplan, String type, String membershipid, String patientid, int sponsorid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Sponsorhipdetails details = (Sponsorhipdetails) session.get(Sponsorhipdetails.class, patientid);

        details.setBenefitplan(benefitplan);
        details.setMembershipid(membershipid);
        details.setPatientid(patientid);
        details.setSponsorid(sponsorid);
        details.setType(type);
        session.update(details);
        session.getTransaction().commit();
        return details;
    }

    public Visitationtable updateVisitation(String patientid, int visitid, String status, String vitals,String previouslocation) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Visitationtable visit = (Visitationtable) session.get(Visitationtable.class, visitid);

        visit.setStatus(status);
        visit.setVitals(vitals);
        //visit.setPatientstatus(patientStatus);
        session.update(visit);
        visit.setPreviouslocstion(previouslocation);
        session.getTransaction().commit();
        return visit;
    }

    public Patienttreatment updatePatientTreatment(int ptid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Patienttreatment folder = (Patienttreatment) session.get(Patienttreatment.class, ptid);
        folder.setDispensed("yes");
        session.update(folder);
        session.getTransaction().commit();
        return folder;
    }

    public Patientinvestigation updatePatientInvestigation(int ptid, String result) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Patientinvestigation folder = (Patientinvestigation) session.get(Patientinvestigation.class, ptid);
        folder.setResult(result);
        folder.setPerformed("yes");
        session.update(folder);
        session.getTransaction().commit();
        return folder;
    }

    public Visitationtable updateVisitationStatus(int visitid, String status, String previouslocation) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Visitationtable visit = (Visitationtable) session.get(Visitationtable.class, visitid);

        visit.setStatus(status);
        visit.setPreviouslocstion(previouslocation);
        // visit.setVitals(vitals);
        session.update(visit);
        session.getTransaction().commit();
        return visit;
    }

    public Visitationtable admitPatience(int visitid, String patiencestatus, Date admissiondate) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Visitationtable visit = (Visitationtable) session.get(Visitationtable.class, visitid);

        visit.setAdmissiondate(admissiondate);
        visit.setPatientstatus(patiencestatus);
        //visit.setPreviouslocstion(previouslocation);
        // visit.setVitals(vitals);
        session.update(visit);
        session.getTransaction().commit();
        return visit;
    }

    public Visitationtable dischargePatience(int visitid, String patiencestatus, Date dischargedate) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Visitationtable visit = (Visitationtable) session.get(Visitationtable.class, visitid);

        visit.setDischargedate(dischargedate);
        visit.setPatientstatus(patiencestatus);
        //visit.setPreviouslocstion(previouslocation);
        // visit.setVitals(vitals);
        session.update(visit);
        session.getTransaction().commit();
        return visit;
    }

    public ItemsTable updateItem(String code, String items, int quantity, double price, Date date, int Equantity, int Rquantity, String drug, String type, String locationId, int id) throws ParseException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        ItemsTable item = (ItemsTable) session.get(ItemsTable.class, id);
        item.setCode(code);
        item.setItems(items);
        item.setQuantity(quantity);
        //  item.setUnit(unit);
        item.setPrice(price);
        //item.setSupplier(supplier);
        item.setDate(date);
        // item.setExpDate(expDate);

        item.setDrugType(drug);
        item.setItemType(type);
        item.setRQuantity(Rquantity);
        item.setEQuantity(Equantity);
        item.setLocationId(locationId);
        session.update(item);
        session.getTransaction().commit();
        return item;
    }

    public ItemsTable updateItems(String items, int quantity, double price, Date date, Date expDate, int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        // Query result = session.createQuery("update ItemsTable set items='"+items+"',quantity="+quantity+",price="+price+",date='"+date+"', exp_date='"+expDate+"' where items_id = "+id);

        ItemsTable itm = (ItemsTable) session.get(ItemsTable.class, id);
        System.out.println(items + " " + quantity + " " + price + " " + date + " " + expDate + " " + id);
        itm.setItems(items);
        itm.setQuantity(quantity);
        itm.setPrice(price);
        itm.setDate(date);
        itm.setExpDate(expDate);
        itm.setItemsId(id);
        session.update(itm);
        session.getTransaction().commit();
        return itm;
    }

    public Post updateSupplier(Date date, String firstName, String lastName, String address, String tellNumber, String item, int quantity, int id) throws ParseException {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Post sup = (Post) session.get(Post.class, id);
        sup.setDate(date);
        sup.setFirstName(firstName);
        sup.setLastName(lastName);
        sup.setAddress(address);
        sup.setTellNumber(tellNumber);
        sup.setItemSupplied(item);
        sup.setQuantity(quantity);
        session.update(sup);
        session.getTransaction().commit();
        return sup;
    }

    public Ward updateWardInfo(int wardid, String name, int numberofbeds, int occupied) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Ward ward = (Ward) session.get(Ward.class, wardid);
        ward.setWardname(name);
        ward.setOccupied(occupied);
        ward.setNumberofbeds(numberofbeds);
        //visit.setPreviouslocstion(previouslocation);
        // visit.setVitals(vitals);
        session.update(ward);
        session.getTransaction().commit();
        return ward;
    }

    public Ward updateWardInfo(int wardid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Ward ward = (Ward) session.get(Ward.class, wardid);
        ward.setOccupied(ward.getOccupied()+1);

        session.update(ward);
        session.getTransaction().commit();
        return ward;
    }
    
    public Dosagemonitor updateDosage(int dosageid, String morning, String afternoon, String evening, int patientTreatmentid, int visitid, Date date) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Dosagemonitor dosagemonitor = (Dosagemonitor) session.get(Dosagemonitor.class, dosageid);
        dosagemonitor.setAfternoon(afternoon);
        dosagemonitor.setEvening(evening);
        dosagemonitor.setGivenday(date);
        dosagemonitor.setMorning(morning);
        dosagemonitor.setPatienttreatmentid(patientTreatmentid);
        dosagemonitor.setVisitid(visitid);
        //dosagemonitor.increaseOccupancy();

        session.update(dosagemonitor);
        session.getTransaction().commit();
        return dosagemonitor;
    }
    
    public Symptoms updateSymptom(int symptomid,String symptomname) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Symptoms symptoms = (Symptoms) session.get(Symptoms.class, symptomid);
        symptoms.setSymptomname(symptomname);

        session.update(symptoms);
        session.getTransaction().commit();
        return symptoms;
    }
    
    public Newborn updateNewbornInfo(int newbornid,Date year, String month, String day, Date time, String patientid, String midwife, String complications) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Newborn newborn = (Newborn) session.get(Newborn.class, newbornid);
        newborn.setComplications(complications);
        newborn.setDay(day);
        newborn.setMomsid(patientid);
        newborn.setMonth(month);
        newborn.setSupervisingmidwife(midwife);
        newborn.setTime(time);
        newborn.setYear(year);

        session.update(newborn);
        session.getTransaction().commit();
        return newborn;
    }
    
    /*
     * End of the collection of methods for updating objects and rows
     * 
     * Following is a collection of methods the retrieve a singular object/row
     */

    public Sponsorhipdetails sponsorshipDetails(String patientid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Sponsorhipdetails sponsorship = (Sponsorhipdetails) session.get(Sponsorhipdetails.class, patientid);

        session.getTransaction().commit();
        return sponsorship;
    }

    public Patient getPatientByID(String patientid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Patient patient = (Patient) session.get(Patient.class, patientid);

        session.getTransaction().commit();
        return patient;
    }

    public Patient getPatientByName(String fname, String lname) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Patient p = (Patient) session.createQuery("from Patient Where (fname = '" + fname + " and lname = '" + lname + "') OR (fname = '" + lname + " and lname = '" + fname + "')").list().get(0);
        session.getTransaction().commit();
        return p;
    }

    public Sponsorhipdetails getSearchedSpID(String membershipid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Sponsorhipdetails p = (Sponsorhipdetails) session.createQuery("from Sponsorshipdetails Where membershipid = '" + membershipid + "'").list().get(0);
        session.getTransaction().commit();
        return p;
    }

    public Visitationtable currentVisitations(int patientid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Visitationtable sponsorship = (Visitationtable) session.get(Visitationtable.class, patientid);

        session.getTransaction().commit();
        return sponsorship;

    }

    public Sponsorship getSponsor(int sponsorid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Sponsorship sponsor = (Sponsorship) session.get(Sponsorship.class, sponsorid);

        session.getTransaction().commit();
        return sponsor;
    }

    public Folder getPatientFolder(String patientid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Folder folder = (Folder) session.get(Folder.class, patientid);

        session.getTransaction().commit();
        return folder;
    }

    public Units getUnit(String unitid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Units units = (Units) session.get(Units.class, unitid);

        session.getTransaction().commit();
        return units;
    }

    public Diagnosis getId(int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Diagnosis diagnosis = (Diagnosis) session.get(Diagnosis.class, id);

        session.getTransaction().commit();
        return diagnosis;
    }

    public Treatment getTreatment(int treatmentid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Treatment treatment = (Treatment) session.get(Treatment.class, treatmentid);

        session.getTransaction().commit();
        return treatment;
    }
    
    public Diagnosis getDiagnosis(int treatmentid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Diagnosis treatment = (Diagnosis) session.get(Diagnosis.class, treatmentid);

        session.getTransaction().commit();
        return treatment;
    }

    public Investigation getInvestigation(int investigationid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Investigation investigationObj = (Investigation) session.get(Investigation.class, investigationid);

        session.getTransaction().commit();
        return investigationObj;
    }
    
    public Ward getWardById(int wardid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Ward ward = (Ward) session.get(Ward.class, wardid);

        session.getTransaction().commit();
        return ward;
    }
    
    public Dosagemonitor getDosageById(int dosageid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Dosagemonitor dosageMonitor = (Dosagemonitor) session.get(Dosagemonitor.class, dosageid);

        session.getTransaction().commit();
        return dosageMonitor;
    }
    
    public Symptoms getSymptomById(int symptomid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Symptoms symptoms = (Symptoms) session.get(Symptoms.class, symptomid);

        session.getTransaction().commit();
        return symptoms;
    }
    
    public Dosagemonitor getDosageByVisitId(int treatmentid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Dosagemonitor dosageMonitor = (Dosagemonitor) session.createQuery("from dosagemonitor where visitid="+treatmentid).list().get(0);

        session.getTransaction().commit();
        return dosageMonitor;
    }
    
    public Newborn getNewbornById(int symptomid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Newborn newborn = (Newborn) session.get(Newborn.class, symptomid);

        session.getTransaction().commit();
        return newborn;
    }
    
    public Newborn getNewbornByPatientVisitId(String patientid) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Newborn newborn = (Newborn) session.createQuery("from newborn where patientid="+patientid).list().get(0);

        session.getTransaction().commit();
        return newborn;
    }
    
    public Admissionnotes getAdmissionNotebyId(int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Admissionnotes dosageMonitor = (Admissionnotes) session.get(Admissionnotes.class, id);

        session.getTransaction().commit();
        return dosageMonitor;
    }


    /*
     * Deleting items from the system
     */
    public ItemsTable deleteItem(int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        //   Query result = session.createQuery("delete from ItemsTable where items_id = "+id);
        ItemsTable itm = (ItemsTable) session.get(ItemsTable.class, id);
        session.delete(itm);
        session.getTransaction().commit();

        return itm;
    }

    public Post deleteSupplier(int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        //   Query result = session.createQuery("delete from ItemsTable where items_id = "+id);
        Post itm = (Post) session.get(Post.class, id);
        session.delete(itm);
        session.getTransaction().commit();

        return itm;
    }

    public Receive deleteReceivers(int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        //   Query result = session.createQuery("delete from ItemsTable where items_id = "+id);
        Receive itm = (Receive) session.get(Receive.class, id);
        session.delete(itm);
        session.getTransaction().commit();

        return itm;
    }

    public Ward deleteWard(int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        //   Query result = session.createQuery("delete from ItemsTable where items_id = "+id);
        Ward ward = (Ward) session.get(Ward.class, id);
        session.delete(ward);
        session.getTransaction().commit();

        return ward;
    }
    
    public Dosagemonitor deleteDosagemonitor(int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        //   Query result = session.createQuery("delete from ItemsTable where items_id = "+id);
        Dosagemonitor dosageMonitor = (Dosagemonitor) session.get(Dosagemonitor.class, id);
        session.delete(dosageMonitor);
        session.getTransaction().commit();

        return dosageMonitor;
    }
    
    public Symptoms deleteSymptom(int id) {
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        //   Query result = session.createQuery("delete from ItemsTable where items_id = "+id);
        Symptoms symptoms = (Symptoms) session.get(Symptoms.class, id);
        session.delete(symptoms);
        session.getTransaction().commit();

        return symptoms;
    }

    public Boolean ifEmpty() {
        if (this == null) {
            return false;
        }
        return true;
    }
}