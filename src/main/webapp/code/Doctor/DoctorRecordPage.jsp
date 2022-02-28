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
        
        td {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        table {
            table-layout: fixed;
            word-wrap: break-word;
        }
        
        input,
        input::-webkit-input-placeholder {
            font-size: 13px;
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
	response.sendRedirect("../UnAuthorizedPage.html");
}
else user = (String) session.getAttribute("user");

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

if(session.getAttribute("prescriptionlistsize") != null)
{
	

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
                    <ul class="nav nav-pills nav-sidebar flex-column " data-widget="treeview " role="menu " data-accordion="false ">
                        <li class="nav-item">
                            <a href="DoctorMainPage.jsp" class="nav-link">
                                <i class="nav-icon"><img src="../img/nav_home_icon.svg"></i>
                                <p class="navHeader">
                                    Home
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="DoctorPatientPage.jsp" class="nav-link ">
                                <i class="nav-icon"><img src="../img/nav_patient_icon.svg"></i>
                                <p class="navHeader">
                                    Patients

                                </p>
                            </a>
                        </li>

                        <li class="nav-item  active">
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
    </div>

    <!-- Content Wrapper. Doctor Home Page -->
    <div class="content-wrapper ">
        <div class="col-12">
            <div class="card" style="margin-top: 20px;">
                <div class="card-header" style="padding-top: 0; padding-bottom: 20px; padding-top: 20px; background-color: white;">
                    <div style="float:left;width: 3px;height: 28px; background: #109CF1;"></div>
                    <p style="font-size:20px; color: black;margin-top: 25px; margin-left: 10px; display: inline;">Search Prescriptions Records</p>
                </div>
                <div class="card-body">
                    <div>
                        <p class="searchLeft">Patient ID: </p>
                        <!-- search patient ID -->
                        <form action="/pharmacy/SearchPrescriptionServlet" method="post">
                            <input type="search" id="searchName" class="form-control form-control-lg" placeholder="Search patient IC" name="patientIC">
                            <input type="hidden" name="callerPage" value="code/Doctor/DoctorRecordPage.jsp">
                            <button type="submit" class="btn btn-outline-primary search_button">search</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="card" style="margin-top: 20px;">

                <table id="patient_table" class="table table-hover table-bordered dt-responsive nowrap">
                
               		<%   
               		
							if(session.getAttribute("patient_name") != null)
							{
								int presListSize = (int) session.getAttribute("prescriptionlistsize");
								ArrayList<Integer> prescriptionIdList = (ArrayList<Integer>) session.getAttribute("prescriptionidlist");
								ArrayList<Integer> drugListSizeList = (ArrayList<Integer>) session.getAttribute("druglistsizelist");
								ArrayList<String> createDateList = (ArrayList<String>) session.getAttribute("createdatelist");
								ArrayList<String> statusList = (ArrayList<String>) session.getAttribute("statuslist");
								
								String patientName = (String) session.getAttribute("patient_name");
								String search = request.getParameter("search");
								
                            		if(session.getAttribute("prescriptionlistsize") != null && search == null)
                           			{                 			
                            			String url = "DoctorRecordModify.jsp";
   	                            		
                            			out.println("<thead>");
                        				out.println("<tr>");
                        				out.println("<th>Prescriptions ID</th>");
                        				out.println("<th>Patient Name </th>");
                        				out.println("<th>Create Date</th>");
                        				out.println("<th>Status</th>");
                        				out.println("<th>Modify</th>");
                        				out.println(" </tr>");
                        				out.println(" </thead>");
                            			
                            			for (int i = 0; i < presListSize; i++)
                            					
                            			{
                            				
                            				String pid = Integer.toString(prescriptionIdList.get(i));
                            				
	                            			out.println("<tbody>");
	                            			out.println("<tr>");
	                            			
	                            			out.println("<td>");
	                            			out.println(pid);                         			
	                           				out.println("</td>");
	                           				
	                           				out.println("<td>");
	                           				out.println(patientName);
	                           				out.println("</td>");
	                           				
	                           				out.println("<td>");
	                           				out.println(createDateList.get(i)); 
	                           				out.println("</td>");
	                           				
	                           				out.println("<td>");
	                           				out.println(statusList.get(i)); 
	                           				out.println("</td>");
	                           					
	                           				out.println("<td>");
	                           				out.println("<form action=\"/pharmacy/DisplayPrescriptionServlet\" method=\"post\">");
	                           				out.println("<input type=\"hidden\" name=\"callerPage\" value=\"code/Doctor/DoctorRecordModify.jsp\">");
	                           				out.println("<input type=\"hidden\" name=\"prescriptionID\" value=\"" + pid + "\">");
	                           				out.println("<button type=\"submit\" style=\"background-color:#FFB946;\" class=\"modify_btn\">"); 
	                           				out.println("Modify");
	                           				out.println("</button>");
	                           				out.println("</a>");
	                           				out.println("</form>");
	                           				out.println("</td>");
	                           				
	                           				out.println("</tr>");
	                           				out.println("</tbody>");

                            			}
                           			}
							}
  		
                            	else
                              		{
                            			String search = request.getParameter("search");
                                       	if(search != null)
                                       	{
                                       		out.println("<tbody>");
                                			out.println("<tr>");
                                       		
                                       		out.println("<td>No such patient found</td>");
						
                                       		out.println("</tr>");
                               				out.println("</tbody>");
                                       	}
                              		}                 	
                        %> 
                </table>
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
        $(".nav .nav-link").on("click", function() {
            $(".nav").find(".active").removeClass("active");
            $(this).addClass("active");
        });
        $("#retrieve_drug_table tr").click(function() {
            var drugName = $(this).find('td:first').text();

            var space = document.createTextNode(' ');

            var td_drugName = document.createElement("td"); // 创建单元格
            var text_drugName = document.createTextNode(drugName); // 赋值给单元格的标签体
            td_drugName.appendChild(text_drugName);

            var td_tablet = document.createElement("td");
            td_tablet.setAttribute("class", "tablet")
            var input_tablet = document.createElement("input");
            input_tablet.setAttribute("type", "number")
            var text_tablet = document.createTextNode(' tablet');
            td_tablet.appendChild(input_tablet);
            td_tablet.appendChild(space);
            td_tablet.appendChild(text_tablet);

            var td_dosage = document.createElement("td");
            td_dosage.setAttribute("class", "tablet")
            var input_dosage = document.createElement("input");
            input_dosage.setAttribute("type", "text")
            input_dosage.setAttribute("style", "width:150px;");
            td_dosage.appendChild(input_dosage);
            td_dosage.appendChild(space);


            var td_duration = document.createElement("td");
            td_duration.setAttribute("class", "tablet")
            var input_duration = document.createElement("input");
            input_duration.setAttribute("type", "number")
            input_duration.setAttribute("class", "duration_days_select")
            td_duration.appendChild(input_duration);

            var duration_type = document.createElement("select");
            duration_type.setAttribute("class", "form-control duration_days")

            var optionDays = document.createElement("option");
            optionDays.value = "days";
            optionDays.text = "days"
            var optionWeeks = document.createElement("option");
            optionWeeks.value = "weeks";
            optionWeeks.text = "weeks"
            var optionMonth = document.createElement("option");
            optionMonth.value = "month";
            optionMonth.text = "month"
            var optionYears = document.createElement("option");
            optionYears.value = "years";
            optionYears.text = "years"
            duration_type.appendChild(optionDays);
            duration_type.appendChild(optionWeeks);
            duration_type.appendChild(optionMonth);
            duration_type.appendChild(optionYears);


            td_duration.appendChild(space);
            td_duration.appendChild(duration_type);

            var td_a = document.createElement("td");
            var ele_a = document.createElement("a");
            ele_a.setAttribute("href", "javascript:void(0);");
            ele_a.setAttribute("onclick", "deleteTr(this);");
            var text_a = document.createTextNode("Delete");
            ele_a.setAttribute("style", "color:#F7685B;");
            ele_a.appendChild(text_a);
            td_a.appendChild(ele_a);

            var tr = document.createElement("tr");

            tr.appendChild(td_drugName);
            tr.appendChild(td_tablet);
            tr.appendChild(td_dosage);
            tr.appendChild(td_duration);
            tr.appendChild(td_a);

            //var table = document.getElementById('drug_table');
            $("#drug_table").children("tbody").append(tr);
            $('#drug_table').DataTable();
            // };

        })

        function deleteTr(object) {
            // get table node
            var table = object.parentNode.parentNode.parentNode;
            // get tr node
            var tr = object.parentNode.parentNode;
            // delete and remove child
            table.removeChild(tr);
        }

        $(document).ready(function() {
            $('#patient_table').DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": false,
                "ordering": false,
                "info": false,
            });

        });
        $(document).ready(function() {

            $('#searchMed').select2();
        });
        $(".nav .nav-link").on("click ", function() {
            $(".nav ").find(".active ").removeClass("active ");
            $(this).addClass("active ");
        });
        $(document).ready(function() {
            /* table search function*/
            $('#drug_table').DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": false,
                "ordering": false,
                "info": false,
            });
            $(".dataTables_empty").empty();
            /* select box */
            $('#searchMed').select2();


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