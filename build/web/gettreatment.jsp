<%@page import="entities.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>s
<%    
    HMSHelper mm = new HMSHelper();
    
    String query = request.getParameter("q");
   // mm.removeTrim();
    List treatments = mm.listTreatmentShow(query);
    //out.print(countries.size());
    Iterator<Treatment> iterator = treatments.iterator();
    while (iterator.hasNext()) {
        Treatment investigation = (Treatment) iterator.next();
   //     System.out.println(investigation);
        out.println(investigation.getTreatment());
    }
    %>