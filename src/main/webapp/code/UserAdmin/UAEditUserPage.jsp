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
//allow access only if session exists
String user = null;
if(session.getAttribute("user") == null || session.getAttribute("user") != "Admin") //limiting access to specific group of Actors
{
	response.sendRedirect("../UnAuthorizedPage.html");
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
com.pharmacy.UserLogin userLoginSearch = (com.pharmacy.UserLogin) session.getAttribute("userLoginSearch");
com.pharmacy.UserProfile userProfileSearch = (com.pharmacy.UserProfile) session.getAttribute("userProfileSearch");


//Variables
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
int profileid = 0;
ArrayList<String> profileList = new ArrayList<String>();


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
	profileid = (int) session.getAttribute("userprofileid");
	profileList = (ArrayList<String>) session.getAttribute("profilelist");
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
                            <li class="nav-item active">
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

                            <li class="nav-item">
                                <hr color="#EBEFF2" style="border:1; margin-top:10px; opacity: 0.8;">
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
                        <p style="font-size:20px; color: black;margin-top: 25px;  display: inline;">Edit User Details</p>

                    </div>
                    <div id="settings" style="padding: 30px;">
                        <form class="form-horizontal" action="/pharmacy/UpdateUserDetailsServlet" method="post">
                        <input type="hidden" name="userid" value="<%=userid%>">
                        <input type="hidden" name="defaultUsername" value="<%=username%>">
                        
                            <div style="float:left; margin-left:-10px; width:3px;height: 20px; background: #F7685B;"></div>
                            <p style="font-size:15px; color:#109CF1;margin-top:25px; margin-left:10px;display: inline;">Account</p>
                            <div class="form-group row form_margin" style="margin-top: 20px;">
                                <label for="inputPatientName " class="col-sm-2 col-form-label ">NRIC: </label>
                                <div class="col-sm-10" style="margin-top: 5px;">
                                    <label id="userNRIC"><%=nric%></label>
                                    <input type="hidden" name="ic" value="<%=nric%>">
                                </div>
                            </div>
                            <div class="form-group row form_margin">
                                <label for="inputUserName " class="col-sm-2 col-form-labe">Username:</label>
                                <div class="col-sm-10 ">
                                    <input type="text " class="form-control " id="username" name="username" value="<%=username%>">
                                </div>
                            </div>
                            <div class="form-group row  form_margin">
                                <label for="inputPassword " class="col-sm-2 col-form-label ">Password:</label>
                                <div class="col-sm-10 ">
                                    <input type="password" class="form-control " id="inputPassword" name="password" placeholder="Password ">
                                </div>
                            </div>
                            <div class="form-group row form_margin" style="margin-top: 20px; ">
                                <label for="inputUserName " class="col-sm-2 col-form-label ">User Profile:</label>
                                <div class="col-sm-10 ">

                                    <!-- <p class="form-control " id="userProfile " style="border: none; margin-left: -10px; ">S123456789</p> -->
                                    <select class="form-control" name="profile">
                                    	<%
                                    	
                                    		for (int i = 0; i < profileList.size(); i++)
                                    		{
                                    			System.out.println("Role Name: " + profileList.get(i));
                                    		}
                                    	
                                    		System.out.println("Profile ID: " + profileid);
                                    		
                                    		for (int i = 0; i < profileList.size(); i++)
                                    		{
                                    			if (i == (profileid - 1))
                                    			{
                                    				out.println("<option selected>" + profileList.get(i) + "</option>");
                                    			}
                                    			else
                                    			{
                                    				out.println("<option>" + profileList.get(i) + "</option>");
                                    			}
                                    		}
                                    	%>
                                        <!--  <option>Doctor</option>
                                        <option>Patient</option>
                                        <option>Pharmacist</option>
                                        <option>UserAdmin</option> -->
                                    </select>
                                </div>
                            </div>

                            <div style="float:left; margin-left:-10px; width:3px;height: 20px; background: #F7685B;"></div>
                            <p style="font-size:15px; color:#109CF1;;margin-top:25px; margin-left:10px;display: inline;">Info</p>

                            <div class="form-group row form_margin " style="margin-top: 20px;">
                                <label for="inputPatientName " class="col-sm-2 col-form-label ">First Name:</label>
                                <div class="col-sm-10 ">

                                    <input type="text" class="form-control" name="firstname" value="<%=firstName%>">
                                </div>
                            </div>
                            
                            <div class="form-group row form_margin " style="margin-top: 20px;">
                                <label for="inputPatientName " class="col-sm-2 col-form-label ">Last Name:</label>
                                <div class="col-sm-10 ">

                                    <input type="text" class="form-control" name="lastname" value="<%=lastName%>">
                                </div>
                            </div>



                            <div class="form-group row form_margin">
                                <label for="inputSex" class="col-sm-2 col-form-label">Sex:</label>
                                <div class="col-sm-10" style="display: inherit;">
                                    <input type="radio" class="sex_input" id="female" name="sex" value="F" <%if(sex.equals("F")){out.println("checked");} %>>
                                    <label for="female" class="sex_label">F</label><br>
                                    <input type="radio" class="sex_input" id="male" name="sex" value="M" <%if(sex.equals("M")){out.println("checked");} %>>
                                    <label for="male" class="sex_label">M</label><br>
                                </div>
                            </div>
                            <div class="form-group row form_margin ">
                                <label for="inputAge " class="col-sm-2 col-form-label ">DOB</label>
                                <div class="col-sm-10 ">

                                    <input type="date" class="form-control " id="userAge" name="dob" value="<%=dob%>">
                                </div>
                            </div>

                            <div style="float:left; margin-left:-10px; width:3px;height: 20px; background: #F7685B;"></div>
                            <p style="font-size:15px; color:#109CF1; margin-top:25px; margin-left:10px;display: inline;">Contact</p>

                            <div class="form-group row form_margin" style="margin-top: 20px;">
                                <label for="inputContact " class="col-sm-2 col-form-label ">Contact:</label>
                                <div class="col-sm-10 ">
                                    <input type="tel" class="form-control " id="inputContact" name="contact" value="<%=contact%>">
                                </div>
                            </div>
                            <div class="form-group row form_margin">
                                <label for="inputEmail " class="col-sm-2 col-form-label ">Email:</label>
                                <div class="col-sm-10 ">
                                    <input type="email" class="form-control " id="inputEmail" name="email" value="<%=email%>">
                                </div>
                            </div>
                            <!-- <div class="form-group row ">
                                <div class="offset-sm-2 col-sm-10 ">
                                    <button type="submit " id="add_user " class="btn " style="background-color: #109CF1; color: white; " data-toggle="modal " data-target="#addUserModal ">Add user</button>
                                </div>
                            </div> -->
                            <div class="form-group row form_margin">
                                <button type="submit" class="edit_user btn">
                                     Save Change
                                </button>
                                <a href="javascript:history.go(-1)">
                                    <button type="button" class="bk_user btn">
                                    Back
                                    </button>
                                </a>
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js "></script>
        <!-- getdatepicker -->

        <!-- datatable -->
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js "></script>
        <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js "></script>
        <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js "></script>
        <script src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap4.min.js "></script>

        <script>
            $(".nav .nav-link ").on("click ", function() {
                $(".nav ").find(".active ").removeClass("active ");
                $(this).addClass("active ");
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