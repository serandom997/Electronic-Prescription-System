<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

session.removeAttribute("profile_ic");
session.removeAttribute("profile_name");
session.removeAttribute("profile_sex");
session.removeAttribute("profile_email");
session.removeAttribute("profile_age");
session.removeAttribute("profile_contact");

session.removeAttribute("drugamountlist");
session.removeAttribute("drugdosageformlist");
session.removeAttribute("druginfolist");



String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}

String search = request.getParameter("search");
String msg = "";

if(search != null)
	{
		msg += "No such prescription found!";
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
                        <li class="nav-item">
                            <a href="PatientMainPage.jsp " class="nav-link">
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
                            <a href="/pharmacy/ProfileServlet" class="nav-link ">
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
                    <div class="card-header" style="padding-top: 0; padding-bottom: 20px; padding-top: 20px; background-color: white;">
                        <!--<div style="float:left;width: 3px;height: 28px; background: #109CF1;"></div>
                        <p style="font-size:20px; color: black;margin-top: 25px; margin-left: 10px; display: inline;">Search Prescriptions Records</p>-->
                        <p style="font-size:20px; color: black; margin-left: 10px; margin-top: 25px;">
                            <img src="../img/pastMed.svg"> &nbsp Medical Records
                        </p>
                    </div>
                    <div class="card-body">
                    	<form action="/pharmacy/SearchPrescriptionByIDServlet" method="post" class="nav-link">
	                        <div>
	                            <p class="searchLeft">Prescriptions ID: </p>
	                            <!-- search patient ID -->
	                            <input type="hidden" name="callerPage" value="code/Patient/PatientRecordPage.jsp">
	                            <input type="hidden" name="patientID" value="<%= patientID %>">
	                            <input type="search" id="searchName" name="prescriptionID" class="form-control form-control-lg" placeholder="Search Prescription ID">
	                            <button type="submit" class="btn btn-outline-primary search_button">Search</button>
	                        </div>
	                        <div >
                           		<font color=red><%=msg %></font>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-12">
                <div class="card" style="margin-top: 20px;">

                    <!-- <table rules="rows" id="prescriptions_table" class="table table-hover table-bordered dt-responsive nowrap" style="width:100%"> -->
                    <table id="prescriptions_table" class="table table-hover table-bordered dt-responsive nowrap">
                       <%
                        	
                        		com.pharmacy.PrescriptionList prescriptionData = (com.pharmacy.PrescriptionList) session.getAttribute("searchPrescription");
                       			
		                        int presListSize = (int) session.getAttribute("prescriptionlistsize");
								ArrayList<Integer> prescriptionIdList = (ArrayList<Integer>) session.getAttribute("prescriptionidlist");
								ArrayList<Integer> drugListSizeList = (ArrayList<Integer>) session.getAttribute("druglistsizelist");
								ArrayList<String> doctorLastNameList = (ArrayList<String>) session.getAttribute("doctorlastnamelist");
								ArrayList<String> doctorFirstNameList = (ArrayList<String>) session.getAttribute("doctorfirstnamelist");
								ArrayList<String> createDateList = (ArrayList<String>) session.getAttribute("createdatelist");
								ArrayList<String> statusList = (ArrayList<String>) session.getAttribute("statuslist");
								
								ArrayList<ArrayList<String>> drugNameAL = (ArrayList<ArrayList<String>>) session.getAttribute("drugnamelist");
								ArrayList<ArrayList<String>> drugStrAL = (ArrayList<ArrayList<String>>) session.getAttribute("drugstrlist");
								ArrayList<ArrayList<Integer>> drugAmtAL = (ArrayList<ArrayList<Integer>>) session.getAttribute("drugamtlist");
								ArrayList<ArrayList<String>> drugDosageAL = (ArrayList<ArrayList<String>>) session.getAttribute("drugdosagelist");
								ArrayList<ArrayList<String>> drugDurationAL = (ArrayList<ArrayList<String>>) session.getAttribute("drugdurationlist");
                        	
	                        	if(prescriptionData != null)
	                   			{
	                        		out.println("<thead>");
	                        		out.println("<tr>");
	                        		out.println("<th>Prescriptions ID</th>");
	                        		out.println("<th>Total medication</th>");
	                        		out.println("<th>Doctor</th>");
	                        		out.println("<th>Issued date</th>");
	                        		out.println("<th>Status</th>");
	                        		out.println("<th>Detail</th>");
	                        		out.println("</tr>");
	                        		out.println("</thead>");
	                        		
	                        		out.println("<tbody>");
	                    		
	                    			for (int i = 0; i < presListSize; i++)
	                    				
	                    			{
		                    			out.println("<tr>");
		                    			
		                    			out.println("<td>");
		                   				out.println(prescriptionIdList.get(i)); 
		                   				out.println("</td>");
		                   				
		                   				out.println("<td>");
		                   				out.println(drugListSizeList.get(i));
		                   				out.println("</td>");
		                   				
		                   				out.println("<td>");
		                   				out.println("Dr. " + doctorLastNameList.get(i) + ", " + doctorFirstNameList.get(i)); 
		                   				out.println("</td>");
		                   				
		                   				out.println("<td>");
		                   				out.println(createDateList.get(i)); 
		                   				out.println("</td>");
		                   					
		                   				out.println("<td>");
		                   				
		                   				String status = statusList.get(i);
		                   				
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

	                                	}  
	                                	
		                   				out.println("</td>");
		                   				
		                   				out.println("<td><img src=\"../img/arrow_right.svg\" class=\"arrow\" data-toggle=\"modal\" data-target=\"#medicalRecordModal"+ i +"\"></td>");
		                   				out.println("</tr>");
	                    			}
	                    			
	                    			out.println("<tbody>");
	                   			}
                        	
                        	
                        	%>
                    </table>
                </div>
            </div>


			<%
				if(prescriptionData != null)
				{
					for (int i = 0; i < presListSize; i++)
					{
						out.println("<div class=\"modal fade bd-example-modal-lg\" id=\"medicalRecordModal"+ i +"\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">");
						out.println("<div class=\"modal-dialog modal-lg modal-dialog-centered\" role=\"document\">");
						out.println("<div class=\"modal-content\">");
						out.println("<div class=\"modal-header\" style=\"border:none;\">");
						out.println("<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">");
						out.println("<span aria-hidden=\"true\">&times;</span>");
						out.println("</button>");
						out.println("</div>");
						out.println("<div class=\"card-body\">");
						out.println("<h3 class=\"medicalRecordName\"><img src=\"../img/Line.svg\"> Medical Records</h3>");
						
						// prescription data
						out.println("<div>");
						out.println("<p class=\"modalInline\">Prescription ID: </p>");
						out.println("<div class=\"prescription_ID\">"+ prescriptionIdList.get(i) +"</div>");
						out.println("<p class=\"modalInline\">Doctor: </p>");
						out.println("<div class=\"doctor_name\">"+ "Dr. " + doctorLastNameList.get(i) + ", " + doctorFirstNameList.get(i) +"</div>");
						out.println("<p div class=\"modalInline\">Date: </p>");
						out.println("<div class=\"prescription_date\">"+ createDateList.get(i) +"</div>");
						out.println("</div>");
						out.println("<div class=\"tab_total\" id=\"defaultOpenTotalMed\">Total Medication: "+ drugListSizeList.get(i) +"</div>");
						//out.println("<div class=\"tab_not_collected\">Not collected: 2</div>");
						out.println("<div class=\"tab_partical\">");
						
						// prescription status
           				out.println("<td>");
           				
           				String status = statusList.get(i);
           				
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

                    	}  
                    	
           				out.println("</td>");
           				
						out.println("</div>");
						out.println("</div>");
						
						//medication
						out.println("<div class=\"card-body\">");
						out.println("<table id=\"medical_record_detail\" class=\"table table-hover dt-responsive nowrap\" style=\"width:100%\">");
            			//table header
            			out.println("<thead>");
                		out.println("<tr>");
                		out.println("<th>Medication</th>");
                		out.println("<th>Amount</th>");
                		out.println("<th>Dosage</th>");
                		out.println("<th>Duration</th>");
                		out.println("<th></th>");
                		out.println("</tr>");
                		out.println("</thead>");
                		
                		//table body
                		out.println("<tbody>");
                		
                		for(int j = 0; j < drugListSizeList.get(i); j++)
                		{
                			out.println("<tr>");
                    		out.println("<td>"+ drugNameAL.get(i).get(j) + " " + drugStrAL.get(i).get(j) + "</td>");
                    		out.println("<td>"+ drugAmtAL.get(i).get(j) +"</td>"); // amount
                    		out.println("<td>"+ drugDosageAL.get(i).get(j) +"</td>"); // dosage
                    		out.println("<td>"+ drugDurationAL.get(i).get(j) +"</td>"); //duration
                    		//out.println("<td><label class=\"patient_Dispenced\" id=\"\" style=\"visibility:visible\">Dispensed</label></td>"); 
                    		out.println("</tr>");
                		}
                		
                		out.println("</tbody>");
                		out.println("</table>");
                		out.println("</div>");
                		out.println("</div>");
                		out.println("</div>");
                		out.println("</div>");
                		out.println("</div>");
                		out.println("</div>");
					}
				}

				
				
			
			%>
                                  

                            



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
            $('#prescriptions_table').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": false,
                "info": false,
            });
            $('#medical_record_detail').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": false,
                "info": false,
            });
        });
        

        /*
        $("#prescriptions_table tr").click(function() {
        	//alert('You clicked row '+ ($(this).index()+1) );
            if (!location.href.includes("?"))
           	{            	
            	var currentURL = location.href;                       	
            	var newURL = currentURL + "?index=" + ($(this).index()+1);
            	location.assign(newURL);
           	}
            else
           	{
            	var currentURL = location.href;                       	
            	var newURL = currentURL + "&index=" + ($(this).index()+1);
            	location.assign(newURL);
           	}
        });
        */
        


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