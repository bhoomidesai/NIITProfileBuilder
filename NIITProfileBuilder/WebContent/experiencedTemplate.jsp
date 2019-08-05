<%@page import = "java.util.ArrayList" %>
<%@page import = "java.util.Arrays" %>
<%@page import = "java.util.Date" %>
<jsp:include page="Header.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function HTMLtoPDF(){
	var pdf = new jsPDF('p', 'pt', 'letter');
	source = $('#HTMLtoPDF')[0];
	specialElementHandlers = {
		'#bypassme': function(element, renderer){
			return true
		}
	}
	margins = {
	    top: 50,
	    left: 60,
	    width: 545
	  };
	pdf.fromHTML(
	  	source 
	  	, margins.left 
	  	, margins.top 
	  	, {
	  		'width': margins.width 
	  		, 'elementHandlers': specialElementHandlers
	  	},
	  	function (dispose) {
	        pdf.save('Profile.pdf');
	      }
	  )		
	}
</script>

<div class="col-md-2 col-sm-2 highlight">
    <div id="myContainer" style=" width: 100%;"><a href="templates" class="btn btn-success"> Back </a></div>
    </div>
    <div id="HTMLtoPDF">
	<div class="col-md-8 col-sm-3 highlight">
	<div id="myContainer" style=" width: 100%;">
	<%
		ServletContext context = request.getServletContext();

		String name = (String)context.getAttribute("name");
		String phoneNo = (String)context.getAttribute("phoneNo");
		String email = (String)context.getAttribute("email");
		String address = (String)context.getAttribute("address");
		String certifications = (String)context.getAttribute("certifications");
		String education = (String)context.getAttribute("education");
		String specialization = (String)context.getAttribute("specialization");
		String employer = (String)context.getAttribute("employer");
		String experience = (String)context.getAttribute("experience");
		String gender = (String)context.getAttribute("gender");
		String jobTitle = (String)context.getAttribute("jobTitle");
		String personalSkills = (String)context.getAttribute("personalSkills");
		String proSkills = (String)context.getAttribute("proSkills");
		String masterDegree = (String)context.getAttribute("masterDegree");
		String sscScore = (String)context.getAttribute("sscScore");
		String sscYear = (String)context.getAttribute("sscYear");
		String hscScore = (String)context.getAttribute("hscScore");
		String hscYear = (String)context.getAttribute("hscYear");
		String achievement = (String)context.getAttribute("achievement");
		String project = (String)context.getAttribute("project");
		String profile = (String)context.getAttribute("profile");
		String expCertifications = (String)context.getAttribute("expCertifications");
	%>
	<h2 align="center" STYLE="margin-bottom: 1px;" ><b><%=name%></b></h2>
	<p align="center" style="font-size: 15px;">
	Email : <%=email%>
	<br>
	Mobile No. : <%=phoneNo%>
	<br>
	Address : <%=address%></p>

	<h4 style="padding-top: 7px; padding-left: 5px;margin-bottom: 3px;"><b>PROFILE</b></h4>
	<hr style="border: 0.5px solid black;margin-top: 1px; margin-bottom: 10px;" />
	<p style="font-size: 15px; text-align: justify;padding-left: 5px;"><%=profile %></p>
		<h4 style="padding-top: 7px; padding-left: 5px;margin-bottom: 3px;"><b>EXPERIENCE</b></h4>
	<hr style="border: 0.5px solid black;margin-top: 1px; margin-bottom: 10px;" />
	<p style="font-size: 15px;padding-left: 5px;">My Job experience includes <b><%=experience %></b> years as <b style="text-transform: uppercase;"><%=jobTitle %></b> at well known MNC  <b style="text-transform: uppercase;">"<%=employer %>"</b></p>
	<h4 style="padding-top: 7px; padding-left: 5px;margin-bottom: 3px;"><b>EDUCATION</b></h4>
	<hr style="border: 0.5px solid black;margin-top: 1px; margin-bottom: 10px;" />
	<p style="font-size: 15px;padding-left: 5px;"><%=masterDegree %></p>
	<h4 style="padding-top: 7px; padding-left: 5px;margin-bottom: 3px;"><b>PROFESSIONAL | TECHNICAL SKILLS</b></h4>
	<hr style="border: 0.5px solid black;margin-top: 1px; margin-bottom: 10px;" />
	<ul style="list-style-type:disc; font-size: 15px;">
	<%ArrayList<String> aList= new ArrayList<String>(Arrays.asList(proSkills.split(",")));
	for(int i=0;i<aList.size();i++)
	{%>
	    <li><%=aList.get(i)%></li>
	<% } %>
	</ul>
	<h4 style="padding-top: 7px; padding-left: 5px;margin-bottom: 3px;"><b>ACHIEVEMENTS</b></h4>
	<hr style="border: 0.5px solid black;margin-top: 1px; margin-bottom: 10px;" />
	<p style="font-size: 15px; text-align: justify;padding-left: 5px;"><%=achievement %></p>
	<h4 style="padding-top: 7px; padding-left: 5px;margin-bottom: 3px;"><b>PROJECTS | RESPONSIBILITIES</b></h4>
	<hr style="border: 0.5px solid black;margin-top: 1px; margin-bottom: 10px;" />
	<p style="font-size: 15px; text-align: justify;padding-left: 5px;"><%=project %></p>
	<h4 style="padding-top: 7px; padding-left: 5px;margin-bottom: 3px;"><b>CERTIFICATIONS</b></h4>
	<hr style="border: 0.5px solid black;margin-top: 1px; margin-bottom: 10px;" />
	<ul style="list-style-type:disc; font-size: 15px;">
	<%ArrayList<String> eList= new ArrayList<String>(Arrays.asList(expCertifications.split(",")));
	for(int i=0;i<eList.size();i++)
	{%>
	    <li><%=eList.get(i)%></li>
	<% } %>
	</ul>
	</div>
	<br>
	<a href="#" onclick="HTMLtoPDF()" class="btn btn-success" id ="bypassme">Export to PDF</a>
	</div>	
	<br/>
	<br/>
	</div>
	
