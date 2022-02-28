<%@page language="java" session="true" %>
    <%@page import="com.pharmacy.UserLogin, java.util.ArrayList" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
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
            <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
            <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap4.min.css">
            <link rel="stylesheet" type="text/css" href="../lib/style.css">
            <!--<link rel="stylesheet" type="text/css" href="style.css">-->
            <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
            <title>Doctor</title>
            <style>
                div {
                    height: auto;
                }
                
                p {
                    display: inline-block;
                }
                
                input,
                input::-webkit-input-placeholder {
                    font-size: 13px;
                }
            </style>
        </head>

        <body class="hold-transition sidebar-mini layout-fixed">
            <% 
        	session=request.getSession(false);	
        	//allow access only if session exists 
        	String user=null;
        	if(session.getAttribute("user")==null || session.getAttribute("user") !="Doctor" ) {
       			//limiting access to specific group of Actors 
        		// System.out.println("Error: " + session.getAttribute(" user"));
        		response.sendRedirect("../UnAuthorizedPage.html"); 
        	}
        	else 
        	{
        		user = (String) session.getAttribute("user");
        		
        		// remove unused session attributes
        		
        		session.removeAttribute("profile_ic");
        		session.removeAttribute("profile_name");
        		session.removeAttribute("profile_sex");
        		session.removeAttribute("profile_email");
        		session.removeAttribute("profile_age");
        		session.removeAttribute("profile_contact");
        		
        		session.removeAttribute("patientcontact");
    	    	session.removeAttribute("patientemail");
    	    	
    	    	session.removeAttribute("patient_name");
    	    	session.removeAttribute("patient_id");
    	    	session.removeAttribute("patient_age");
    	    	session.removeAttribute("patient_sex");
    	    	session.removeAttribute("patient_allergies");
        	}
        	
        	String msg = "";
        	String error = request.getParameter("error");
        	String success = request.getParameter("success");
        	
        	if (error != null)
        	{
        		if(error.equals("patientnil"))
        		{
        			msg = "Please enter patient details!";
        		}
        		else
        		{
        			msg = "Prescription failed to add!";
        		}
        		
        	}
        	
        	if (success != null)
        	{
        		msg = "Prescription added successfully!";
        	}
           
        	String userName = ""; 
        	String sessionID = null;
           
        	userName = (String) session.getAttribute("username");
           
        	Cookie[] cookies=request.getCookies();
           
        	if(cookies !=null){
        		for(Cookie cookie : cookies){
        			// if(cookie.getName().equals("user")) userName=cookie.getValue();
        			if(cookie.getName().equals("JSESSIONID")) sessionID=cookie.getValue();
        		}
        	}
        %>
                <div class="wrapper">
                    <!-- Preloader -->
                    <div class="preloader flex-column justify-content-center align-items-center">
                        <!-- <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60"> -->
                    </div>

                    <!-- Navbar -->
                    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                        <!-- Left navbar links -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i
                                    class="fas fa-bars"></i></a>
                            </li>
                        </ul>

                        <!-- Right navbar links -->
                        <ul class="navbar-nav ml-auto">

                            <li class="nav-item">
                                <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                                    <i class="fas fa-expand-arrows-alt"></i>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <!-- /.navbar -->
                    <!-- Main Sidebar Container -->
                    <aside class="main-sidebar sidebar-dark-primary elevation-4" id="navleft">
                        <!-- Pharmacy Name -->
                        <!-- <a href="#" class="brand-link noline" id="pharmacy_name"> -->
                        <div class="brand-link noline" id="pharmacy_name">
                            <span class="brand-text font-weight-light brand-image-xs logo-xl">
                            LDD<span class="pharmacy_title"> Pharmacy</span>
                            </span>
                            <span class="brand-text font-weight-light brand-image-xl logo-xs" id="short_name">
                            LDD
                        </span>
                            <!-- </a> -->
                        </div>
                        <div class="sidebar">
                            <!-- Sidebar user panel (optional) -->
                            <div class="user-panel mt-3 pb-3 mb-3 d-flex" id="platform_name">
                                <span class="pharmacy_name platform_name brand-image-xs logo-xl">
                                Doctor Platform
                            </span>
                                <span class="pharmacy_name platform_name brand-image-xl logo-xs" id="platformShort_name">
                                Dr.
                            </span>
                            </div>

                            <hr color="#EBEFF2" style="border:1; margin-top:35px; opacity: 0.8;">

                            <nav class=" mt-2 ">
                                <ul class="nav nav-pills nav-sidebar flex-column " data-widget="treeview " role="menu" data-accordion="false ">
                                    <li class="nav-item active">
                                        <a href="DoctorMainPage.jsp" class="nav-link">
                                            <i class="nav-icon"><img src="../img/nav_home_icon.svg"></i>
                                            <p class="navHeader">
                                                Home
                                            </p>
                                        </a>
                                    </li>
                                    <li class="nav-item ">
                                        <a href="DoctorPatientPage.jsp" class="nav-link ">
                                            <i class="nav-icon"><img src="../img/nav_patient_icon.svg"></i>
                                            <p class="navHeader">
                                                Patients

                                            </p>
                                        </a>
                                    </li>

                                    <li class="nav-item ">
                                        <a href="DoctorRecordPage.jsp" class="nav-link">
                                            <i class="nav-icon"><img src="../img/nav_record_icon.svg"></i>
                                            <p class="navHeader">
                                                Records

                                            </p>
                                        </a>
                                    </li>
                                    <li class="nav-item ">
                                        <hr color="#EBEFF2" style="border:1; margin-top:10px; opacity: 0.8;">
                                        <a href="/pharmacy/ProfileServlet" class="nav-link">
                                            <i class="nav-icon"><img src="../img/nav_profile_icon.svg"></i>
                                            <p class="navHeader">
                                                Profile

                                            </p>
                                        </a>
                                    </li>
                                    <li class="nav-item ">
                                        <form action="/pharmacy/LogoutServlet" method="post">

                                            <a href="/pharmacy/LogoutServlet" class="nav-link">
                                                <i class="nav-icon"><img src="../img/nav_logout_icon.svg"></i>
                                                <p class="navHeader">
                                                    <button type="submit" class="navHeader logout_btn">Logout</button>
                                                </p>
                                            </a>
                                        </form>
                                    </li>
                                </ul>
                                <img src="../img/nav_bk.svg" id="nav_bk" />
                            </nav>
                            <!-- /.sidebar-menu -->
                        </div>
                        <!-- /.sidebar -->
                    </aside>

                    <!-- Content Wrapper. Doctor Home Page -->
                    <div class="content-wrapper ">
                        <div class="card">
                            <div class="card-header">
                                <div id="doctorName">
                                    User:
                                    <%=userName %>
                                </div>

                                <div class="badge badge-primary userTag1">
                                    <div class="doctor">
                                        <img src="../img/doctorTag_icon.svg" /> Doctor
                                    </div>
                                </div>

                                <span class="badge badge-primary userTag2">LDD hospital</span>
                            </div>
                        </div>
                        <div id="action_tag">
                            <div style="float:left;width: 3px;height: 20px; background: #109CF1;"></div>
                            <p id="action_tag_name">Add Prescription</p>
                            <img src="../img/add_icon.svg" />
                        </div>
                        <div class="card" id="contain_box">
                            <!-- <div class="card-header card_select"> -->
                            <div class="card-body">
                                <p class="p1" style="margin-top: 5px; margin-left: 7px;">Patient: </p>
                                <div class="input-group search_patient">
                                    <!-- search patient form -->
                                    <form action="/pharmacy/PatientSearchServlet" method="post">
                                        <!--Add this div class for it to be in the same line-->
                                        <div class="input-group">
                                            <input type="search" class="form-control" placeholder="Enter patient NRIC" aria-label="Search" aria-describedby="search-addon" name="patientsearch" />
                                            <input type="hidden" name="callerPage" value="code/Doctor/DoctorMainPage.jsp">
                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-lg btn-default" style="padding-top:3px;padding-left: 10px;">
	                                            <i class="fa fa-search"></i>
	                                    </button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                                <!---Display Date-->

                                <div>
                                    <p class="p1 col-sm-3 displaydate">Date: <span id="datetime"></span></p>
                                </div>


                                <br style="clear: both;">
                                <!---Example div ,search and get label and display-->
                                <div class="patientDetailDiv">

                                    <%
                                	//Patient search table
                                	// com.pharmacy.PatientData patientData = (com.pharmacy.PatientData) session.getAttribute("searchPatient");
                                	int id = 0;
                                	int age = 0;
                                	ArrayList<String> allergies = null;
                                	if (session.getAttribute("patientid") != null)
                                	{
                                		id = (int) session.getAttribute("patientid");
                                	}
                                	if (session.getAttribute("patientage") != null)
                                	{
                                		age = (int) session.getAttribute("patientage");
                                	}
                                	String ic = (String) session.getAttribute("patientic");
                                	String name = (String) session.getAttribute("patientname");
                                	String sex = (String) session.getAttribute("patientsex");
                                	if (session.getAttribute("patientallergies") != null)
                                	{
                                		allergies = (ArrayList<String>) session.getAttribute("patientallergies");	
                                	}
                                	if(session.getAttribute("patientid") != null)
                                	{
                                		
                                		
                                    	out.println("<p class=\"p2\">Patient ID:</p>");
                                    	out.println("<label id=\"patientID\">" + id + "</label>");
                                    	out.println("<p class=\"p2\">NRIC:</p>");
                                    	out.println("<label id=\"nric\">" + ic + "</label>");
                                    	out.println("<p class=\"p2\">Name:</p>");
                                    	out.println("<label id=\"patientName\">" + name + "</label>");
                                    	out.println("<p class=\"p2\">Age:</p>");
                                    	out.println("<label id=\"age\">"+ age +"</label>");
                                    	out.println("<p class=\"p2\">Sex:</p>");
                                    	out.println("<label id=\"sex\">"+ sex +"</label>");
                                    	out.println("<p class=\"p2\">Drug Allergy: </p>");
                                    	out.println("<label id=\"drugAllergy\">");
                                    	
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
                            		else
                            		{
                            			String search = request.getParameter("search");
                                       	
                                       	if(search != null)
                                       	{
                                       		out.println("<p class=\"p2\">No such patient found</p>");

                                       	}
                            		}
                                
                                
                                                                	
                                %>

                                </div>

                                <!---search the drug form DB-->
                                <form action="/pharmacy/DrugsServlet" method="post">
                                    <div class="input-group input-group-lg">
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
                                		//Drug search bar
                                		if(session.getAttribute("searcheddruglist") != null)
                                		{
                                			// com.pharmacy.DrugSearch drugSearch = (com.pharmacy.DrugSearch) session.getAttribute("searchedDrug");
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
                                		// session.removeAttribute("drugnamelist");
                                		// session.removeAttribute("drugstrengthlist");
                                		// session.removeAttribute("drugdosagelist");
                                		// session.removeAttribute("drugformidlist");
                                	%>
                                    </tbody>
                                </table>
                                <form action="/pharmacy/AddPrescriptionServlet" method="post">
                                    <input type="hidden" name="patientID" value=<% if(session.getAttribute( "searchPatient") !=null) {out.println(id);} %>>
                                    <%
                            		com.pharmacy.UserLogin userLogin = (com.pharmacy.UserLogin) session.getAttribute("login_object");
                            		int doctorid = (int) session.getAttribute("userid");
                            	%>

                                        <input type="hidden" name="doctorID" value=<%=doctorid %>>

                                        <table id="drug_table" class="table table-hover  dt-responsive nowrap" style="width:100%; min-height: 200px;">
                                            <thead style="font-size: 12px; color: #6A707E;">
                                                <tr>
                                                    <th>Drug</th>
                                                    <th>Dosage</th>
                                                    <th>Duration</th>
                                                    <th>Amount</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
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
													
													//second table data - dosage
													out.println("<td class=\"tablet\">");
													//out.println("<input type=\"text\" name=\"dosage\" style=\"width:150px;\" onchange=\"addToURL(this)\">");
													out.println("<input type=\"text\" name=\"dosage\" style=\"width:150px;\">");
													out.println("</td>");
													
													//third table data - duration
													out.println("<td class=\"tablet\">");
													//out.println("<input type=\"number\" name=\"duration\" class=\"duration_days_select\" onchange=\"addToURL(this)\">");
													out.println("<input type=\"number\" name=\"duration\" class=\"duration_days_select\">");
													//duration type select
													out.println("<select class=\"form-control duration_days\" name=\"durationType\">");
													out.println("<option value=\"days\">Days</option>");
													out.println("<option value=\"weeks\">Weeks</option>");
													out.println("<option value=\"months\">Months</option>");
													out.println("<option value=\"year\">Year</option>");
													out.println("</td>");
													
													//fourth table data - amount
													out.println("<td class=\"tablet\">");
													//out.println("<input type=\"number\" name=\"amount\" style=\"width:150px;\" onchange=\"addToURL(this)\">");
													out.println("<input type=\"number\" name=\"amount\" style=\"width:150px;\">");
													out.println(drugFormArray[i]);
													out.println("<input type=\"hidden\" name=\"formID\" value=\"" + formIDArray[i] + "\">");
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
                                            <textarea class="form-control" id="doctorNote" name="doctorNote" rows="3" placeholder="Add Notes here"></textarea>
                                        </div>

                                        <!---Add prescrition button-->
                                        <footer class="card-footer" style="background-color: transparent; padding-left:0; padding-right:0;">
                                            <button type="submit" id="add_btn" class="btn btn-lg btn-default col-12">
			                                     Add Prescription
			                                </button>
                                        </footer>
                                        
                                        <div class="offset-sm-2 col-sm-10">
                            				<font color=red><%=msg %></font>
                            			</div>
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
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
                    <!-- Bootstrap Date-Picker Plugin -->
                    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
                    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
                    <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
                    <script src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap4.min.js"></script>
                    <script>
                        // add drug in table function
                        // 1.retrive the drug button
                        $("#retrieve_drug_table tr").click(function() {
                            var drugName = $(this).find('td:first').text();
                            var drugForm = $(this).find('td:nth-child(2)').text();
                            var drugFormID = $(this).find('td:nth-child(3)').text();

                            //alert("test");
                            if (!location.href.includes("?")) {

                                var currentURL = location.href;
                                var newURL = currentURL + "?drugName=" + drugName + "&formID=" + drugFormID + "&drugForm=" + drugForm;
                                location.assign(newURL);
                            } else {
                                addDrugToURL(drugName, drugFormID, drugForm);
                            }

                        })

                        function deleteTr(object) {
                            // get table node
                            var table = object.parentNode.parentNode.parentNode;
                            // get tr node
                            var tr = object.parentNode.parentNode;
                            // delete and remove child
                            table.removeChild(tr);
                        }


                        function addDrugToURL(drugName, formID, drugForm) {
                            var currentURL = location.href;
                            var newURL = currentURL + "&drugName=" + drugName + "&formID=" + formID + "&drugForm=" + drugForm;
                            location.assign(newURL);

                        }

                        function addToURL(input) {
                            var currentURL = location.href;
                            var newURL = currentURL + "&" + input.name + "=" + input.value;
                            location.assign(newURL);
                        }

                        function setCallerPage() {

                            document.getElementById('callerPage').value = location.href;
                        }
                    </script>
                    <script>
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
                        /* dateTime picker*/
                        var dt = new Date();
                        document.getElementById("datetime").innerHTML = (("0" + dt.getDate()).slice(-2)) + "/" + (("0" + (dt.getMonth() + 1)).slice(-2)) + "/" + (dt.getFullYear());
                    </script>
                </div>
        </body>

        </html>