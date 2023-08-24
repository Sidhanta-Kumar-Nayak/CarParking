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
	height:370px;
	box-shadow: -10px 10px 5px 1px lightblue;
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
										<li><a href="./dashboard?uId=${userdtls.user.userId}">
												<span class=""><i class="fasfa-desktop"></i></span> <span
												class="list-group-item">My Dashboard</span>
										</a></li>
										<li><a href="./booking"> <span class="icon"><i
													class="fasfa-user-friends"></i></span> <span
												class="list-group-item">Booking</span>
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

							<c:if test="${bookings ne null}">
								<div class="scrollarea">
									<table style="background:#ffff80" class="table h6 table-bordered text-center">
										<thead class="bg-dark text-light">
											<tr>
												<th>Booking Id</th>
												<th>Date Of Service</th>
												<th>Place</th>
												<th>Price</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${bookings}" var="book">
												<tr>
													<td>${book.bookingId}</td>
													<td><fmt:formatDate pattern="yyyy-MM-dd"
															value="${book.dateOfBooking}" /></td>
													<td>${book.place.placeName}</td>
													<td>${book.price}</td>
													<td
														<c:choose><c:when test="${book.status eq 'pending'}"> class="bg-danger text-light"  </c:when>  <c:otherwise> class="bg-success text-light" </c:otherwise></c:choose>>${book.status}</td>
												</tr>
											</c:forEach>

										</tbody>

									</table>
								</div>
							</c:if>

							<c:if test="${booking ne null}">
								<div class="">
									<span class="fontFantasy h4">Car & Personal Information</span>
									<hr>
									<div class=" p-2 b3">
										<form method="post" action="./book">
											<div class="form">
												<div class="row">
													<div class="col-md-3">
														<label class="fontFantasy">Car Name</label> <input
															disabled="disabled" class="form-control"
															placeholder="${userdtls.carName}">
													</div>

													<div class="col-md-3">
														<label class="fontFantasy">User Id</label> <input
															disabled="disabled" type="text" class="form-control"
															placeholder="${userdtls.user.userId}"> <input
															type="hidden" value="${userdtls.user.userId}"
															name="userId">
													</div>
												</div>
												<div class="row">
													<div class="col-md-3">
														<label class="fontFantasy">Date Of Parking</label> <input
															id="date" type="date" class="form-control" name="doP"
															min="${currDate}" required="required">
													</div>

													<div class="col-md-3 form-group">

														<label class="fontFantasy">Place</label> <select
															onchange="myprice()" name="place" id="placeId"
															class="form-control" required="required">
															<option value="">-select-</option>
															<c:forEach items="${placeList}" var="place">
																<option value="${place.placeId}">${place.placeName}</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="row">
													<div id="priceId"></div>
												</div>



											</div>
											<div class="text-center mt-3">
												<input type="submit" class="btn btn-success" value="Book">
											</div>
										</form>
									</div>
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


</body>
</html>