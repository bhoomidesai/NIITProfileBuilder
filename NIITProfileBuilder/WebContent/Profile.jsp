<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="Header.jsp"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> 
<script lang="JavaScript">
function hidectrl(){
	document.getElementById("fresher").style.display = "none";
	document.getElementById("exp").style.display = "none";	
}
function setVisibility(id, visibility, id1, visibility1) {
		document.getElementById(id).style.display = visibility;
		document.getElementById(id1).style.display = visibility1;
}
</script>
</head>
<body onload="hidectrl();">
<div class="col-md-3 col-sm-2 highlight">
    <div id="myContainer" style=" width: 100%;"></div>
    </div>
	<div class="col-md-6 col-sm-6 highlight">
	<div id="myContainer" style=" width: 100%;">

    <h3><b>Welcome ${requestScope.user.name} </b></h3>
    <h4><b>Your Profile :</b></h4>
	<div class="row">
        <c:forEach var="error" items="${requestScope.error}" varStatus="status">
   	 <div><font color="red">${error}</font></div>
	</c:forEach>
<form action="update" method="get">
    <div class="form-group">
    	<label for="name">Name :</label>
    	<input type="text" class="form-control" name="name" placeholder="ie. Firstname Middlename Lastname" value ="${requestScope.user.name}" >
    </div>
    
   	<div class="form-group">
    	<label for="phoneNo">Phone no. :</label>
    	<input type="text" class="form-control" name="phoneNo" placeholder="ie. 9876543210" value ="${requestScope.user.phoneNo}">
    </div>
    
    <div class="form-group">
    	<label for="email">Email :</label>
    	<input type="text" class="form-control" name="email"  placeholder="ie. example@gmail.com" value ="${requestScope.user.email}">
    </div>
    
    <div class="form-group">
    	<label for="password">Password :</label>
    	<input type="password" class="form-control" name="password" placeholder="password" value ="${requestScope.user.password}" >
    </div>
    
    <div class="form-group">
    	<label for="status">Gender :</label>
    	<div class="radio">
  				<label><input type="radio" name="gender" value = "male" ${requestScope.user.gender == 'male'? 'checked':''} required>Male</label>
  				<label><input type="radio" name="gender" value = "female" ${requestScope.user.gender == 'female'? 'checked':''} required checked>Female</label> 
		</div>
	</div>
	
	<div class="form-group">
   	 	<label for="email">Location :</label>
    	<input type="text" class="form-control" name="address"  placeholder="Permenent Address" value ="${requestScope.user.address}">
    </div>
    
    <div class="form-group">
    	<label for="status">Status :</label>
    	<div class="radio">
  			<label><input type="radio" name="status" value = "fresher"${requestScope.user.status == 'fresher'? 'checked':''} onclick="setVisibility('fresher', 'inline','exp', 'none');" required >Fresher</label>
  			<label><input type="radio" name="status" value = "experienced" ${requestScope.user.status == 'experienced'? 'checked':''} onclick="setVisibility('exp', 'inline','fresher', 'none');" required>Experienced</label><label style="color: red;">Click to expand</label>  
		</div>
	</div>
	
	<div id = "fresher">
			<div class="form-group">
		    	<label for="sscScore">10th % :</label>
		    	<input type="number" min ="10" max = "100" class="form-control" name="sscScore"  placeholder="SSC Score " value ="${requestScope.user.sscScore}">
		  	</div> 
		  	
			<div class="form-group">
		    	<label for="sscYear">10th passing Year :</label>
					<select name = "sscYear" class="select" >
					<option selected disabled>Select passing year </option>
		  			<option value="2010" <c:if test="${requestScope.user.sscYear == 2010 }"> <c:out value= "selected = selected"/></c:if>>2010</option>
		  			<option value="2011" <c:if test="${requestScope.user.sscYear == 2011 }"> <c:out value= "selected = selected"/></c:if>>2011</option>
		  			<option value="2012" <c:if test="${requestScope.user.sscYear == 2012 }"> <c:out value= "selected = selected"/></c:if>>2012</option>
		  			<option value="2013" <c:if test="${requestScope.user.sscYear == 2013 }"> <c:out value= "selected = selected"/></c:if>>2013</option>
		  			<option value="2014" <c:if test="${requestScope.user.sscYear == 2014 }"> <c:out value= "selected = selected"/></c:if>>2014</option>
		  			<option value="2015" <c:if test="${requestScope.user.sscYear == 2015 }"> <c:out value= "selected = selected"/></c:if>>2015</option>
		  			<option value="2016" <c:if test="${requestScope.user.sscYear == 2016 }"> <c:out value= "selected = selected"/></c:if>>2016</option>
		  			<option value="2017" <c:if test="${requestScope.user.sscYear == 2017 }"> <c:out value= "selected = selected"/></c:if>>2017</option>
		  			<option value="2018" <c:if test="${requestScope.user.sscYear == 2018 }"> <c:out value= "selected = selected"/></c:if>>2018</option>
		  			<option value="2019" <c:if test="${requestScope.user.sscYear == 2019 }"> <c:out value= "selected = selected"/></c:if>>2019</option>
					</select>
			</div>
			<div class="form-group">
		    	<label for="hscScore">12th Score :</label>
		    	<input type="number" min ="10" max = "100" class="form-control" name="hscScore"  placeholder="HSC Score " value ="${requestScope.user.hscScore}">
		  	</div> 
		  	
			<div class="form-group">
		    	<label for="hscYear">12th passing Year :</label>
					<select name = "hscYear" class="select">
					<option selected disabled>Select passing year </option>
		  			<option selected disabled>Select passing year </option>
		  			<option value="2010" <c:if test="${requestScope.user.hscYear == 2010 }"> <c:out value= "selected = selected"/></c:if>>2010</option>
		  			<option value="2011" <c:if test="${requestScope.user.hscYear == 2011 }"> <c:out value= "selected = selected"/></c:if>>2011</option>
		  			<option value="2012" <c:if test="${requestScope.user.hscYear == 2012 }"> <c:out value= "selected = selected"/></c:if>>2012</option>
		  			<option value="2013" <c:if test="${requestScope.user.hscYear == 2013 }"> <c:out value= "selected = selected"/></c:if>>2013</option>
		  			<option value="2014" <c:if test="${requestScope.user.hscYear == 2014 }"> <c:out value= "selected = selected"/></c:if>>2014</option>
		  			<option value="2015" <c:if test="${requestScope.user.hscYear == 2015 }"> <c:out value= "selected = selected"/></c:if>>2015</option>
		  			<option value="2016" <c:if test="${requestScope.user.hscYear == 2016 }"> <c:out value= "selected = selected"/></c:if>>2016</option>
		  			<option value="2017" <c:if test="${requestScope.user.hscYear == 2017 }"> <c:out value= "selected = selected"/></c:if>>2017</option>
		  			<option value="2018" <c:if test="${requestScope.user.hscYear == 2018 }"> <c:out value= "selected = selected"/></c:if>>2018</option>
		  			<option value="2019" <c:if test="${requestScope.user.hscYear == 2019 }"> <c:out value= "selected = selected"/></c:if>>2019</option>
					</select>
			</div>
		  	
			<div class="form-group">
		    	<label for=education>Degree :</label>
					<select name = "education" class="select">
					<option selected disabled>Select resent degree </option>
		  			<option value="B.A" <c:if test="${requestScope.user.education eq 'B.A' }"> <c:out value= "selected = selected"/></c:if>>B.A</option>
		  			<option value="B.Com" <c:if test="${requestScope.user.education eq 'B.Com' }"> <c:out value= "selected = selected"/></c:if>>B.Com</option>
		  			<option value="B.Sc" <c:if test="${requestScope.user.education eq 'B.Sc' }"> <c:out value= "selected = selected"/></c:if>>B.Sc</option>
		  			<option value="BCA" <c:if test="${requestScope.user.education eq 'BCA'}"> <c:out value= "selected = selected"/></c:if>>BCA</option>
		  			<option value="B.E" <c:if test="${requestScope.user.education eq 'B.E' }"> <c:out value= "selected = selected"/></c:if>>B.E</option>
		  			<option value="B-Tech" <c:if test="${requestScope.user.education eq 'B-Tech' }"> <c:out value= "selected = selected"/></c:if>>B-Tech</option>
		  			<option value="M.A" <c:if test="${requestScope.user.education eq 'M.A' }"> <c:out value= "selected = selected"/></c:if>>M.A</option>
		  			<option value="M.Com" <c:if test="${requestScope.user.education eq 'M.A' }"> <c:out value= "selected = selected"/></c:if>>M.Com</option>
		  			<option value="M.Sc" <c:if test="${requestScope.user.education eq 'M.Com' }"> <c:out value= "selected = selected"/></c:if>>M.Sc</option>
		  			<option value="MCA" <c:if test="${requestScope.user.education eq 'MCA' }"> <c:out value= "selected = selected"/></c:if>>MCA</option>
		  			<option value="M.E" <c:if test="${requestScope.user.education eq 'M.E' }"> <c:out value= "selected = selected"/></c:if>>M.E</option>
		  			<option value="M-Tech" <c:if test="${requestScope.user.education eq 'M-Tech' }"> <c:out value= "selected = selected"/></c:if>>M-Tech</option>
		  			<option value="Diploma" <c:if test="${requestScope.user.education eq 'Diploma' }"> <c:out value= "selected = selected"/></c:if>>Diploma</option>
		  			<option value="PhD" <c:if test="${requestScope.user.education eq 'PhD' }"> <c:out value= "selected = selected"/></c:if>>PhD</option>
					</select>
			</div>
			<div class="form-group">
		    	<label for="specialization" >Specialization :</label>
		    	<input type="text" class="form-control" name="specialization"  placeholder="Specify stream of degree " value ="${requestScope.user.specialization}" >
		  	</div> 
		  	
		    <div class="form-group">
		    	<label for="proSkills">Professional Skills :</label>
		    	<textarea rows="4" class="form-control" name="proSkills"  placeholder="Professional/Technical Skills " >${requestScope.user.proSkills}</textarea>
		  	</div>
		  	
		  	<div class="form-group">
		    	<label for="personalSkills">Personal Skills :</label>
		    	<textarea rows="4" class="form-control" name="personalSkills"  placeholder="Personal Skills " >${requestScope.user.personalSkills}</textarea>
		  	</div>
		  	
		  	<div class="form-group">
		    	<label for="certifications">Certifications :</label>
		    	<input type="text" class="form-control" name="certifications"  placeholder="Certifications if any " value ="${requestScope.user.certifications}">
		  	</div>
		  	
		  	<div class="form-group">
		    	<label for="achievement">Achievement :</label>
		    	<textarea rows="4" class="form-control" name="achievement"  placeholder="Achivements " >${requestScope.user.achievement}</textarea>
		  	</div>
		  	
		  	<div class="form-group">
		    	<label for="project">Project :</label>
		    	<textarea rows="4"  class="form-control" name="project"  placeholder="Project description " >${requestScope.user.project}</textarea>
		  	</div>
	 </div>
	 
	 <div id="exp">
	 	<div class="form-group">
		    	<label for="profile">Profile :</label>
		    	<textarea rows="4"  class="form-control" name="profile"  placeholder="Write your profile " >${requestScope.user.profile}</textarea>
		 </div>
	 	<div class="form-group">
		    	<label for=masterDegree>Master Degree :</label>
					<select name = "masterDegree" class="select">
					<option selected disabled>Select Master Degree </option>
		  			<option value="M.A" <c:if test="${requestScope.user.masterDegree eq 'M.A' }"> <c:out value= "selected = selected"/></c:if>>M.A</option>
		  			<option value="M.Com" <c:if test="${requestScope.user.masterDegree eq 'M.A' }"> <c:out value= "selected = selected"/></c:if>>M.Com</option>
		  			<option value="M.Sc" <c:if test="${requestScope.user.masterDegree eq 'M.Com' }"> <c:out value= "selected = selected"/></c:if>>M.Sc</option>
		  			<option value="MCA" <c:if test="${requestScope.user.masterDegree eq 'MCA' }"> <c:out value= "selected = selected"/></c:if>>MCA</option>
		  			<option value="M.E" <c:if test="${requestScope.user.masterDegree eq 'M.E' }"> <c:out value= "selected = selected"/></c:if>>M.E</option>
		  			<option value="M-Tech" <c:if test="${requestScope.user.masterDegree eq 'M-Tech' }"> <c:out value= "selected = selected"/></c:if>>M-Tech</option>
		  			<option value="Diploma" <c:if test="${requestScope.user.masterDegree eq 'Diploma' }"> <c:out value= "selected = selected"/></c:if>>Diploma</option>
		  			<option value="PhD" <c:if test="${requestScope.user.masterDegree eq 'PhD' }"> <c:out value= "selected = selected"/></c:if>>PhD</option>
					<option value="pursuing" <c:if test="${requestScope.user.masterDegree == 'pursuing'}"> <c:out value= "selected = selected"/></c:if>>Currently pursuing</option>
		  			<option value="none" <c:if test="${requestScope.user.masterDegree == 'none'}"> <c:out value= "selected = selected"/></c:if>>None</option>
					</select>
			</div>
		  	<div class="form-group">
		    	<label for="jobTitle">Job Title :</label>
		    	<input type="text" class="form-control" name="jobTitle"  placeholder="Designation " value ="${requestScope.user.jobTitle}">
		  	</div>
		  	
		  	<div class="form-group">
		    	<label for="employer">Employer :</label>
		    	<input type="text" class="form-control" name="employer"  placeholder="Company Name " value ="${requestScope.user.employer}">
		  	</div>
		  	
		  	<div class="form-group">
		    	<label for="experience">Experience :</label>
					<select name = "experience" class="select" >
					<option selected disabled value="0">Select Experience in Years </option>
		  			<option value="1" <c:if test="${requestScope.user.experience == 1}"> <c:out value= "selected = selected"/></c:if>>1</option>
		  			<option value="2"<c:if test="${requestScope.user.experience == 2}"> <c:out value= "selected = selected"/></c:if>>2</option>
		  			<option value="3"<c:if test="${requestScope.user.experience == 3}"> <c:out value= "selected = selected"/></c:if>>3</option>
		  			<option value="4"<c:if test="${requestScope.user.experience == 4}"> <c:out value= "selected = selected"/></c:if>>4</option>
		  			<option value="5"<c:if test="${requestScope.user.experience == 5}"> <c:out value= "selected = selected"/></c:if>>5</option>
		  			<option value="6"<c:if test="${requestScope.user.experience == 6}"> <c:out value= "selected = selected"/></c:if>>6</option>
		  			<option value="7"<c:if test="${requestScope.user.experience == 7}"> <c:out value= "selected = selected"/></c:if>>7</option>
		  			<option value="8"<c:if test="${requestScope.user.experience == 8}"> <c:out value= "selected = selected"/></c:if>>8</option>
		  			<option value="9"<c:if test="${requestScope.user.experience == 9}"> <c:out value= "selected = selected"/></c:if>>9</option>
		  			<option value="10"<c:if test="${requestScope.user.experience == 10}"> <c:out value= "selected = selected"/></c:if>>10</option>
					</select>
			</div>
			<div class="form-group">
		    	<label for="expCertifications">Certifications :</label>
		    	<input type="text" class="form-control" name="expCertifications"  placeholder="Certifications if any " value ="${requestScope.user.expCertifications}">
		  	</div>
	</div>
		  <button type="submit" class="btn btn-success">Save Profile and next >></button>
</form>
		</div>
		<br/>
		</div>
</div>
  </body>    
<jsp:include page="footer.jsp"/>