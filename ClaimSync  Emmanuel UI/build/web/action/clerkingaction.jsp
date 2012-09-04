<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        if ("clerking".equals(request.getParameter("action"))) {
            String question = null;
            String answers  = "";
             HMSHelper mgr = new HMSHelper();
             
            try {
                 question = request.getParameter("name");
                
            } catch (NullPointerException e) {
                out.print("Question field cannot be empty");
                return;
                
            }
            Clerkingquestion clerkingquestion = mgr.addClerkingQuestion(question, 0);
            answers = request.getParameter("anss")==null ? "" : request.getParameter("anss");
            
            if(!answers.equalsIgnoreCase("")){
                String[] ans = answers.split("-");
                for(int i=0;i<ans.length;i++){
                   Clerkinganswer clerkinganswer =  mgr.addClerkingAnswer(ans[i], clerkingquestion.getClerkid());
                }
               // out.print(ans);
            }
            out.print("Clerking Question Saved Successfully");
            return;
        }
        if ("edit".equals(request.getParameter("action"))) {
            String wardName = null;
            int numberOfBeds  = -1;
             int wardid = numberOfBeds-1;
             int occupied = numberOfBeds-1;
            try {
                 wardName = request.getParameter("uname");
                 numberOfBeds = Integer.parseInt(request.getParameter("beds"));
                 wardid = Integer.parseInt(request.getParameter("uid"));
                 occupied = Integer.parseInt(request.getParameter("occupied"));
            } catch (NumberFormatException e) {
                out.print("Bed number cannot be a string");
                return;
                
            }
            catch(NullPointerException e){
               out.print("There is a problem please try again");
                return;
            }

            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
            Ward ward = null;
            ward = mgr.updateWardInfo(wardid,wardName, numberOfBeds,occupied);
            out.print("Ward successfully Added");
            return;
        }
        if ("delete".equals(request.getParameter("action"))) {
          
            int wardid  = -1;
            
            try {
                
                 wardid = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException e) {
                out.print("There is a problem please try again");
                return;
                
            }
            catch(NullPointerException e){
               out.print("There is a problem please try again");
                return;
            }

            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
            Ward ward = null;
            ward = mgr.deleteWard(wardid);
            out.print("Ward successfully Added");
            return;
        }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("../addward.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>