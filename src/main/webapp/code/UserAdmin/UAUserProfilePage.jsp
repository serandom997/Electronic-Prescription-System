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
//allow access only if session exists
String user = null;
if(session.getAttribute("user") == null || session.getAttribute("user") != "Admin") //limiting access to specific group of Actors
{
	response.sendRedirect("UnAuthorizedPage.html");
}
else user = (String) session.getAttribute("user");

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

String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
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
                    <span class="brand-image-xl logo-xs platform_left" style="margin-left: -12px;;">
                        Admin
                    </span>
                </div>

                <hr color="#EBEFF2" style="border:1; margin-top:35px; opacity: 0.8;">

                <nav class=" mt-2 ">
                    <ul class="nav nav-pills nav-sidebar flex-column " data-widget="treeview " role="menu " data-accordion="false ">
                        <li class="nav-item">
                            <a href="/pharmacy/AddUserGetRoleServlet" class="nav-link">
                                <i class="nav-icon"><img src="../img/add.svg"></i>
                                <p class="navHeader_patient">
                                    Add user
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="UASearchUserPage.jsp" class="nav-link">
                                <i class="nav-icon"><img src="../img/search.svg"></i>
                                <p class="navHeader_patient">
                                    Search user

                                </p>
                            </a>
							
                        </li>
                        
                        <li class="nav-item">
                        		<hr color="#EBEFF2" style="border:1; margin-top:10px; opacity: 0.8;">
                        </li>
                        
                        <li class="nav-item active">
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

                        <li class="nav-item">
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
                <div class="card" style="margin-top: 20px;margin-bottom: 0;">
                    <div class="card-header" style="padding-top: 0; padding-bottom: 20px; padding-top: 20px; background-color: white;">
                        <div style="float:left;width: 3px;height: 28px; background: #109CF1;"></div>
                        <p style="font-size:20px; color: black;margin-top: 25px; margin-left: 10px; display: inline;">User Profile</p>
                    </div>

                    <button class="col-sm-3 align-self-end add_newProfile_btn" data-toggle="modal" data-target="#AddNewProfileModal"><img src="../img/add.svg"> Add New User Profile</button>
                    <table id="profileTable" class="table table-hover table-bordered dt-responsive nowrap dataTable no-footer dtr-inline" style="width:100%">
                        <thead>
                            <tr style="opacity: 0.5; font-size: 15px;">
                                <th scope="col">#</th>
                                <th scope="col">Profile</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        	<%
                        		ArrayList<Integer> profileIdList = (ArrayList<Integer>) session.getAttribute("profileidlist");
                        		ArrayList<String> profileNameList = (ArrayList<String>) session.getAttribute("profilenamelist");
                        	
                        		if(profileIdList != null)
                        		{
                        			for(int i = 0; i < profileIdList.size(); i++)
                        			{
                        				out.println("<tr>");
                        				out.println("<th scope=\"row\">"+ profileIdList.get(i) +"</th>");
                        				out.println("<td>"+ profileNameList.get(i) +"</td>");
                        				out.println("<td>");
                        				out.println("<button type=\"button\" class=\"detail_action_btn\" data-toggle=\"modal\" data-target=\"#editProfileModal\">");
                        				out.println("Edit");
                        				out.println("</button>");
                        				out.println("</td>");
                        				out.println("</tr>");                     				
                        			}
                        		}
                        	%>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div style="float:left; width:3px; height: 28px; background: #F7685B;"></div>
                            <p style="font-size:20px;margin-left:10px;display: inline;">Edit User Profile</p>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        <form action="/pharmacy/UpdateUserRoleProfileServlet" method="post">
	                        <div class="modal-body">
	                            <div class="form-group row">
	                                <label for="profileName" class="col-sm-4 col-form-label">Profile Name:</label>
	                                <div class="col-sm-8">
	                                    <input type="text" class="form-control" id="EditProfileName" name="updatedProfileName" value="">
	                                    <input type="hidden" id="hiddenProfileId" name="hiddenProfileId" value="">
	                                </div>
	                            </div>
	                            <button type="submit" id="editProfile_btn" style="float: right; color: white; " class="blue_btn " aria-label="Close">
	                                Update
	                            </button>
	                            <!--<a class="btn btn-success btn-outline-primary" id="dispence_btn" onclick="toastr.success('Success Dispensed');">
	                             </a>-->
	                        </div>
                        </form>
                        <div class="modal-footer " style="border: none; ">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="AddNewProfileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <img src="../img/add_yellow.svg" style="margin-top:5px;">
                            <p style="font-size:20px;margin-left:10px;display: inline;">Add User Profile</p>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        <div class="modal-body">
                        	<form action="/pharmacy/AddUserProfileServlet" method="post">
	                            <div class="form-group row">
	                                <label for="profileName" class="col-sm-5 col-form-label">Enter Profile Name:</label>
	                                <div class="col-sm-7 new_left">
	                                    <input type="text" class="form-control" id="AddProfileName" name="profilename">
	                                </div>
	                            </div>
	                            <button type="submit" id="add_profile" style="float: right; color: white; " class="blue_btn" aria-label="Close">
	                                Add
	                            </button>
                            </form>
                            <!--<a class="btn btn-success btn-outline-primary" id="dispence_btn" onclick="toastr.success('Success Dispensed');">
                             </a>-->
                        </div>
                        <div class="modal-footer " style="border: none; ">
                        </div>
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
        $(".nav .nav-link").on("click", function() {
            $(".nav").find(".active").removeClass("active");
            $(this).addClass("active");
        });
        $(document).ready(function() {
            $('#profileTable').DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": false,
                "ordering": false,
                "info": false,
            });

          	
            $("#add_profile").click(function() {
                //call this function when success add
                swal("Success!", "You have added a new user profile!", "success");
            });
            $("#editProfile_btn").click(function() {
                //call this function when success edit
                swal("Success!", "You have edited the Profile Name!", "success");
            });
        });
        
        /*
        $("#profileTable tr").click(function() {
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
        $("#profileTable tr").click(function() {
			var profileid = $(this).find('th:first').text();
            document.getElementById("hiddenProfileId").value = profileid;

        });
        
        
        var currentURL = location.href;
        if(currentURL.includes("success"))
        {
        	if(currentURL.includes("add"))
        	{
        		swal("Success!", "User profile creation successful", "success");	
        	}
        	else if(currentURL.includes("update"))
        	{
        		swal("Success!", "User profile updated successfully", "success");	
        	}
        }
        
    </script>
    <!-- OPTIONAL SCRIPTS -->
    <!-- <script src="plugins/chart.js/Chart.min.js "></script> -->
    <!-- AdminLTE for demo purposes -->
    <!-- <script src="dist/js/demo.js "></script> -->
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <!-- <script src="dist/js/pages/dashboard3.js "></script> -->
</body>

</html>