 <%List questions = mgr.listClerkQuestions(); 
                                for(int cl=0;cl<questions.size();cl++){
                                    Clerkingquestion clerkingquestion = (Clerkingquestion) questions.get(cl);
                                
                                %>
                                <tr>
                                    <td>
                                      <!-- <input type="checkbox" name="qtns" value="<%=clerkingquestion.getClerkid()%>"/> --><%=clerkingquestion.getQuestion() %>
                                    </td>
                                    <td>
                                       <%
                                       List answers = mgr.listClerkAnswersByQuestionid(clerkingquestion.getClerkid());
                                        for(int ca=0;ca<answers.size();ca++){ 
                                            Clerkinganswer clerkinganswer = (Clerkinganswer)answers.get(ca);%>
                                            <input type="checkbox" name="anss[]" value="<%=clerkinganswer.getQuestionid()%>-<%=clerkinganswer.getAnswerid()%>"/> <%=clerkinganswer.getAnswer()%><br/>
                                           
                                       <%}%>
                                       </td>
                                       <td>
                                        <textarea name="newanswers_<%=clerkingquestion.getClerkid()%>"></textarea>
                                    </td>
                                </tr>
                               <%}%>