<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
session = request.getSession(false);
//allow access only if session exists
String user = null;
if(session.getAttribute("user") == null || session.getAttribute("user") != "Doctor") //limiting access to specific group of Actors
{
	System.out.println("Error: " + session.getAttribute("user"));
	response.sendRedirect("/UnAuthorizedPage.html");
}
else user = (String) session.getAttribute("user");

// remove unused session attributes

session.removeAttribute("profile_ic");
session.removeAttribute("profile_name");
session.removeAttribute("profile_sex");
session.removeAttribute("profile_email");
session.removeAttribute("profile_age");
session.removeAttribute("profile_contact");

session.removeAttribute("searcheddruglist");
session.removeAttribute("drugnamelist");
session.removeAttribute("drugstrengthlist");
session.removeAttribute("drugdosagelist");
session.removeAttribute("drugformidlist");

session.removeAttribute("patient_name");
session.removeAttribute("patient_id");
session.removeAttribute("patient_age");
session.removeAttribute("patient_sex");
session.removeAttribute("patient_allergies");

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
                        <li class="nav-item">
                            <a href="DoctorMainPage.jsp" class="nav-link">
                                <i class="nav-icon"><img src="../img/nav_home_icon.svg"></i>
                                <p class="navHeader">
                                    Home
                                </p>
                            </a>
                        </li>
                        <li class="nav-item  active ">
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
                            <a href="/pharmacy/ProfileServlet" class="nav-link ">
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
            <div class="col-12">
                <div class="card" style="margin-top: 20px;">
                    <div class="card-header" style="padding-top: 0; padding-bottom: 20px; padding-top: 20px; background-color: white;">
                        <div style="float:left;width: 3px;height: 28px; background: #109CF1;"></div>
                        <p style="font-size:20px; color: black;margin-top: 25px; margin-left: 10px; display: inline;">Search Patient</p>
                    </div>
                    <div class="card-body">
                        <div>
                            <p class="searchLeft">Patient NRIC: </p>
                            <!-- search patient ID -->
                            <form action="/pharmacy/PatientSearchServlet" method="post">
	                            <input type="search" id="searchName" name="patientsearch" class="form-control form-control-lg" placeholder="Search patient NRIC">
	                            <input type="hidden" name="callerPage" value="code/Doctor/DoctorPatientPage.jsp">
	                            <button type="submit" class="btn btn-outline-primary search_button">search</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12">
                <div class="card" style="margin-top: 20px;">                        
                            	
                  	<% 
                  		com.pharmacy.PatientData patientData = (com.pharmacy.PatientData) session.getAttribute("searchPatient");
                  	
	                  	int id = 0;
	                	int age = 0;
	                	int contact = 0;
	                	ArrayList<String> allergies = new ArrayList<String>();
	                	if (session.getAttribute("patientid") != null)
	                	{
	                		id = (int) session.getAttribute("patientid");
	                	}
	                	if (session.getAttribute("patientage") != null)
	                	{
	                		age = (int) session.getAttribute("patientage");
	                	}
	                	if (session.getAttribute("patientcontact") != null)
	                	{
	                		contact = (int) session.getAttribute("patientcontact");
	                	}
	                	String ic = (String) session.getAttribute("patientic");
	                	String name = (String) session.getAttribute("patientname");
	                	String sex = (String) session.getAttribute("patientsex");
	                	String email = (String) session.getAttribute("patientemail");
	                	if (session.getAttribute("patientallergies") != null)
	                	{
	                		allergies = (ArrayList<String>) session.getAttribute("patientallergies");	
	                	}
                  	
                  		if(session.getAttribute("patientemail") != null)
                 		{
                  			out.println("<table id=\"patient_table\" class=\"table table-hover table-bordered dt-responsive nowrap\" style=\"width:100\">");
                  			out.println("<thead>");
                  			out.println("<tr>");
                  			out.println("<th>Patient ID</th>");
                  			out.println("<th>Patient NRIC</th>");
                  			out.println("<th>Patient Name</th>");
                  			out.println("<th>Contact </th>");
                  			out.println("<th>Email</th>");
                  			out.println("<th>Action</th>");
                  			out.println("</tr>");
                  			out.println("</thead>");
                  			out.println("<tbody>");                  			                  	                 			
                  			
                  			
                  			out.println("<tr>");
                  			
                  			out.println("<td>");
               				out.println(id); 
               				out.println("</td>");
               				
               				out.println("<td>");
               				out.println(ic); 
               				out.println("</td>");
               				
               				out.println("<td>");
               				out.println(name); 
               				out.println("</td>");
               				
               				out.println("<td>");
               				out.println(contact); 
               				out.println("</td>");
               				
               				out.println("<td>");
               				out.println(email); 
               				out.println("</td>");
               				
               				out.println("<td>");
               				out.println("<button type=\"button\" class=\"detail_action_btn\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">");
               				out.println("Details");
               				out.println("</button>");
               				out.println("</td>");
               				
               				out.println("</tr>");
               				out.println("</tbody>");
               				out.println("</table>");
               				
               				session.setAttribute("searchPatient", null);
               				session.removeAttribute("patientid");
               				session.removeAttribute("patientic");
               				session.removeAttribute("patientname");
               				session.removeAttribute("patientage");
               				session.removeAttribute("patientsex");
               				session.removeAttribute("patientcontact");
               				session.removeAttribute("patientemail");
               				session.removeAttribute("patientallergies");
                 		}
                  		else
                  		{
                  			String search = request.getParameter("search");
                             	
                           	if(search != null)
                           	{
                           		out.println("<tr><td>No such patient found<td></tr>");

                           	}
                  		}
                  	                     		
                  	%> 
                </div>
            </div>

            <!-- end of example-->
        </div>
    </div>


    <!-- /.control-sidebar -->
    <!-- popOut window -->
    <!-- Patient detail-->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div style="float:left; margin-right:5px; margin-top: 5px; width: 3px;height: 20px; background: #F7685B;"></div>
                    <h5 class="modal-title" id="exampleModalCenterTitle">Information Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                </div>
                <div class="modal-body">
                
                	<%
                		
                		if (patientData != null)
                		{
                			out.println("<p>Patient ID:&nbsp;</p>");
                			out.println("<div class=\"detail\">");
                			out.println("<label class=\"patientID\">" + id + "</label>");
                			out.println("</div>");
                			
                			out.println("<p>Patient Name:&nbsp;</p>");
                			out.println("<div class=\"detail\">");
                			out.println("<label class=\"patientName\">" + name + "</label>");
                			out.println("</div>");
                			
                			out.println("<p>Age:&nbsp;</p>");
                			out.println("<div class=\"detail\">");
                			out.println("<label class=\"patientAge\">" + age + "</label>");
                			out.println("</div>");
                			
                			out.println("<p>Sex:&nbsp;</p>");
                			out.println("<div class=\"detail\">");
                			out.println("<label class=\"patientSex\">" + sex + "</label>");
                			out.println("</div>");
                			
                			out.println("<p>Contact:&nbsp;</p>");
                			out.println("<div class=\"detail\">");
                			out.println("<label class=\"patientContact\">" + contact + "</label>");
                			out.println("</div>");
                			
                			out.println("<p>Email:&nbsp;</p>");
                			out.println("<div class=\"detail\">");
                			out.println("<label class=\"patientEmail\">" + email + "</label>");
                			out.println("</div>");
                			
                			out.println("<p>Drug Allergy:&nbsp;</p>");
                			out.println("<div class=\"detail\">");
                			out.println("<label class=\"PatientAllergy\">");
                			

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
                			out.println("</div>");
                		}
                	
                	%>



                </div>
                <div class="modal-footer" style="border: none;">
                </div>
            </div>
        </div>
    </div>
    <!-- ./wrapper -->
    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js "></script>
    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js "></script>
    <!-- AdminLTE -->
    <script src="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/js/adminlte.js "></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- getdatepicker -->
    <!-- datatable -->
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap4.min.js"></script>

    <script>
        $(".nav .nav-link").on("click", function() {
            $(".nav").find(".active").removeClass("active");
            $(this).addClass("active");
        });

        $(document).ready(function() {
            $('#patient_table').DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": false,
                "ordering": false,
                "info": false,
            });
        });
    </script>
    <!-- OPTIONAL SCRIPTS -->
    <!-- <script src="plugins/chart.js/Chart.min.js "></script> -->
    <!-- AdminLTE for demo purposes -->
    <!-- <script src="dist/js/demo.js "></script> -->
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <!-- <script src="dist/js/pages/dashboard3.js "></script> -->
    </div>
</body>

</html>