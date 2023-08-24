<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css'
	rel='stylesheet' type='text/css'>
<script
	src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js'
	type='text/javascript'></script>
<script src="https://kit.fontawesome.com/c1c53dbe72.js"
	crossorigin="anonymous"></script>
</head>
<style>
body {
	background-color: #4592FE;
	font-family: fantasy;
}

a {
	text-decoration: none;
}

.list-group-item:hover {
	background-color: lightblue;
	color: black;
}

.tone {
	position: relative;
	display: flex;
	padding-top: 25px;
	padding-left: 9px;
}

.dot {
	z-index: -1;
	height: 50px;
	width: 50px;
	background-color: white;
	border-radius: 50%;
}

.box {
	margin-top: 100px;
	border-radius: 10px;
	z-index: 10;
	height: 500px;
	width: 1100px;
}

.logo {
	background-image: url("../car.jpg");
}

.navi {
	height: 450px;
	width: 250px;
}
</style>
<body id="body">
	<div class="container">
		<div id="alertId">
			<c:if test="${msg eq 'success'}">
				<script type="text/javascript">
				swal({
					title : "Login Successful!",
					text : "Click Ok to Continue !",
					icon : "success",
					button : "aww iss!",
				});
			</script>
			</c:if>
		</div>


		<div class="container bg-light box">
			<div class="row">
				<div class="col-md-3 ">
					<div class="navi">
						<div class="container b1">
							<span class="logo bg-info"> <img alt="carLogo"
								src="https://cdn-icons-png.flaticon.com/512/2343/2343894.png"
								style="height: 50px; width: 50px; margin-top: 3px;"> <span
								class="h2" style="margin-top: 10px; padding-top: 3px;">Parking</span>
							</span>

							<div class="mt-3">
								<div class="wrapper">
									<ul class="list-group " style="list-style-type: none;">
										<li><a href="#dashboard"> <span class=""><i
													class="fasfa-desktop"></i></span> <span class="list-group-item">My
													Dashboard</span>
										</a></li>
										<li><a href="./booking"> <span class="icon"><i
													class="fasfa-user-friends"></i></span> <span
												class="list-group-item">Booking</span>
										</a></li>
										<li><a href="#"> <span class="icon"><i
													class="fasfa-tachometer-alt"></i></span> <span
												class="list-group-item">Next Service</span>
										</a></li>
										<li><a href="#"> <span class="icon"><i
													class="fasfa-database"></i></span> <span class="list-group-item">Transfer
													Schedule</span>
										</a></li>
										<li><a href="#"> <span class="icon"><i
													class="fasfa-chart-line"></i></span> <span class="list-group-item">Service
													Schedule</span>
										</a></li>
										<li><a href="#"> <span class="icon"><i
													class="fasfa-user-shield"></i></span> <span
												class="list-group-item">Parking Space Overview</span>
										</a></li>
										<li><a href="./menu"> <span class="icon"><i
													class="fasfa-cog"></i></span> <span class="list-group-item">Log
													Out</span>
										</a></li>
									</ul>

								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="col-md-9">
					<div class="container b2">

						<div class="">
							<div class="p-2 mt-4">
								<div class="">
									<span class="">Car Name:</span> <span
										class="h4 text-secondary "> ${userdtls.carName}</span>
								</div>

								<c:if test="${booking ne null}">
									<div>
										<span>Car & Personal Information</span>
									</div>
								</c:if>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>








		<div class="dot">
			<span class="tone" onclick="changecolour()"><i
				class="fa-sharp fa-solid fa-circle-half-stroke fa-2xl"></i></span>
		</div>
	</div>








	<script type="text/javascript">
let count=0;
function changecolour(){	
	if(count == 0){
		document.getElementById("body").style.backgroundColor = "black";
		count=count+1;
	}else{
		document.getElementById("body").style.backgroundColor = "#4592FE";
		count=0;
	}
}
</script>

	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded",()=>{
		setTimeout(function(){
			document.getElementById('alertId').style.display='none';
		},7000);
	});
	</script>
</body>
</html>