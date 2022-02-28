<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
//allow access only if session exists
String user = null;
if(session.getAttribute("user") == null || session.getAttribute("user") != "Admin") //limiting access to specific group of Actors
{
	response.sendRedirect("../UnAuthorizedPage.html");
}
else user = (String) session.getAttribute("user");

// remove unused session attributes

session.removeAttribute("profile_ic");
session.removeAttribute("profile_name");
session.removeAttribute("profile_sex");
session.removeAttribute("profile_email");
session.removeAttribute("profile_age");
session.removeAttribute("profile_contact");

session.removeAttribute("profileidlist");
session.removeAttribute("profilenamelist");

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
String[] error = request.getParameterValues("error");

if(error != null)
{
   	for (int i = 0; i < error.length; i++)
   	{
    	if (error[i].equals("error"))
    	{
    		msg += "Database Error! </br>";
    	}
    	
    	if (error[i].equals("notfound"))
    	{
    		msg += "Invalid user! </br>";
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
        <aside class="main-sidebar sidebar-dark-primary elevation-4" id="navleft_patient">
            <!-- Pharmacy Name -->

            <!-- <a href="#" class="brand-link noline" id="pharmacy_name"> -->
            <div class="brand-link noline" id="pharmacy_name">
                <span class="brand-text font-weight-light brand-image-xs logo-xl">
                    LDD<span class="pharmacy_title"> User Admin</span></span>
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
                        <li class="nav-item active">
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
        	<form action=/pharmacy/SearchUserServlet method="post">
	            <div class="col-12">
	                <div class="card" style="margin-top: 20px;margin-bottom: 0;">
	                    <div class="card-header" style="padding-top: 0; padding-bottom: 20px; padding-top: 20px; background-color: white;">
	                        <div style="float:left;width: 3px;height: 28px; background: #109CF1;"></div>
	                        <p style="font-size:20px; color: black;margin-top: 25px; margin-left: 10px; display: inline;">Search User</p>
	                    </div>
	
	                    <div class="card-body">
	                        <div>
	                        	
		                            <p class="searchLeft">Enter User NRIC: </p>
		                            <!-- search patient ID -->
		                            <input type="search" id="searchName" name="nric" class="form-control form-control-lg" placeholder="Search NRIC">
		                            <button type="submit" class="btn btn-outline-primary search_button">search</button>
	                            
	                        </div>
							<font color=red>
                        		<%=msg %>
                    		</font>
	                    </div>
	                </div>
	            </div>
            </form>
            <div class="col-12">
                <div class="card" style="margin-top: 20px;">
                    
                    
                    	<%
                    	
                    	com.pharmacy.UserProfile userProfileSearch = (com.pharmacy.UserProfile) session.getAttribute("userProfileSearch");
                    	com.pharmacy.UserLogin userLoginSearch = (com.pharmacy.UserLogin) session.getAttribute("userLoginSearch");
                    	
                    	if(session.getAttribute("nric") != null)
                    	{
                    		out.println("<table id=\"searchUser\" class=\"table table-hover table-bordered dt-responsive nowrap dataTable no-footer dtr-inline\" style=\"width:100%\">");
                    		out.println("<thead>");
                    		out.println("<tr>");
                    		out.println("<th>NRIC</th>");
                    		out.println("<th>Full Name</th>");
                    		out.println("<th>User Profile</th>");
                    		out.println("<th>Action</th>");
                    		out.println("</tr>");
                    		out.println("</thead>");
                    		
                    		//table body
                    		out.println("<tbody>");
                    		out.println("<tr>");
                    		out.println("<td>"+ (String) session.getAttribute("nric") +"</td>");
                    		out.println("<td>"+ (String) session.getAttribute("name") +"</td>");
                    		out.println("<td>"+ (String) session.getAttribute("roletype") +"</td>");
                    		out.println("<td>");
                    		out.println("<button type=\"button\" class=\"detail_action_btn\" data-toggle=\"modal\" data-target=\"#searchUserModal\">");
                    		out.println("Details");
                    		out.println("</button>");
                    		out.println("</td>");
                    		out.println("</tr>");
                    		out.println("</tbody>"); 
                    		out.println("</table>");
                    	}
       		           	
                    	%>
                        
                            

                        
                    
                </div>
            </div>

        </div>
    </div>

    <div class="modal fade" id="searchUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div style="margin-top: 25px; float:left;width: 3px;height: 28px; background: #FED666;"></div>
                    <p style="font-size:20px; color: #109CF1;margin-top: 25px; margin-left: 10px; display: inline;">User has been added successfully</p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                </div>
                
                <%
                	String roleType = "";
                	String nric = "";
                	String username = "";
                	String firstName = "";
                	String lastName = "";
                	String dob = ""; 
                	String sex = "";
                	int contact = 0;
                	String email = "";
                	int userid = 0;
                	
                	if(session.getAttribute("roletype") != null)
                	{
                		roleType = (String) session.getAttribute("roletype");
                		nric = (String) session.getAttribute("nric");
                		username = (String) session.getAttribute("username");
                		firstName = (String) session.getAttribute("firstname");
                		lastName = (String) session.getAttribute("lastname");
                		dob = (String) session.getAttribute("dob");
                		sex = (String) session.getAttribute("sex");
                		contact = (int) session.getAttribute("contact");
                		email = (String) session.getAttribute("email");
                		userid = (int) session.getAttribute("user_id");
                		
                	}
                %>
                <div class="modal-body">
                    <p>User Profile:&nbsp;</p>
                    <div class="detail">
                        <!-- get patientName from DB-->
                        <label class="SearchUserProfile"><%=roleType %></label>
                    </div>
                    <p>NRIC:&nbsp;</p>
                    <div class="detail">
                        <!-- get patientID from DB-->
                        <label class="SearchUserNRIC"><%=nric %></label>
                    </div>
                    <p>Username:&nbsp;</p>
                    <div class="detail">
                        <!-- get patientName from DB-->
                        <label class="SearchUserUsername"><%=username %></label>
                    </div>
                    <p>Full name:&nbsp;</p>
                    <div class="detail">
                        <!-- get patientID from DB-->
                        <label class="SearchUserFullName"><%=firstName + " " + lastName %></label>
                    </div>
                    <p>Age:&nbsp;</p>
                    <div class="detail">
                        <!-- get patientName from DB-->
                        <label class="SearchUserProfile"><%=dob %></label>
                    </div>
                    <p>Sex:&nbsp;</p>
                    <div class="detail">
                        <!-- get patientID from DB-->
                        <label class="SearchUserNRIC"><%=sex %></label>
                    </div>
                    <p>Contact:&nbsp;</p>
                    <div class="detail">
                        <!-- get patientName from DB-->
                        <label class="SearchUserUsername"><%=contact %></label>
                    </div>
                    <p>Email:&nbsp;</p>
                    <div class="detail">
                        <!-- get patientID from DB-->
                        <label class="SearchUserFullName"><%=email %></label>
                    </div>

                    <div>
                    	<form action="/pharmacy/DeleteUserServlet" method="post">
                    		<input type="hidden" name="userid" value="<%=userid%>">
                    		
	                        <button type="submit" class="white_btn1 btn">
	                            Delete                        	
	                        </button>
                        </form>

                       <!--   <a href="UAEditUserPage.jsp"> -->
                       	<form action="/pharmacy/EditUserGetRoleServlet" method="post">
                       		<input type="hidden" name="userid" value="<%=userid%>">
                            <button type="submit" class="edit_user btn ">
                            Edit User
                            </button>
                        </form>
                        </a>
                    </div>
                </div>
                <div class="modal-footer" style="border: none;">
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">

                    <p style="font-size:20px; color: #109CF1;margin-top: 25px; margin-left: 10px; display: inline;">Delete Account and data?</p>
                    <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button> -->
                </div>
                <div class="modal-body">
                    <p>NRIC:&nbsp;</p>
                    <div class="detail">
                        <!-- get patientID from DB-->
                        <label class="deleteUserNRIC">Ab1234567</label>
                    </div>
                    <p>User Profile:&nbsp;</p>
                    <div class="detail">
                        <!-- get patientName from DB-->
                        <label class="deleteUserProfile">Patient</label>
                    </div>z
                    <p class="deleteText">Deleting this person’s account will remove all their data from this system ,including user infomations and records.</p>


                    <button type="button" style="float: right" class="white_btn" data-dismiss="modal" aria-label="Close">
                            Cancel
                    </button>
                    <button type="button" style="float: right;background-color: #F7685B;color: white;" class="blue_btn" data-toggle="modal" data-target="#deleteModal">
                        Confirm Deletion
                    </button>
                </div>
                <div class="modal-footer" style="border: none;">
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <img style="margin-left: 10px; margin-top: 20px" src="img/blue arrow.svg" data-dismiss="modal" aria-label="Close"></i>
                    <p style="font-size:20px; color: #109CF1;margin-top: 15px; margin-left: 15px; display: inline;">Edit User Details</p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                </div>
                <div class="modal-body">
                    <div>
                        <div style="float:left;width: 3px;height: 28px; background: #F7685B;position: absolute;"></div>
                        <p style="font-size:16px; color: black; margin-left: 10px; display: inline;">Account</p>
                    </div>
                    <div class="edit-group">
                        <p>NRIC:&nbsp;</p>
                        <div class="detail">
                            <!-- get patientID from DB-->
                            <label class="SearchUserNRIC">Ab1234567</label>
                        </div>
                    </div>
                    <div class="edit-group">
                        <p>Username:&nbsp;</p>
                        <div class="detail">
                            <!-- get patientName from DB-->
                            <input type="text" class="form-control" id="username">
                        </div>
                    </div>
                    <div class="edit-group">
                        <p>Password:&nbsp;</p>
                        <div class="detail">
                            <!-- get patientName from DB-->
                            <input type="password" class="form-control" id="adminFullName">
                        </div>
                    </div>
                    <div class="edit-group">
                        <p>User Profile:&nbsp;</p>
                        <div class="detail">
                            <!-- get patientName from DB-->
                            <select class="form-control" style="width: 200px;display: inline-block">
                                            
                            <option>All</option>
                            <option>Patient</option>
                            <option>Doctor</option>
                            <option>Pharmacist</option>
                            <option>User Admin</option>
    
                        </select>
                        </div>
                    </div>
                    <div style="clear: both;">
                        <div style="float:left;width: 3px;height: 28px; background: #F7685B;position: absolute;"></div>
                        <p style="font-size:16px; color: black; margin-left: 10px; display: inline;">Info</p>
                    </div>
                    <div class="edit-group">
                        <p>Full Name:&nbsp;</p>
                        <div class="detail">
                            <!-- get patientName from DB-->
                            <input type="text" class="form-control" id="fullName">
                        </div>
                    </div>
                    <div class="edit-group">
                        <p>Sex:&nbsp;</p>
                        <div class="detail">
                            <input type="radio" class="sex_input" id="female" name="sex" value="F">
                            <label for="female" class="sex_label">F</label><br>
                            <input type="radio" class="sex_input" id="male" name="sex" value="M">
                            <label for="male" class="sex_label">M</label><br>
                        </div>
                    </div>
                    <div class="edit-group">
                        <p>Age:&nbsp;</p>
                        <div class="detail">
                            <!-- get patientName from DB-->
                            <input type="number" class="form-control" id="age">
                        </div>
                    </div>

                    <div style="clear: both;">
                        <div style="float:left;width: 3px;height: 28px; background: #F7685B;position: absolute;"></div>
                        <p style="font-size:16px; color: black; margin-left: 10px; display: inline;">Info</p>
                    </div>
                    <div class="edit-group">
                        <p>Contact:&nbsp;</p>
                        <div class="detail">
                            <!-- get patientName from DB-->
                            <input type="text" class="form-control" id="contact">
                        </div>
                    </div>
                    <div class="edit-group">
                        <p>Email:&nbsp;</p>
                        <div class="detail">
                            <!-- get patientName from DB-->
                            <input type="email" class="form-control" id="contact">
                        </div>
                    </div>
                    <button type="button" style="float: right" class="white_btn">
                             Back
                </button>
                    <button type="button" style="float: right; color: white;" class="blue_btn" data-toggle="modal" data-target="#deleteModal">
              Save
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