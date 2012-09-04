<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
        HMSHelper mgr = new HMSHelper();
        if ("addrole".equals(request.getParameter("action"))) {
            String rolename = request.getParameter("rolename") == null ? "" : request.getParameter("rolename");
            String roledescription = request.getParameter("roledescription") == null ? "" : request.getParameter("roledescription");
            if (!rolename.isEmpty()) {
                Roletable roletable = mgr.addRole(rolename, roledescription);
                if (roletable != null) {
                    out.print("Role Successfully Added");
                    return;
                } else {
                    out.print("Role Name Cannot Be Empty!");
                    return;
                }

            }

            //String registrationDate = request.getParameter("dor");


            out.print("Role Name Cannot Be Empty!");
            return;

        }
        out.print("here at least");
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("../addconsultingroom.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>

