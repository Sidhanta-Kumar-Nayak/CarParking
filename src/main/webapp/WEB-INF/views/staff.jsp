<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
}

.fontFantasy {
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

.b3 {
	border: 2px solid #FAF884;
	border-radius: 5px;
	background: #FAF884;
	box-shadow: -10px 10px 5px 1px lightblue;
}

.logo {
	
}

.navi {
	height: 450px;
	width: 250px;
}

.role {
	margin-left: 640px;
}

.scrollarea{
	overflow-y: scroll;
	height:380px;
	box-shadow: -10px 10px 5px 1px lightblue;
}
.colorBox{
	background: lightblue;
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
			<c:if test="${msg eq 'saved'}">
				<script type="text/javascript">
					swal({
						title : "Booked Successfully!",
						text : "Click Ok to Continue !",
						icon : "success",
						button : "ok!",
					});
				</script>
			</c:if>
			<c:if test="${msg eq 'failed'}">
				<script type="text/javascript">
					swal({
						title : "Seats Not Available",
						text : "Click Ok to Continue !",
						icon : "error",
						button : "ok",
					});
				</script>
			</c:if>
			<c:if test="${msg eq 'add'}">
				<script type="text/javascript">
					swal({
						title : "Added Successfully!",
						text : "Click Ok to Continue !",
						icon : "success",
						button : "ok!",
					});
				</script>
			</c:if>
			<c:if test="${msg eq 'approve'}">
				<script type="text/javascript">
					swal({
						title : "Approved",
						text : "Click Ok to Continue !",
						icon : "success",
						button : "ok!",
					});
				</script>
			</c:if>
		</div>


		<div id="whiteBox" class="container bg-light box">
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
								<div class="wrapper fontFantasy">
									<ul class="list-group " style="list-style-type: none;">
										<li><a href="./parking"> <span class=""><i
													class="fasfa-desktop"></i></span> <span class="list-group-item">View
													Parking</span>
										</a></li>
										<li><a href="./manageBooking"> <span class="icon"><i
													class="fasfa-user-friends"></i></span> <span
												class="list-group-item">Manage Booking</span>
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
							<div class="mt-4 fontFantasy">
								<span>${userdtls.user.userName}</span> <span class="role"><i
									class="fa-solid fa-users"></i>${userdtls.user.role}</span> <br> <span
									class="">Car Name:</span> <span class="h4 text-secondary">
									${userdtls.carName}</span><br> <span>${userdtls.carNumber}</span>
							</div>





							<c:if test="${parking ne null}">
								<div class="container">
									<div class="card ">
										<div class="card-header bg-info text-light text-center">
											<div class="h5">Parking Management</div>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md-3">
													<label class="fontFantasy">Place</label> <select id="place"
														class="form-control" name="place" onclick="findDetails()"
														required="required">
														<option>--Select--</option>
														<c:forEach items="${placeList}" var="p">
															<option value="${p.placeId}">${p.placeName}</option>
														</c:forEach>
													</select>
												</div>
												<div class="col-md-3">
													<label class="fontFantasy">Price</label> <span id="price"></span>

												</div>
												<div class="col-md-3">
													<label class="fontFantasy">Available Seats</label> <span
														id="seats"></span>
												</div>

												<div class="row mt-2">

													<div class="col-md-3">
														<label class="fontFantasy">Add Seats</label> <input
															type="number" class="form-control" id="add" min="1"
															required="required">
														<button class="btn btn-success mt-1" onclick="addSeats()">Add</button>
													</div>

													<div class="col-md-3">
														<label class="fontFantasy">Delete Seats</label> <input
															type="number" class="form-control" id="delete" min="1"
															required="required">
														<button class="btn btn-danger mt-1"
															onclick="deleteSeats()">Delete</button>
													</div>
												</div>
											</div>
										</div>

									</div>


								</div>

							</c:if>
							
							
							<c:if test="${bookingList ne null }">
								<div class="scrollarea">
								<table class="table table-bordered">
									<thead class="bg-dark text-light">
										<tr>
											<th>slno</th>
											<th>User</th>
											<th>Date of Parking</th>
											<th>Place</th>
											<th>Price</th>
											<th>Action</th>
										</tr>
									</thead>
									
									<tbody class="colorBox">
									<c:forEach items="${bookingList}" var="b" varStatus="c">
										<tr>
											<td>${c.count}</td>
											<td>${b.user.userId}</td>
											<td>${b.dateOfBooking}</td>
											<td>${b.place.placeName}</td>
											<td>${b.place.price}</td>
											<td><a href="./approve?bId=${b.bookingId}" class="btn btn-success">Approve</a></td>
										</tr>
									
									</c:forEach>
									
									</tbody>
								</table>
								</div>

							</c:if>
							

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
		function myprice() {
			var pid = document.getElementById("placeId").value;

			console.log(pid);
			$.ajax({
				type : "get",
				url : "getPrice",
				data : "pId=" + pid,
				success : function(res) {
					$("#priceId").empty();
					$("#priceId").html(res);
				}
			});
		}
	</script>

	<script type="text/javascript">
		let count = 0;
		function changecolour() {
			if (count == 0) {
				document.getElementById("body").style.backgroundColor = "black";
				count = count + 1;
			} else {
				document.getElementById("body").style.backgroundColor = "#4592FE";
				count = 0;
			}
		}
	</script>
	<script type="text/javascript">
		function findDetails() {
			var pid = document.getElementById("place").value;
			console.log(pid);
			$.ajax({
				type : "get",
				url : "getDetails",
				data : "pId=" + pid,
				success : function(res) {
					$("#price").html(res);
					$.ajax({
						type : "get",
						url : "getSeats",
						data : "pId=" + pid,
						success : function(res) {
							$("#seats").html(res);

						}
					});
				}
			});

		}
	</script>

	<script type="text/javascript">
		function addSeats() {
			var pId = document.getElementById("place").value;
			var add = document.getElementById("add").value;
			if (pId != "--Select--") {
				if (add != 0) {

					$.ajax({
						type : "get",
						url : "add",
						data : "pId=" + pId + "&add=" + add,
						success : function(res) {
							if (res != null)
								swal({
									title : "Added Successfully!",
									text : "refreshing",
									icon : "success",
									button : "done",
								});

						}
					});
					setTimeout(function() {
						window.location.reload();
					}, 3000);
				} else {
					swal({
						title : "Error!",
						text : "value can not be 0",
						icon : "error",
						button : "done",
					});
				}
			} else {
				swal({
					title : "Error!",
					text : "Select Place First",
					icon : "error",
					button : "done",
				});
			}

		}

		function deleteSeats() {
			var pId = document.getElementById("place").value;
			var del = document.getElementById("delete").value;
			if (pId != "--Select--") {
				if (del != 0) {

					$.ajax({
						type : "get",
						url : "delete",
						data : "pId=" + pId + "&delete=" + del,
						success : function(res) {
							if (res != null)
								swal({
									title : "Delect Successfully!",
									text : "refreshing",
									icon : "success",
									button : "done",
								});

						}
					});
					setTimeout(function() {
						window.location.reload();
					}, 3000);
				} else {
					swal({
						title : "Error!",
						text : "value can not be 0",
						icon : "error",
						button : "done",
					});
				}
			} else {
				swal({
					title : "Error!",
					text : "Select Place First",
					icon : "error",
					button : "done",
				});
			}
		}
	</script>


</body>
</html>