<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- <title>AdminLTE 3 | Dashboard</title> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fontawesome-free@1.0.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/icheck-bootstrap/3.0.1/icheck-bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">
    <!-- <link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen"> -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../lib/style.css">
    <title>Doctor</title>
    <style>
        div {
            height: auto;
        }
        
        td {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        table {
            table-layout: fixed;
            word-wrap: break-word;
        }
        
        input,
        input::-webkit-input-placeholder {
            font-size: 13px;
        }
    </style>
</head>

<body>
<%
session = request.getSession(false);
//allow access only if session exists
String user = null;
if(session.getAttribute("user") == null || session.getAttribute("user") != "Doctor") //limiting access to specific group of Actors
{
	System.out.println("Error: " + session.getAttribute("user"));
	response.sendRedirect("/UnAuthorizedPage.html");
}
else user = (String) session.getAttribute("user");

String userName = "";
String sessionID = null;

userName = (String) session.getAttribute("username");

Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	//if(cookie.getName().equals("user")) userName = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}
%>


    <!-- Content Wrapper. Doctor Home Page -->

    <!--<div class="col-12">
            <div class="card" style="margin-top: 20px;">
                <div class="card-header" style="padding-top: 0; padding-bottom: 20px; padding-top: 20px; background-color: white;">
                    <div style="float:left;width: 3px;height: 28px; background: #109CF1;"></div>
                    <p style="font-size:20px; color: black;margin-top: 25px; margin-left: 10px; display: inline;">Modify Prescriptions</p>
                </div>
                <div class="card-body">
                    <div>
                        <p class="searchLeft">Patient ID: </p>-->
    <!-- search patient ID -->
    <!--<input type="search" id="searchName" class="form-control form-control-lg" placeholder="Search patient ID">
                        <button type="submit" class="btn btn-outline-primary search_button">search</button>
                    </div>
                </div>
            </div>
        </div>-->

    <div class="col-12">
        <div class="card" style="margin-top: 20px;">

            <div class="card-header" style="padding-top: 0;  padding-top: 20px; background-color: white;">
                <div style="float:left;width: 3px;height: 28px; background: #F7685B;"></div>
                <p style="font-size:20px; color: black;margin-top: 25px; margin-left: 10px; display: inline;">Modify prescription</p>
            </div>
            <div class="card-body">
 
					<%
						com.pharmacy.PrescriptionList prescriptionData = (com.pharmacy.PrescriptionList) session.getAttribute("searchPrescription");
                		com.pharmacy.PatientData patientData = (com.pharmacy.PatientData) session.getAttribute("searchPatient");
                		com.pharmacy.Prescription displayprescription = (com.pharmacy.Prescription) session.getAttribute("displayprescription"); 
                		
                		int id = 0;
	                	int age = 0;
	                	ArrayList<String> allergies = new ArrayList<String>();
	                	String sex = (String) session.getAttribute("patient_sex");
	                	
	                	if (session.getAttribute("patient_id") != null)
	                	{
	                		id = (int) session.getAttribute("patient_id");
	                	}
	                	if (session.getAttribute("patient_age") != null)
	                	{
	                		age = (int) session.getAttribute("patient_age");
	                	}
	                	if (session.getAttribute("patient_allergies") != null)
	                	{
	                		allergies = (ArrayList<String>) session.getAttribute("patient_allergies");	
	                	}
                	%>
                <div class="patientDetailDiv_popOut">
                    <%		
                        if (patientData != null)
                        {
                			if (prescriptionData != null)
                    		{
                				
                    			out.println("<p class=\"p2\">Patient ID:</p>");
                    			out.println("<label id=\"patientID\">" + id + "</label>");
                    			
                            	out.println("<p class=\"p2\">Age:</p>");                 			
                    			out.println("<label id=\"patientAge\">" + age + "</label>");
                    			
                    			out.println("<p class=\"p2\">Sex:</p>");
                    			out.println("<label id=\"patientSex\">" + sex + "</label>");  
                    			
                    			out.println("<p class=\"p2\">Drug Allergy:</p>");
                    			out.println("<label id=\"PatientAllergy\">");
                    			

                    			if (allergies.size() != 0)
                    			{
                        			for (int i = 0; i < allergies.size(); i++)
                        			{
                        				if(allergies.size() - i == 1)
                        				{
                        					out.println(allergies.get(i));
                        				}
                        				else
                        				{
                        					out.println(allergies.get(i));
                        					out.println(", ");
                        				}
                        			}
                    			}
                    			else
                    			{
                    				out.println("NIL");
                    			}
                    			
                    			out.println("</label>");                    			
                    			
                            }
                        }
                				
		           		%>
               </div>
                <form action="/pharmacy/DrugsServlet" method="post">
                <div class="input-group input-group-lg" id="searchDrug">        
                    <input type="search" class="form-control form-control-lg" placeholder="Search drug" name="drugsearch" onchange="setCallerPage()">
                    <input type="hidden" name="callerPage" id="callerPage" value="">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-lg btn-default">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                </form>
                <!---example of retrieve drug table-->
                <table id="retrieve_drug_table" class="table table-hover dt-responsive nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th style="color: #109CF1;">Select a medicine to add</th>

                        </tr>
                    </thead>
                    <tbody>
                       <%
                      	 com.pharmacy.DrugSearch drugSearch = (com.pharmacy.DrugSearch) session.getAttribute("searchedDrug");
                       
                         //Drug search bar
                         if(session.getAttribute("searcheddruglist") != null)
                             {
                        	  ArrayList<String> drugName = (ArrayList<String>) session.getAttribute("drugnamelist");
             				  ArrayList<String> drugStrData = (ArrayList<String>) session.getAttribute("drugstrengthlist");
             				  ArrayList<String> drugDosage = (ArrayList<String>) session.getAttribute("drugdosagelist");
             				  ArrayList<Integer> drugFormID = (ArrayList<Integer>) session.getAttribute("drugformidlist");
   		
                              for (int i = 0; i < drugName.size(); i++)
                                {
                                	out.println("<tr>");
                                				
                                	out.println("<td>");
                                	out.println(drugName.get(i) + " " + drugStrData.get(i));
                                	//out.println(drugSearch.getList().get(i).getDrugDosageForm());
                                	out.println("</td>");
                                	
                                	out.println("<td style=\"display:none;\">" + drugDosage.get(i) + "</td>");
                                			
                                	out.println("<td style=\"display:none;\">" + drugFormID.get(i) + "</td>");
                                			
                                	out.println("</tr>");
                                }
                             }
                                	
                           session.setAttribute("searchedDrug", null);
                       %>
                    </tbody>                                
                </table>
                
                <form action="/pharmacy/UpdatePrescriptionServlet" method="post" id="UpdateForm">
                <input type="hidden" name="patientID" value=<% if(session.getAttribute("searchPatient") != null) {out.println(patientData.getPatientId());} %>>
                <%
                    com.pharmacy.UserLogin userLogin = (com.pharmacy.UserLogin) session.getAttribute("login_object"); 
                %>
                <input type="hidden" name="doctorID" value=<%= userLogin.getID() %>>
                <input type="hidden" name="prescriptionID" value=<%= displayprescription.getPrescriptionID() %>>   
                <input type="hidden" name="callerPage" value="code/Doctor/DoctorRecordModify.jsp">
                <table id="drug_table" class="table table-hover  dt-responsive nowrap" style="width:100%; min-height: 200px;">
                    <thead style="font-size: 12px; color: #6A707E;">
                        <tr>
                            <th>Drug</th>
                            <th>Amount</th>
                            <th>Dosage</th>
                            <th>Duration</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    	<%
							
                    	
                			if(prescriptionData != null)	
                			{			
                				
                				for(int i = 0; i < displayprescription.getDrugList().size(); i++)
                    			{
               						               				
                					String getduration = displayprescription.getDrugList().get(i).getDuration();
                					String duration[] = getduration.split(" ", 2);  
                					
                					
                					String formid = Integer.toString(displayprescription.getDrugList().get(i).getFormid());
                					String listid = Integer.toString(displayprescription.getDrugList().get(i).getListid());
                					
                					
                					String days = "days";
                					String weeks = "weeks";
                					String months = "months";
                					String years = "years";
                					
                					//open table row
									out.println("<tr>");
									
									out.println("<input type=\"hidden\" name=\"formid\" value=\"" + formid + "\">");
									
									
									
									//first table data - drugname
									out.println("<td>");
									out.println(displayprescription.getDrugList().get(i).getDrugData().getDrugName());
									out.println("</td>");
									
									//second table data - amount
									out.println("<td class=\"tablet\">");	
									out.println("<input type=\"hidden\" name=\"listid\" value=\"" + listid + "\">");
									out.println("<input type=\"number\" name=\"amount\" style=\"width:150px;\" value=\"" + displayprescription.getDrugList().get(i).getAmount() + "\">");
									out.println(" tablet");
									out.println("</td>");
												
									//third table data - dosage
									out.println("<td class=\"tablet\">");
									out.println("<input type=\"text\" name=\"dosage\" style=\"width:150px;\" value=\"" + displayprescription.getDrugList().get(i).getDosage() + "\">");
									out.println("</td>");
									
									
									//fourth table data - duration
									out.println("<td class=\"tablet\">");
									int durationValue = Integer.parseInt(String.format("%s", duration[0]));
									out.println("<input type=\"number\" name=\"duration\" class=\"duration_days_select\" value=\"" + durationValue + "\">");
										
									//duration type select
									switch(String.format("%s", duration[1]))
									{
										case "days":
											
											out.println("<select class=\"form-control duration_days\" name=\"durationType\">");
											out.println("<option value=\"weeks\">weeks</option>");
											out.println("<option value=\"months\">months</option>");
											out.println("<option value=\"years\">years</option>");	
											out.println("<option selected value=\"days\">");
											out.println(String.format("%s", duration[1]));
											out.println("</option>");
											break;
										
										case "weeks":
											out.println("<select class=\"form-control duration_days\" name=\"durationType\">");									
											out.println("<option value=\"days\">days</option>");	
											out.println("<option value=\"months\">months</option>");
											out.println("<option value=\"years\">years</option>");	
											out.println("<option selected value=\"weeks\">");
											out.println(String.format("%s", duration[1]));
											out.println("</option>");
											break;
											
										case "months":
											out.println("<select class=\"form-control duration_days\" name=\"durationType\">");									
											out.println("<option value=\"days\">days</option>");	
											out.println("<option value=\"weeks\">weeks</option>");
											out.println("<option value=\"years\">years</option>");	
											out.println("<option selected value=\"months\">");
											out.println(String.format("%s", duration[1]));
											out.println("</option>");
											break;
											
										case "years":
											out.println("<select class=\"form-control duration_days\" name=\"durationType\">");									
											out.println("<option value=\"weeks\">days</option>");	
											out.println("<option value=\"months\">weeks</option>");
											out.println("<option value=\"year\">months</option>");	
											out.println("<option selected value=\"years\">");
											out.println(String.format("%s", duration[1]));
											out.println("</option>");
											break;
									}	

									
									out.println("</td>");
												
									//fifth table data - delete
									out.println("<td>");
									out.println("<a href=\"javascript:void(0);\" onclick=\"deleteTr(this);\" style=\"color:#F7685B\">");
									out.println("<input type=\"hidden\" name=\"delete\">");
									out.println("Delete");
									out.println("</td>");												
									
									
									
									out.println("</tr>");
                    			}
		
    						}		
                     
						%>
                    	
                    	
                    	
						<%
							//Drug search table
							String[] drugNameArray = request.getParameterValues("drugName");
										
							if(drugNameArray != null)
							{
								String[] formIDArray = request.getParameterValues("formID");
								String[] drugFormArray = request.getParameterValues("drugForm");
								
								for(int i = 0; i < drugNameArray.length; i++)
									{
													
										//open table row
										out.println("<tr>");
													
										//first table data - drugname
										out.println("<td>");
										out.println(drugNameArray[i]);																							
										out.println("</td>");
										
										//second table data - amount
										out.println("<td class=\"tablet\">");
										out.println("<input type=\"hidden\" name=\"listid\" value=\"0\">");
										out.println("<input type=\"number\" name=\"amount\" style=\"width:150px;\">");
										out.println(drugFormArray[i]);
										out.println("<input type=\"hidden\" name=\"formid\" value=\"" + formIDArray[i] + "\">");
										
										out.println("</td>");
													
										//third table data - dosage
										out.println("<td class=\"tablet\">");
										out.println("<input type=\"text\" name=\"dosage\" style=\"width:150px;\">");
										out.println("</td>");
													
										//fourth table data - duration
										out.println("<td class=\"tablet\">");
										out.println("<input type=\"number\" name=\"duration\" class=\"duration_days_select\">");
										
										//duration type select
										out.println("<select class=\"form-control duration_days\" name=\"durationType\">");
										out.println("<option value=\"days\">Days</option>");
										out.println("<option value=\"weeks\">Weeks</option>");
										out.println("<option value=\"months\">Months</option>");
										out.println("<option value=\"year\">Year</option>");
										out.println("</td>");
													
										//fifth table data - delete
										out.println("<td>");
										out.println("<a href=\"javascript:void(0);\" onclick=\"deleteTr(this);\" style=\"color:#F7685B\">");
										out.println("Delete");
										out.println("</td>");												
																									
										out.println("</tr>");
									}
												
								}									
						%>                        
     					
                    </tbody>
                </table>
               
                <div>
                    <textarea class="form-control" id="doctorNote" rows="3" placeholder="Add Notes here"></textarea>
                    <div style="float:right">
                        <a href="DoctorRecordPage.jsp">
                            <button type="button" style="float: left;margin-right: 20px;" class="white_btn">
                                Back
                            </button>
                        </a>
                        <button type="submit" id="upd_btn"class="blue_btn">
                            Update
                        </button>
                    </div>
                </div>
                <div id="deleteList"></div>
 			</form>
            </div>

        </div>
    </div>





    <!-- ./wrapper -->
    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js "></script>
    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js "></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- AdminLTE -->
    <script src="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/js/adminlte.js "></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- getdatepicker -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
    <!-- Bootstrap Date-Picker Plugin -->
    <!-- datatable -->
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap4.min.js"></script>


    <script>
    $("#retrieve_drug_table tr").click(function() {
        var drugName = $(this).find('td:first').text();
        var drugForm = $(this).find('td:nth-child(2)').text();
        var drugFormID = $(this).find('td:nth-child(3)').text();
        
        //alert("test");
        if (!location.href.includes("?"))
       	{
        	
        	var currentURL = location.href;                       	
        	var newURL = currentURL + "?drugName=" + drugName + "&formID=" + drugFormID + "&drugForm=" + drugForm;
        	location.assign(newURL);
       	}
        else
       	{
        	addDrugToURL(drugName, drugFormID, drugForm);
       	}

    })

    var listid = "";
    
    function deleteTr(object) {
    	
    	var tbl = document.getElementById("drug_table");
        // var rCount = tbl.rows.length;
        var row_index = object.parentNode.parentNode.rowIndex;

        //alert(tbl.rows[row_index].cells[1].children[0].value);
        listid = tbl.rows[row_index].cells[1].children[0].value;
        
        var deleteList = document.getElementById("deleteList");        
        var deleteVar = document.createElement("input");
        deleteVar.setAttribute("type", "hidden");
        deleteVar.setAttribute("name", "deleteVar");        
        deleteVar.setAttribute("value", listid);      
        deleteList.appendChild(deleteVar);
        
        // get table node
        var table = object.parentNode.parentNode.parentNode;
        // get tr node
        var tr = object.parentNode.parentNode;
        // delete and remove child
        table.removeChild(tr);

    }
    
    
    
    function addDrugToURL(drugName, formID, drugForm)
    {
    	var currentURL = location.href;
    	var newURL = currentURL + "&drugName=" + drugName + "&formID=" + formID + "&drugForm=" + drugForm;
    	location.assign(newURL);                 
    	
    }
    
    function addToURL(input)
    {
    	var currentURL = location.href;
    	var newURL = currentURL + "&" + input.name + "=" + input.value;
    	location.assign(newURL);
    }
    
    function setCallerPage()
    {
    	
    	document.getElementById('callerPage').value = location.href;
    }

    
    $(".nav .nav-link").on("click ", function() {
        $(".nav ").find(".active ").removeClass("active ");
        $(this).addClass("active ");
    });
    
        $(document).ready(function() {
            $('#patient_table').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": false,
                "info": false,
            });

        });
        $(document).ready(function() {

            $('#searchMed').select2();
        });
        
          
        $(".nav .nav-link").on("click ", function() {
            $(".nav ").find(".active ").removeClass("active ");
            $(this).addClass("active ");
        });
        $(document).ready(function() {
            /* table search function*/
            $('#drug_table').DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": false,
                "ordering": false,
                "info": false,
            });
            $(".dataTables_empty").empty();
            /* select box */
            $('#searchMed').select2();


        });
        
    </script>
    <!-- OPTIONAL SCRIPTS -->
    <!-- <script src="plugins/chart.js/Chart.min.js "></script> -->
    <!-- AdminLTE for demo purposes -->
    <!-- <script src="dist/js/demo.js "></script> -->
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <!-- <script src="dist/js/pages/dashboard3.js "></script> -->
</body>

</html>