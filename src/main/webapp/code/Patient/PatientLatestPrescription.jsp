<%@page import="java.util.ArrayList" %>
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
    </style>
</head>

<body class="hold-transition sidebar-mini layout-fixed">
<%
//allow access only if session exists
String user = null;
if(session.getAttribute("user") == null || session.getAttribute("user") != "Patient") //limiting access to specific group of Actors
{
	response.sendRedirect("UnAuthorizedPage.html");
}
else user = (String) session.getAttribute("user");

String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}

com.pharmacy.UserLogin userLogin = (com.pharmacy.UserLogin) session.getAttribute("login_object");
String patientID = Integer.toString((Integer) session.getAttribute("user_id"));


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
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
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
        <aside class="main-sidebar sidebar-dark-primary elevation-4" id="navleft_patient">
            <!-- Pharmacy Name -->

            <!-- <a href="#" class="brand-link noline" id="pharmacy_name"> -->
            <div class="brand-link noline" id="pharmacy_name">
                <span class="brand-text font-weight-light brand-image-xs logo-xl">
                    LDD<span class="pharmacy_title"> Pharmacy</span></span>
                <span class="brand-text font-weight-light brand-image-xl logo-xs" id="short_name">
                    LDD
                </span>
                <!-- </a> -->
            </div>
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex" id="platform_name">
                    <span class="pharmacy_name platform_name brand-image-xs logo-xl">
                        Patient Dashboard
                    </span>
                    <span class="pharmacy_name platform_name brand-image-xl logo-xs" id="platformShort_name">
                        
                    </span>
                </div>

                <hr color="#EBEFF2" style="border:1; margin-top:35px; opacity: 0.8;">

                <nav class=" mt-2 ">
                    <ul class="nav nav-pills nav-sidebar flex-column " data-widget="treeview " role="menu " data-accordion="false ">
                        <li class="nav-item active">
                            <a href="PatientMainPage.jsp" class="nav-link">
                                <i class="nav-icon"><img src="../img/prescription.svg"></i>
                                <p class="navHeader_patient">
                                    Prescription Status
                                </p>
                            </a>
                        </li>


                        <li class="nav-item ">
                        	<form action="/pharmacy/SearchPrescriptionServlet" method="post" class="nav-link">
	                                <i class="nav-icon"><img src = "../img/nav_record_icon.svg"></i>
	                                <p class="navHeader_patient">
	                                <input type="hidden" name="callerPage" value="code/Patient/PatientRecordPage.jsp">
	                                <input type="hidden" name="patientID" value="<%= patientID %>">
	                                    
										<button type="submit" class="navHeader logout_btn">Medical Records</button>
	                                </p>
                            </form>
                            <hr color="#EBEFF2" style="border:1; margin-top:10px; opacity: 0.8;">
                        </li>
                        <li class="nav-item ">
                            <hr color="#EBEFF2" style="border:1; margin-top:10px; opacity: 0.8;">
                            <a href="patient_profilePage.html" class="nav-link ">
                                <i class="nav-icon"><img src="../img/nav_profile_icon.svg"></i>
                                <p class="navHeader_patient">
                                    Profile

                                </p>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <form action="/pharmacy/LogoutServlet" method="post" class="nav-link">
	                            <i class="nav-icon"><img src="../img/nav_logout_icon.svg"></i>
	                            <p class="navHeader">
	                                <button type="submit" class="navHeader logout_btn">Logout</button>
	                            </p>
                            </form>
                        </li>
                    </ul>
                    <img src="../img/nav_bk.svg" id="nav_bk" />
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>

        <div class="content-wrapper ">
            <div class="col-12">
                <div class="card" style="margin-top: 20px;">
                    <div class="card-body">
                        <p style="font-size:20px; color: black; margin-left: -20px; margin-top: 25px;"><img src="../img/prescription.svg">Current Prescription
                        </p>
                        <!-- <table rules="rows" id="prescriptions_table" class="table table-hover table-bordered dt-responsive nowrap" style="width:100%"> -->
                        <div>
                        	<% 
                        		com.pharmacy.Prescription prescription = (com.pharmacy.Prescription) session.getAttribute("prescription");
	                        	
                        		String status = (String) session.getAttribute("prescription_status");
                        		int druglistsize = (int) session.getAttribute("druglistsize");
                        		ArrayList<String> drugNameList = (ArrayList<String>) session.getAttribute("drugnamelist");
	                    		ArrayList<String> drugStrList = (ArrayList<String>) session.getAttribute("drugstrlist");
	                    		ArrayList<Integer> drugAmountList = (ArrayList<Integer>) session.getAttribute("drugamountlist");
	                    		ArrayList<String> drugDosageFormList = (ArrayList<String>) session.getAttribute("drugdosageformlist");
	                    		ArrayList<String> drugDosageList = (ArrayList<String>) session.getAttribute("drugdosagelist");
	                    		ArrayList<String> drugInfoList = (ArrayList<String>) session.getAttribute("druginfolist");
	                    		ArrayList<String> drugDurationList = (ArrayList<String>) session.getAttribute("drugdurationlist");
                        	
                        	
                        	%>
                            <div class="tab_total" id="defaultOpenTotalMed">Total Medication: <%= druglistsize %></div>
                            <!--  <div class="tab_not_collected">Not collected: 2</div> -->
                            <div class="tab_partical">
                            
                                <!-- <label class="medical_partial" id="">Partial</label> which class to use?? -->
                                <%                               	
	                                // String status = prescription.getStatus();
	                   				
	                            	switch(status)
	                            	{
	                            		case "new":
	                            		{
	                            			out.println("<label class=\"patient_NotCollected\" id=\"\">Not Collected</label>");
	                            			break;
	                            		}
	                            		case "partial":
	                            		{
	                            			out.println("<label class=\"patient_Partial\" id=\"\">Partial</label>");
	                            			break;
	                            		}
	                            		case "dispensed":
	                            		{
	                            			out.println("<label class=\"patient_Dispenced\" id=\"\">Dispensed</label>");
	                            			//response.sendRedirect("PatientLatestPrescription.jsp");
	                            			break;
	                            		}
	                            		default:
	                            		{
	                            			out.println("<label class=\"patient_Dispenced\" id=\"\">"+ status +"</label>");
	                            		}
	                            	}  
                                %>
                            </div>
                        </div>
                        <!-- </div>
                                <div class="med_tab">
                                    <button class="tablinks tab_total" id="defaultOpenTotalMed" onclick="openSection(event, 'total_medication')">Total Medication: 3</button>
                                    <button class="tablinks tab_not_collected" onclick="openSection(event, 'not_collected')">Not collected: 2</button>
                                    <button class="tablinks tab_partical" onclick="openSection(event, 'partial')">
                                    <label class="medical_partial" id="">Partial</label></button>
                                </div> -->
                        <!-- <div class="tabcontent" id="total_medication"> -->
                    </div>
                    <div class="card-body">
                        <table id="currentPrescription" class="table table-hover table-bordered dt-responsive nowrap dataTable no-footer dtr-inline" style="width:100%">
                        	<%
                        		if(prescription != null)
                        		{
                        			// table head
                        			out.println("<thead>");
                        			out.println("<tr>");
                        			out.println("<th></th>");
                        			out.println("<th>Medication</th>");
                        			out.println("<th>Amount</th>");
                        			out.println("<th>Instructions</th>");
                        			out.println("<th>Duration</th>");
                        			out.println("</tr>");
                        			out.println("</thead>");
                        			
                        			// table body
                        			out.println("<tbody>");
                        			for(int i = 0; i < prescription.getDrugList().size(); i++)
                        			{
                            			
                            			out.println("<tr>");
                            			out.println("<td> <img src=\"../img/current_medicine.svg\"></td>");
                            			out.println("<td>"+ drugNameList.get(i) + " " + drugStrList.get(i) +"</td>");
                            			out.println("<td>"+ drugAmountList.get(i) + " " + drugDosageFormList.get(i) +"</td>");
                            			out.println("<td><div>"+ drugDosageList.get(i) + "</div><div>" + drugInfoList.get(i)  +"</div></td>");
                            			out.println("<td>"+ drugDurationList.get(i) +"</td>");
                            			out.println("</tr>");
                            			
                        			}

                        			out.println("</tbody>");
                        		}
                        	%>
                        </table>
                       
                        <a href="PatientMainPage.jsp">
                            <button type="button" id="back_btn">
                                    Back
                                </button>
                        </a>
                        <!-- /.card-body -->
                    </div>

                </div>
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
        $(document).ready(function() {
            $('#currentPrescription').DataTable({
                "paging":false,
                "lengthChange": false,
                "searching": false,
                "ordering": false,
                "info": false,
            });
        });

        // function openSection(evt, userType) {
        //     var i, tabcontent, tablinks;
        //     tabcontent = document.getElementsByClassName("tabcontent");
        //     for (i = 0; i < tabcontent.length; i++) {
        //         tabcontent[i].style.display = "none";
        //     }
        //     tablinks = document.getElementsByClassName("tablinks");
        //     for (i = 0; i < tablinks.length; i++) {
        //         tablinks[i].className = tablinks[i].className.replace(" active", "");
        //     }
        //     document.getElementById(userType).style.display = "block";
        //     evt.currentTarget.className += " active";
        // }
        // document.getElementById("defaultOpenTotalMed").click();
    </script>

</body>

</html>