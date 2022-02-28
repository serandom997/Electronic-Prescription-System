<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII" session="true"%>


<%@ page import="java.util.ArrayList" %>
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../lib/style.css">
    <title>Pharmacist</title>
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
if(session.getAttribute("user") == null || session.getAttribute("user") != "Pharmacist") //limiting access to specific group of Actors
{
	response.sendRedirect("../UnAuthorizedPage.html");
}
else user = (String) session.getAttribute("user");

// remove unused session attributes

session.removeAttribute("patientic");
session.removeAttribute("patientage");
session.removeAttribute("patientsex");
session.removeAttribute("patientcontact");
session.removeAttribute("patientemail");

session.removeAttribute("profile_ic");
session.removeAttribute("profile_name");
session.removeAttribute("profile_sex");
session.removeAttribute("profile_email");
session.removeAttribute("profile_age");
session.removeAttribute("profile_contact");

String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}

String msg = "";
String error = request.getParameter("error");
String success = request.getParameter("success");

if (error != null)
{
	msg = "Invalid token!";
	
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
                        Pharmacist Platform
                    </span>
                    <span class="brand-image-xl logo-xs platform_left">
                        PHAR
                    </span>
                </div>

                <hr color="#EBEFF2" style="border:1; margin-top:35px; opacity: 0.8;">

                <nav class=" mt-2 ">
                    <ul class="nav nav-pills nav-sidebar flex-column " data-widget="treeview " role="menu" data-accordion="false ">
                        <li class="nav-item active">
                            <a href="PharmacistMainPage.jsp" class="nav-link">
                                <i class="nav-icon"><img src ="../img/nav_home_icon.svg"></i>
                                <p class="navHeader">
                                    Home
                                </p>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a href="PharmacistPatientPage.jsp" class="nav-link ">
                                <i class="nav-icon"><img src ="../img/nav_patient_icon.svg"></i>
                                <p class="navHeader">
                                    Patients
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
                            <form action="/pharmacy/LogoutServlet" method="post" class="nav-link">
	                            <i class="nav-icon"><img src="../img/nav_logout_icon.svg"></i>
	                            <p class="navHeader">
	                                <button type="submit" class="navHeader logout_btn">Logout</button>
	                            </p>
                            </form>
                        </li>
                    </ul>
                    <img src ="../img/nav_bk.svg" id="nav_bk" />
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Doctor Home Page -->
        <div class="content-wrapper ">
            <div class="container-fluid">
                <div class="row">
                    <!-- Main content -->
                    <!-- Main content -->
                    <section class="content">
                        <div class="card">
                            <div class="card-header">
                                <div id="pharmacistName">
                                   <%= userName %>
                                </div>

                                <div class="badge badge-primary userTag1">
                                    <div class="doctor">
                                        <img src ="../img/pharmacist_tag.svg" /> Pharmacist
                                    </div>
                                </div>

                                <span class="badge badge-primary userTag2">LDD pharmacy</span>
                            </div>
                        </div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12 cardTop_margin">
                                    <div class="card">

                                        <div class="card-header" style="padding-top: 0; padding-bottom: 20px; padding-top: 20px; background-color: white;">
                                            <div style="float:left;width: 3px;height: 28px; background: #109CF1;"></div>
                                            <p style="font-size:20px; color: black;margin-top: 25px; margin-left: 10px; display: inline;">View Medication</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="col-md-12 token_bk">
                                                <div class="col-md-7">
                                                    <form action="/pharmacy/SearchByTokenServlet" method="post">
                                                        <div class="input-group">
                                                            <p class="bar_label">Enter token :</p>
                                                            <input type="search" name="token" class="form-control rounded" placeholder="" aria-label="Search" aria-describedby="search-addon" />
                                                            <button type="submit" class="btn btn-outline-primary">search</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <!--this is the example when the user keyin the token and the table will be disply-->
                                            <div class="col-md-12">
                                                <table id="token_patient" class="table table-hover dt-responsive nowrap" style="width:100%">
                                                
                                                <%
                                                	int patientID = 0;
                                                	if (session.getAttribute("patient_id") != null)
                                                		{
                                                			patientID = (int) session.getAttribute("patient_id");
                                                		}
                                               		String patientName = (String) session.getAttribute("patient_name");
                                               		String doctorLastName = (String) session.getAttribute("doctor_lastname");
                                               		String doctorFirstName = (String) session.getAttribute("doctor_firstname");
                                               		String status = (String) session.getAttribute("prescription_status");
                                               		String token = (String) session.getAttribute("prescription_token");
                                               		ArrayList<String> allergies = new ArrayList<String>();
                                               		
                                               		if (session.getAttribute("patient_allergies") != null)
                                                	{
                                                		allergies = (ArrayList<String>) session.getAttribute("patient_allergies");	
                                                	}
                                                
                                                	if (patientName != null)
                                                	{
                                                    	//table head
                                                    	out.println("<thead style=\" border-style: hidden; font-size: 10px; font-weight: bold; color:#90A0B7;\">");
                                                    	out.println("<tr style=\"font-size: 10px; color:#90A0B7;\">");
                                                    	out.println("<th>Token ID</th>");
                                                    	out.println("<th>Patient ID</th>");
                                                    	out.println("<th>Patient Name</th>");
                                                    	out.println("<th>Assign Doctor</th>");
                                                    	out.println("<th>Drug allegy</th>");
                                                    	out.println("<th>Collection Status</th>");
                                                    	out.println("</tr>");
                                                    	out.println("</thead>");
                                                    	
                                                    	//table body
                                                    	out.println("<tbody>");
                                                    	out.println("<tr>");
                                                    	out.println("<td>");
                                                    	out.println("<label class=\"tokenID\" id=\"\">" + token + "</label>");
                                                    	out.println("</td>");
                                                    	out.println("<td>");
                                                    	out.println("<label class=\"patientID\" id=\"\">"+ patientID +"</label>");
                                                    	out.println("</td>");
                                                    	out.println("<td>");
                                                    	out.println("<label class=\"patientName\" id=\"\">"+ patientName +"</label>");
                                                    	out.println("</td>");
                                                    	out.println("<td>");
                                                    	out.println("<label class=\"assignDoctor\" id=\"\">Dr. "+ doctorLastName + ", " + doctorFirstName +"</label>");
                                                    	out.println("</td>");
                                                    	out.println("<td>");
                                                    	out.println("<label class=\"drugAllegy\" id=\"\">");
                                                    	
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
                                                    	
                                                    	out.println("</td>");
                                                    	out.println("<td class=\"mainpage_pharmacy_notCollect\">");
                                                    	out.println(status);
                                                    	out.println("</td>");
                                                    	out.println("</tr>");
                                                    	out.println("</tbody>");

                                                	}
                                          
                                                %>
                                                     
                                                    <font color=red><%=msg %></font>
                                                </table>
                                            </div>
                                        </div>
                                        <!--End of example-->
                                        <!--Add checkBox table-->

                                    </div>

                                </div>
                            </div>
                            <!--after search show the table with the dispense button-->
							<form action="/pharmacy/DispensePrescriptionServlet" method="post">
	                            <div class="card col-md-12" style="margin-top: 10px; padding-top: 20px;">
	
								
	                                
	                                
	                                <%
		                                int druglistsize = 0;
	                                	if (session.getAttribute("druglistsize") != null)
	                                		{
	                                			druglistsize = (int) session.getAttribute("druglistsize");
	                                		}
	                                	int prescriptionID = 0;
	                                	if (session.getAttribute("prescriptionid") != null)
	                                		{
	                                			prescriptionID = (int) session.getAttribute("prescriptionid");
	                                		}
		                        		ArrayList<String> drugNameList = (ArrayList<String>) session.getAttribute("drugnamelist");
			                    		ArrayList<String> drugStrList = (ArrayList<String>) session.getAttribute("drugstrlist");
			                    		ArrayList<Integer> drugAmountList = (ArrayList<Integer>) session.getAttribute("drugamountlist");
			                    		ArrayList<String> drugDosageFormList = (ArrayList<String>) session.getAttribute("drugdosageformlist");
			                    		ArrayList<String> drugDosageList = (ArrayList<String>) session.getAttribute("drugdosagelist");
			                    		ArrayList<String> drugInfoList = (ArrayList<String>) session.getAttribute("druginfolist");
			                    		ArrayList<String> drugDurationList = (ArrayList<String>) session.getAttribute("drugdurationlist");
			                    		ArrayList<Integer> listIDList = (ArrayList<Integer>) session.getAttribute("listidlist");
		                    		
	                                	if (drugNameList != null)
	                                	{
	                                		out.println("<table class=\"table table-hover dt-responsive\" id=\"token_record\" style=\"width:100%\">");
	                                    	out.println("<thead>");
	                                    	out.println("<tr style=\"opacity: 0.5; font-size: 12px;\">");
	                                    	out.println("<th scope=\"col\">#</th>");
	                                    	out.println("<th scope=\"col\">Drug</th>");                               	
	                                    	out.println("<th scope=\"col\">Dosage</th>");
	                                    	out.println("<th scope=\"col\">Duration</th>");
	                                    	out.println("<th scope=\"col\">Amount</th>");
	                                    	out.println("<th scope=\"col\">To Be Dispensed</th>");                               	
	                                    	out.println("</tr>");
	                                    	out.println("</thead>");
	                                    	
	                                    	
	                                    	out.println("<tbody>");
	                                    	
	                            			for(int i = 0; i < druglistsize; i++)
	                            			{
	                            				int index = i + 1;
	                            				out.println("<tr>");
	                            				out.println("<th scope=\"row\">"+ index +"</th>"); 
	                                			
	                                			
	                                			//out.println("<td> <img src=\"../img/current_medicine.svg\"></td>");
	                                			out.println("<td>"+ drugNameList.get(i) + " " + drugStrList.get(i) +"</td>");                          			
	                                			out.println("<td><div>"+ drugDosageList.get(i) + "</div><div>" + drugInfoList.get(i)  +"</div></td>");
	                                			out.println("<td>"+ drugDurationList.get(i) +"</td>");
	                                			out.println("<td>"+ drugAmountList.get(i) + " " + drugDosageFormList.get(i) +"</td>");
	                                			out.println("<td><input type=\"number\" name=\"dispenseAmount\">");
	                                			
	                                			
	                                			out.println("</tr>");
	                                			
	                                			out.println("<tr><input type=\"hidden\" name=\"amount\" value= \"" + drugAmountList.get(i) + "\" ></tr>");
	                                			out.println("<tr><input type=\"hidden\" name=\"listid\" value= \"" + listIDList.get(i) + "\" ></tr>");
	                                			
	                            			}
	                                    	
	                                    	                         	
											out.println("<tr><input type=\"hidden\" name=\"prescriptionID\" value= \""+ prescriptionID +"\"></tr>");
	                                    	out.println("</tbody>");
	                                    	out.println("</table>");
	                                	}
	
	                                	
	                                
	                                %>                      
	                                                                                                            
	                               
	                            
	                            </div>
	                            
	                            
	                            
									<!--Dispence button with success message after click-->
						            <footer class="card-footer" style="background-color:transparent;">
						                <a class="btn btn-success btn-outline-primary" id="dispence_btn" onclick="toastr.success('Success Dispensed');">
						                <button type="submit"> Dispense</button>         
						            </a>
						            </footer>
                            </form>
                        </div>

                    </section>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>

        <script>
            $(".nav .nav-link").on("click", function() {
                $(".nav").find(".active").removeClass("active");
                $(this).addClass("active");
            });

            $(document).ready(function() {
                $('#token_patient').DataTable({
                    "paging": false,
                    "lengthChange": true,
                    "searching": false,
                    "ordering": false,
                    "info": false,
                });
            });
            $(document).ready(function() {
                $('#token_record').DataTable({
                    "paging": false,
                    "lengthChange": true,
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