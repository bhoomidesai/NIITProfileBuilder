<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="Header.jsp" />

<div class="col-md-3 col-sm-1 highlight">
    <div id="myContainer" style=" width: 100%;"></div>
    </div>
	<div class="col-md-6 col-sm-6 highlight">
	<div id="myContainer" style=" width: 100%;">
	<form action="search">
		<div class="form-group">
	 	<table><tr><td style="width:450px">
    		<input id="word" name="word"  class="form-control input-md"  type="text" placeholder="Search user data"></td><td>&nbsp; &nbsp;</td>
  			<td><input type="submit" name="submit" value="Search" class="btn btn-success"></td><td>&nbsp; &nbsp;</td>
  			<td><a href="Admin" class="btn btn-danger">Reset</a></td>
  			</tr>
  		</table>
  		</div>
	</form>
	</div>
</div>
	<br />
	<table class="table table-responsive">
	<tr> 
	<th>Name:</th> 
	<th>Phone-no:</th>
	<th>Email:</th>
	<th>password:</th>
	<th>gender:</th>
	<th>Location:</th>
	<th>Status:</th>
	<th>SSC-Score:</th>
	<th>SSC-Year:</th>
	<th>HSC-Score:</th>
	<th>HSC-Year:</th> 
	<th>Degree:</th>
	<th>Specialization:</th>
	<th>Professional-Skills:</th>
	<th>Personal-Skills:</th>
	<th>Certifications:</th>
	<th>Achievement:</th> 
	<th>Project:</th> 
	<th>Master-Degree:</th>
	<th>Job-Title:</th>
	<th>Employer:</th>
	<th>Experience:</th>
	<th>Project:</th>
	<th>Exp Certificate:</th>
	<th>Delete</th></tr>
	 <c:forEach var="user" items="${requestScope.userList}">
	<tr>
		<td>${user.name}</td>
		<td>${user.phoneNo}</td>
		<td>${user.email}</td>
		<td>${user.password}</td>
		<td>${user.gender}</td>
		<td>${user.address}</td>
		<td>${user.status}</td>
		<td>${user.sscScore}</td>
		<td>${user.sscYear}</td>
		<td>${user.hscScore}</td>
		<td>${user.hscYear}</td>
		<td>${user.education}</td>
		<td>${user.specialization}</td>
		<td>${user.proSkills}</td>
		<td>${user.personalSkills}</td>
		<td>${user.certifications}</td>
		<td>${user.achievement}</td>
		<td>${user.project}</td>
		<td>${user.masterDegree}</td>
		<td>${user.jobTitle}</td>
		<td>${user.employer}</td>
		<td>${user.experience}</td>
		<td>${user.project}</td>
		<td>${user.expCertifications}</td>
		<td><a href="delete?userEmail=${user.email}" class="btn btn-danger">Delete</a></td>
	</c:forEach>
	</table>

<jsp:include page="footer.jsp" />