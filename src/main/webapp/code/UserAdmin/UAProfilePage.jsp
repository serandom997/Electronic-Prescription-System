<%@page language="java" session="true" %>
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
		session=request.getSession(false);
	
		String ic = "";
	    String name = "";
	    String sex = "";
	    String email = "";
	    int age = 0;
	    int contact = 0;
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
	    	
	    	session.removeAttribute("profileidlist");
			session.removeAttribute("profilenamelist");
			
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
	    	
	    	ic = (String) session.getAttribute("profile_ic");
		    name = (String) session.getAttribute("profile_name");
		    sex = (String) session.getAttribute("profile_sex");
		    email = (String) session.getAttribute("profile_email");
		    age = (int) session.getAttribute("profile_age");
		    contact = (int) session.getAttribute("profile_contact");
		    
		    String error1 = request.getParameter("ps");
		    String error2 = request.getParameter("pnm");
		    String error3 = request.getParameter("cmt");
		    String error4 = request.getParameter("cnm");
		    String error5 = request.getParameter("emt");
		    String error6 = request.getParameter("enm");
		    String success1 = request.getParameter("psc");
		    String success2 = request.getParameter("csc");
		    String success3 = request.getParameter("esc");
		    
		    if (error1 != null)
		    {
		    	msg += "New password cannot be the same as your current one! </br>";
		    }
		    
		    if (error2 != null)
		    {
		    	msg += "Invalid password keyed in! Alphanumeruc characters only, min 2 characters and max 45 characters! </br>";
		    }
		    
		    if (error3 != null)
		    {
		    	msg += "Contact Number cannot be empty! </br>";
		    }
		    
		    if (error4 != null)
		    {
		    	msg += "Please enter a valid contact number! </br>";
		    }
		    
		    if (error5 != null)
		    {
		    	msg += "Email cannot be empty! </br>";
		    }
		    
		    if (error6 != null)
		    {
		    	msg += "Please enter a valid email! </br>";
		    }
		    
		    if (success1 != null)
		    {
		    	msg += "Password changed successfully! </br>";
		    }
		    
		    if (success2 != null)
		    {
		    	msg += "Contact Number changed successfully! </br>";
		    }
		    
		    if (success3 != null)
		    {
		    	msg += "Email changed successfully! </br>";
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
                        User Admin Patform
                    </span>
                    <span class="pharmacy_name platform_name brand-image-xl logo-xs" id="platformShort_name">
                        
                    </span>
                </div>

                <hr color="#EBEFF2" style="border:1; margin-top:35px; opacity: 0.8;">

                <nav class=" mt-2 ">
                    <ul class="nav nav-pills nav-sidebar flex-column " data-widget="treeview " role="menu " data-accordion="false ">
                        <li class="nav-item">
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
                        
                        <li class="nav-item ">
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

                        <li class="nav-item active">
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
                    <div class="card-header" style="padding-top: 0; padding-bottom: 20px; padding-top: 20px; background-color: white;">
                        <div style="float:left;width: 3px;height: 28px; background: #109CF1;"></div>
                        <p style="font-size:20px; color: black;margin-top: 25px; margin-left: 10px; display: inline;">Personal Profile</p>
                    </div>
                    <div id="settings" style="padding: 30px;">
                        <form class="form-horizontal" action="/pharmacy/ProfileUpdateServlet" method="post">
                            <div class="form-group row">
                                <label for="NRIC" class="col-sm-2 col-form-label">NRIC:</label>
                                <div class="col-sm-10">
                                    <p class="form-control" id="NRIC" style="border: none; margin-left: -10px;"><%=ic %></p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="adminName" class="col-sm-2 col-form-label">Admin Name:</label>
                                <div class="col-sm-10">
                                    <p class="form-control" id="adminName" style="border: none; margin-left: -10px;"><%=name %> </p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword" class="col-sm-2 col-form-label">Password:</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="inputPassword" name="password">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputSex" class="col-sm-2 col-form-label">Sex:</label>
                                <div class="col-sm-10">
                                    <p class="form-control" id="userSex" style="border: none; margin-left: -10px;"><%=sex %></p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputAge" class="col-sm-2 col-form-label">Age:</label>
                                <div class="col-sm-10">
                                    <p class="form-control" id="userAge" style="border: none; margin-left: -10px;"><%=age %></p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputContact" class="col-sm-2 col-form-label">Contact Number:</label>
                                <div class="col-sm-10">
                                    <input type="tel" class="form-control" id="inputContact" name="contactNum" value="<%=contact %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputContact" class="col-sm-2 col-form-label">Email:</label>
                                <div class="col-sm-10">
                                    <input type="tel" class="form-control " id="inputEmail" name="email" value="<%=email %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="offset-sm-2 col-sm-10">
                                    <button type="submit" id="update_change" class="btn" style="background-color: #109CF1; color: white;">Update Change</button>
                                </div>
                            </div>
                            <div class="form-group row">
                            	<div class="offset-sm-2 col-sm-10">
                            		<font color=red><%=msg %></font>
                            	</div>
                            </div>
                        </form>
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