<%@page import="entities.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%    
    HMSHelper mm = new HMSHelper();
    
    String query = request.getParameter("q");
   // mm.removeTrim();
    List diagnosis = mm.listDiagnosisShow(query);
    //out.print(countries.size());
    Iterator<Diagnosis> iterator = diagnosis.iterator();
    while (iterator.hasNext()) {
        Diagnosis investigation = (Diagnosis) iterator.next();
   //     System.out.println(investigation);
        out.println(investigation.getDiagnosis());
    }
    %>