<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css'
	rel='stylesheet' type='text/css'>
<script
	src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js'
	type='text/javascript'></script>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css'
	rel='stylesheet' type='text/css'>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js'
	type='text/javascript'></script>

<script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
<script src="https://kit.fontawesome.com/c1c53dbe72.js"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
body {
	background-color: lightblue;
}

.box {
	margin: auto;
	margin-top: 100px;
	border: solid blue 1px;
	border-radius: 5px;
	height: 350px;
	width: 400px;
}
</style>
<body>
	<div>
		<c:if test="${msg eq 'failed'}">
			<script type="text/javascript">
				swal({
					title : "Login failed !",
					text : "Invalid id !",
					icon : "error",
					button : "try again!",
				});
			</script>
		</c:if>

		<c:if test="${msg eq 'pass'}">
			<script type="text/javascript">
				swal({
					title : "Login failed !",
					text : "Invalid password !",
					icon : "error",
					button : "try again!",
				});
			</script>
		</c:if>
			<c:if test="${msg eq 'success'}">
				<script type="text/javascript">
				swal({
					title : "Registration Success!",
					text : "Click Ok to Continue !",
					icon : "success",
					button : "ok!",
				});
			</script>
			</c:if>
	</div>


	<c:if test="${create ne 'yes'}">
		<div class="box  bg-light">
			<div class="container bg-primary">
				<div class=" text-light p-2">
					<div class="h2">User Login</div>
				</div>
			</div>
			<div class="container mt-1">
				<div class="card-body m-1">

					<form class="form" method="post" action="./validateDetails">
						<div class="row">
							<div class="col-md-12 mt-2">
								<label>User ID</label> <input class="form-control" type="text"
									name="userId">
							</div>
							<div class="col-md-12">
								<label>Password</label> <input class="form-control"
									type="password" name="password">
							</div>
							<div>
								<span><a href="./createAccount">Create Account</a></span>
							</div>

							<div class="mt-2">
								<input type="submit" class="btn btn-primary" value="Login">
							</div>

						</div>
					</form>
				</div>
			</div>

		</div>
	</c:if>

	<c:if test="${create eq 'yes'}">
		<div class="container">
			<div>
				<form method="post" action="./saveUser">
					<div class="form row card">
						<div class="card-header bg-info">
							<span class="h2">Registration</span>
						</div>
						<div class="card-body">
							<span class="h2">Account Information</span>
							<div class="col-md-4">
								<label>User ID</label> <input class="form-control" type="number"
									name="userId">
							</div>
							<div class="col-md-4">
								<label>Password</label> <input class="form-control" type="text"
									name="password">
							</div>
							
							<div class="mt-3"><span class="h2">User Information</span></div>
							<hr>
							<div class="row">
								<div class="col-md-3">
									<label>Name</label>
									<input class="form-control" type="text" name="name">
								</div>
								<div class="col-md-3">
									<label>Car Name</label>
									<input class="form-control" type="text" name="carName">
								</div>
								
								<div class="col-md-3">
									<label>Car Number</label>
									<input class="form-control" type="text" name="carNumber">
								</div>
								<div class="col-md-3">
									<label>Driving Experience</label>
									<input class="form-control" type="number" name="exp">
								</div>
								<div class="col-md-3">
									<label>Date Of Birth</label>
									<input class="form-control" type="date" name="dob">
								</div>
								<div class="col-md-3">
									<label>Phone No</label>
									<span onchange="validatePhoneNumber()"><input class="form-control" id="phone"  type="number" name="phoneNo" placeholder="Enter a phone number"></span>
								</div>
								<div class="col-md-3">
									<label>Email</label>
									<input class="form-control" type="text" name="email"  placeholder="Enter email">
								</div>
									
							</div>
						</div>

						<div class="text-center">
							<a class="btn btn-info" href="./menu">Back To Home</a>
							<input class="btn btn-success" type="submit" value="Register">
						</div>
						<div class="mt-3"></div>
					</div>
				</form>

			</div>
		</div>
	</c:if>

<script>
    function validatePhoneNumber() {
      var phoneNumber = document.getElementById("phone").value;
      var phoneNumberPattern = /^\d{10}$/;
      
      if (phoneNumberPattern.test(phoneNumber)) {
    	  
      } else {
        alert("Phone number is not valid. Please enter a 10-digit phone number.");
      }
    }
  </script>

</body>
</html>