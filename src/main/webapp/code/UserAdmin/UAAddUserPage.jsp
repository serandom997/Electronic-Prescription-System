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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.1/css/bootstrap.min.css">
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
session=request.getSession(false);

String msg = "";

//allow access only if session exists 
   String user=null;
   if(session.getAttribute("user")==null || session.getAttribute("user") !="Admin" ) {
   	
		//limiting access to specific group of Actors 
		// System.out.println("Error: " + session.getAttribute(" user"));
		response.sendRedirect("../UnAuthorizedPage.html"); 
	}
   else
   {
   	user = (String) session.getAttribute("user");
   	
   	// remove unused session attributes
   	
   	session.removeAttribute("roletype");
	session.removeAttribute("nric");
	session.removeAttribute("username");
	session.removeAttribute("firstname");
	session.removeAttribute("lastname");
	session.removeAttribute("dob");
	session.removeAttribute("sex");
	session.removeAttribute("contact");
	session.removeAttribute("email");
	session.removeAttribute("user_id");
	session.removeAttribute("name");
	
	session.removeAttribute("profile_ic");
	session.removeAttribute("profile_name");
	session.removeAttribute("profile_sex");
	session.removeAttribute("profile_email");
	session.removeAttribute("profile_age");
	session.removeAttribute("profile_contact");
	
	session.removeAttribute("profileidlist");
	session.removeAttribute("profilenamelist");
   	
   	String error1 = request.getParameter("ics");
   	String error2 = request.getParameter("uns");
   	String[] success = request.getParameterValues("success");
   	
   	if (error1 != null)
   	{
   		msg += "This NRIC has already been taken! </br>";
   	}
   	
   	if (error2 != null)
   	{
   		msg += "This username has already been taken! </br>";
   	}
   	
   	if(success != null)
   	{
	   	for (int i = 0; i < success.length; i++)
	   	{
	    	if (success[i].equals("1"))
	    	{
	    		msg += "User creation successful! </br>";
	    	}
	    	
	    	if (success[i].equals("2"))
	    	{
	    		msg += "Login details creation successful! </br>";
	    	}
	   	}
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
                    User Admin Patform
                </span>
                        <span class="pharmacy_name platform_name brand-image-xl logo-xs" id="platformShort_name">
                    
                </span>
                    </div>

                    <hr color="#EBEFF2" style="border:1; margin-top:35px; opacity: 0.8;">

                    <nav class=" mt-2 ">
                        <ul class="nav nav-pills nav-sidebar flex-column " data-widget="treeview " role="menu " data-accordion="false ">
                            <li class="nav-item active">
                                <a href="/pharmacy/AddUserGetRoleServlet" class="nav-link">
                                    <i class="nav-icon"><img src="../img/nav_home_icon.svg"></i>
                                    <p class="navHeader_patient">
                                        Add user
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="UASearchUserPage.jsp" class="nav-link">
                                    <i class="nav-icon"><img src="../img/prescription.svg"></i>
                                    <p class="navHeader_patient">
                                        Search user

                                    </p>
                                </a>
                                
                            </li>
                            
                            <li class="nav-item">
                        		<hr color="#EBEFF2" style="border:1; margin-top:10px; opacity: 0.8;">
                        	</li>
                            
                            <li class="nav-item">
                                <a href="/pharmacy/UserRoleProfileServlet" class="nav-link">
                                    <i class="nav-icon"><img src="../img/user_Profile.svg"></i>
                                    <p class="navHeader_patient">
                                        User Profile
                                    </p>
                                </a>
                            </li>
                            
                            <li class="nav-item">
                        		<hr color="#EBEFF2" style="border:1; margin-top:10px; opacity: 0.8;">
                        	</li>

                            <li class="nav-item ">

                                <a href="/pharmacy/ProfileServlet" class="nav-link ">
                                    <i class="nav-icon"><img src="../img/nav_profile_icon.svg"></i>
                                    <p class="navHeader_patient">
                                        Profile

                                    </p>
                                </a>
                            </li>

                            <li class="nav-item ">
                                <a href="/pharmacy/LogoutServlet " class="nav-link ">
                                    <i class="nav-icon"><img src="../img/nav_logout_icon.svg"></i>
                                    <p class="navHeader_patient">
                                        Logout
                                    </p>
                                </a>
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
                        <div class="card-header" style="padding-top: 20; padding-bottom: 20; background-color: white;">
                            <img src="img/add_yellow.svg" style="width: 25px; height:25px; margin-top: -5px;">
                            <p style="font-size:20px; color: black;margin-top: 25px; margin-left: 10px; display: inline;">Add New User</p>
                        </div>
                        <div id="settings" style="padding: 30px;">
                            <form class="form-horizontal" action="/pharmacy/AddUserServlet" method="post">
                                <div class="form-group row">
                                    <label for="inputUserName" class="col-sm-2 col-form-label">User Profile:</label>
                                    <div class="col-sm-10">

                                        <!-- <p class="form-control" id="userProfile" style="border: none; margin-left: -10px;">S123456789</p> -->
                                        <select class="form-control" id="userProfile" name="profile">
                                        	<%
	                                        	ArrayList<String> profileList = new ArrayList<String>();
	                                           	profileList = (ArrayList<String>) session.getAttribute("profilelist");
	                                    		
	                                    		for (int i = 0; i < profileList.size(); i++)
	                                    		{
	                                    			out.println("<option>" + profileList.get(i) + "</option>");
	                                    		}
                                    		%>
                                                
		                                    <!--  <option>Doctor</option>
		                                    <option>Pharmacist</option>
		                                    <option>Patient</option> -->
                                		</select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputPatientName" class="col-sm-2 col-form-label">NRIC</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="userNRIC" name="ic">

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputUserName" class="col-sm-2 col-form-label">UserName:</label>
                                    <div class="col-sm-10">

                                        <input type="text" class="form-control" id="userName" name="username">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputPatientName" class="col-sm-2 col-form-label">First Name:</label>
                                    <div class="col-sm-10">

                                        <input type="text" class="form-control" id="adminFullName" name="firstname">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputPatientName" class="col-sm-2 col-form-label">Last Name:</label>
                                    <div class="col-sm-10">

                                        <input type="text" class="form-control" id="adminFullName" name="lastname">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputPassword" class="col-sm-2 col-form-label">Password:</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Password">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputSex" class="col-sm-2 col-form-label">Sex：</label>
                                    <div class="col-sm-10" style="display: inherit;">
                                        <input type="radio" class="sex_input" id="female" name="sex" value="F">
                                        <label for="female" class="sex_label">F</label><br>
                                        <input type="radio" class="sex_input" id="male" name="sex" value="M">
                                        <label for="male" class="sex_label">M</label><br>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputAge" class="col-sm-2 col-form-label">Date of Birth：</label>
                                    <div class="col-sm-10">

                                        <input type="date" class="form-control" id="userAge" name="dob">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="inputEmail" class="col-sm-2 col-form-label">Contact:</label>
                                    <div class="col-sm-10">
                                        <input type="tel" class="form-control" id="inputContact" name="contact" placeholder="Contact Number">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputContact" class="col-sm-2 col-form-label">Email:</label>
                                    <div class="col-sm-10">
                                        <input type="tel" class="form-control" id="inputEmail" name="email" placeholder="Email">
                                    </div>
                                </div>
                                <!-- <div class="form-group row">
                            <div class="offset-sm-2 col-sm-10">
                                <button type="submit" id="add_user" class="btn" style="background-color: #109CF1; color: white;" data-toggle="modal" data-target="#addUserModal">Add user</button>
                            </div>
                        </div> -->
                                <!-- <button type="button" class="detail_action_btn" data-toggle="modal" data-target="#addUserModal"> -->
                                <button type="submit" class="detail_action_btn">
                            Add user
                        </button>

                                <div class="form-group row">
                                    <div class="offset-sm-2 col-sm-10">
                                        <font color=red>
                                            <%=msg %>
                                        </font>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div style="margin-top: 25px; float:left;width: 3px;height: 28px; background: #FED666;"></div>
                        <p style="font-size:20px; color: #109CF1;margin-top: 25px; margin-left: 10px; display: inline;">User has been added successfully</p>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    </div>
                    <div class="modal-body">
                        <p>NRIC:&nbsp;</p>
                        <div class="detail">
                            <!-- get patientID from DB-->
                            <label class="userNRIC">Ab1234567</label>
                        </div>
                        <p>User Profile:&nbsp;</p>
                        <div class="detail">
                            <!-- get patientName from DB-->
                            <label class="userProfile">Patient</label>
                        </div>

                        <p>Password:&nbsp;</p>
                        <div class="detail">
                            <!-- get patientAge from DB-->.............
                            <label class="patientName">.............</label>
                        </div>
                        <button type="button" style="float: right;" class="detail_action_btn">
                        Ok
                    </button>
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
        </script>
        <!-- OPTIONAL SCRIPTS -->
        <!-- <script src="plugins/chart.js/Chart.min.js "></script> -->
        <!-- AdminLTE for demo purposes -->
        <!-- <script src="dist/js/demo.js "></script> -->
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <!-- <script src="dist/js/pages/dashboard3.js "></script> -->
</body>

</html>