<%@page import="entities.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%    
    HMSHelper mm = new HMSHelper();
    
    String query = request.getParameter("q");
   // mm.removeTrim();
    List treatments = mm.listNhisInvesigation(query);
    //out.print(countries.size());
    Iterator<Nhisinvestigation> iterator = treatments.iterator();
    while (iterator.hasNext()) {
        Nhisinvestigation investigation = (Nhisinvestigation) iterator.next();
   //     System.out.println(investigation);
        out.println(investigation.getInvestigation());
    }
    %>