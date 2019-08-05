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
	    top: 40,
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

<style type="text/css">
    table, th, td{
        border: 1px solid #666;
    }
    table th, table td{
        padding: 10px; 
    }
</style>

<div class="col-md-2 col-sm-2 highlight">
    <div id="myContainer" style=" width: 100%;"><a href="templates" class="btn btn-success"> Back </a></div>
    </div>
    
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
	%>
	<div id="HTMLtoPDF">
	<h2  id="HTMLtoPDF" align="center" style="text-decoration: underline;">RESUME</h2>
	<b style="font-size: 20px;">Name : <%=name%></b>
	<br><b>
	Email : <%=email%>
	<br>
	Mobile No. : <%=phoneNo%>
	<br>
	Address : <%=address%>
</b>
	<hr style="border: 1px solid black;margin-top: 10px; margin-bottom: 1px;" />
	<hr style="border: 0.5px solid black;margin-top: 1px; margin-bottom: 10px;" />
	<h4 style="padding-top: 7px; padding-left: 5px;text-decoration: underline;"><b>OBJECTIVE</b></h4>
	<p style="font-size: 15px; text-align: justify;padding-left: 5px;">To succeed in an environment of growth
		and excellence and earn a job which provides me job satisfaction and
		self-development and help me achieve personal as well as organizational goals.</p>
	<h4 style="padding-top: 7px; padding-left: 5px;text-decoration: underline;"><b>EDUCATION</b></h4>
	<div align="center">
	<table  border="1"  >
	<tr >
		<th>Title</th>
		<th>Year of Completion</th>
		<th>Percentage | CGPA | CPI</th></tr>
		<tr>
			<td >SSC</td>
			<td><%=sscScore%></td>
			<td><%=sscYear%></td></tr>
		<tr>
			<td>HSC</td>
			<td><%=hscScore%></td>
			<td><%=hscYear%></td></tr>
		<tr>
			<td colspan="3"><%=education%> in <%=specialization%></td></tr>
	</table>
	</div>
	<h4 style="padding-top: 7px; padding-left: 5px;text-decoration: underline;"><b>PROFESSIONAL | TECHNICAL SKILLS</b></h4>
	<ul style="list-style-type:disc; font-size: 15px;">
	<%ArrayList<String> aList= new ArrayList<String>(Arrays.asList(proSkills.split(",")));
	for(int i=0;i<aList.size();i++)
	{%>
	    <li><%=aList.get(i)%></li>
	<% } %>
	</ul>
	<h4 style="padding-top: 7px; padding-left: 5px;text-decoration: underline;"><b>PERSONAL SKILLS</b></h4>
	<ul style="list-style-type:disc; font-size: 15px;">
	<%ArrayList<String> PList= new ArrayList<String>(Arrays.asList(personalSkills.split(",")));
	for(int i=0;i<PList.size();i++)
	{%>
	    <li><%=PList.get(i)%></li>
	<% } %>
	</ul>
	<h4 style="padding-top: 7px; padding-left: 5px;text-decoration: underline;"><b>ACHIEVEMENTS</b></h4>
	<ul style="list-style-type:disc; font-size: 15px;">
	<%ArrayList<String> acList= new ArrayList<String>(Arrays.asList(achievement.split(",")));
	for(int i=0;i<acList.size();i++)
	{%>
	    <li><%=acList.get(i)%></li>
	<% } %>
	</ul>
	<h4 style="padding-top: 7px; padding-left: 5px;text-decoration: underline;"><b>PROJECTS</b></h4>
	<p style="font-size: 15px; text-align: justify;padding-left: 25px;"><%=project %></p>
	<%boolean b = certifications.equalsIgnoreCase("NA")||certifications.equalsIgnoreCase("NO"); %>
	<%if(!b) {%>
	<h4 style="padding-top: 7px; padding-left: 5px;text-decoration: underline;"><b>CERTIFICATIONS</b></h4>
	<ul style="list-style-type:disc; font-size: 15px;">
	<%ArrayList<String> cList= new ArrayList<String>(Arrays.asList(certifications.split(",")));
	for(int i=0;i<cList.size();i++)
	{%>
	    <li><%=cList.get(i)%></li>
	<% } %>
	</ul>
	<%} %>
	<h4 style="padding-top: 7px; padding-left: 5px;text-decoration: underline;"><b>DECLARATION</b></h4>
	<p style="font-size: 15px; text-align: justify;padding-left: 25px;">I solemnly declare that all the above information is correct 
	to the best of my knowledge and belief,<br/><br/></p><p><b>Date :</b> <%= (new java.util.Date()).toLocaleString().substring(0, 12)%><br/><b>Place :</b> <%=address %></p>
	<p align="right" style="font-size: 15px;padding-right: 10px;" ><b>(<%=name %>)</b></p>
	</div>
	<br>
	<a href="#" onclick="HTMLtoPDF()" class="btn btn-success" id ="bypassme">Export to PDF</a>

	</div>	
	<br/>
	<br/>
	</div>
	<br><br>

	<jsp:include page="footer.jsp" />