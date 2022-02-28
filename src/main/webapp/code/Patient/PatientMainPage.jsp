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
        
        tr {
            width: 100%;
        }
        
        td,
        th {
            width: 65px;
            max-width: 65px;
            white-space: nowrap;
            overflow: hidden;
        }
        
        .tooltip-styling {
            position: absolute;
            color: white;
            text-align: center;
            border: 1px solid #000;
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

// remove unused attributes

session.removeAttribute("profile_ic");
session.removeAttribute("profile_name");
session.removeAttribute("profile_sex");
session.removeAttribute("profile_email");
session.removeAttribute("profile_age");
session.removeAttribute("profile_contact");

session.removeAttribute("drugnamelist");
session.removeAttribute("drugstrlist");
session.removeAttribute("drugamountlist");
session.removeAttribute("drugdosageformlist");
session.removeAttribute("drugdosagelist");
session.removeAttribute("druginfolist");
session.removeAttribute("drugdurationlist");

session.removeAttribute("prescriptionidlist");
session.removeAttribute("druglistsizelist");
session.removeAttribute("doctorlastnamelist");
session.removeAttribute("doctorfirstnamelist");
session.removeAttribute("createdatelist");
session.removeAttribute("statuslist");


String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}

String prescriptionID = "";
String createDate = "";
String status = "";
String patientID = "";



if(session.getAttribute("prescription_id") == null)
{
	response.sendRedirect("/pharmacy/GetPrescriptionStatusServlet");
}
else
{
	prescriptionID = Integer.toString((Integer) session.getAttribute("prescription_id"));
	createDate = (String) session.getAttribute("prescription_createdate");
	status = (String) session.getAttribute("prescription_status");
	patientID = Integer.toString((Integer) session.getAttribute("prescription_patientid"));
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
                                <p class="navHeader">
                                    Main Page
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
                            <a href="/pharmacy/ProfileServlet" class="nav-link">
                                <i class="nav-icon"><img src="../img/nav_profile_icon.svg"></i>
                                <p class="navHeader">
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

        <!-- Content Wrapper. Doctor Home Page -->
        <div class="content-wrapper ">
            <div id="action_tag">
                <h3>
                    Welcome,
                    <div id="userName">
                        <%=userName %>
                        <!-- Delete and get this name from userID -->
                    </div>
                </h3>

                <hr class="row col-12" color="#109CF1" style="height:2px; margin-left:-3px; margin-top:35px; width:98%; padding:0; opacity: 0.8;">

                <br>


            </div>

            <div class="half_container">
                <div class="current_med">Prescription Status
                </div>
                <div class="card" id="collection_status">

                    <!-- <div class="card-header card_select"> -->
                    <div class="card-body" id="collectionStatus">
                        <p>LDD Pharmacy</p>
                        <div class="collectionText">
                            <img src="../img/prescription_grey.svg" class="clockAlarm">
                            <div id="prescription_ID">Prescription ID: <%=prescriptionID %></div>
                        </div>
                        <div class="collectionText">
                            <img src="../img/clock.svg" class="clockAlarm">
                            <div id="collection_date"><%= createDate %></div>
                        </div>
                        <div class="collectionText">
                            <img src="../img/notifications.svg" class="clockAlarm">
                            <div>A QR code and token has been sent to your email, please show these to the pharmacist to collect your medication</div>
                        </div>
                        <div>
                            <%
                            	if(session.getAttribute("prescription_id") != null)
                            	{
                                	//String status = prescriptionStatus.getCollectionStatus();
                                	
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
                            	}

                            %>
                        </div>
                    </div>

                </div>


            </div>
            <!-- Current Preciption -->
            <div class="col-12">
                <!-- Button to show the current preciption section -->
                <footer class="card-footer" style="background-color:transparent;">
                	<form action="/pharmacy/PatientPrescriptionServlet" method="post">
                		<input type="hidden" name="callerPage" value="code/Patient/PatientLatestPrescription.jsp">
	                    <input type="hidden" name="patientID" value="<%= patientID %>">
	                    <button type="submit" id="view_btn" class="btn btn-primary" data-toggle="collapse" data-target="#demo">
	                        View Latest Prescription 
	                    </button>
                     </form>
                </footer>


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

</body>

</html>