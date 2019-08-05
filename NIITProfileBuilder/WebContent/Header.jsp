
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Online NIIT Resume Builder </title>
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    </head>
    <body>
    
       <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">NIIT's Resume Building</a>
    </div>
    <ul class="nav navbar-nav">
        <li><a href="/NIITResumeBuilder/WebContent/WEB-INF/views/index.jsp"><span class="glyphicon glyphicon-home"><b>&nbsp;Home</b></span></a>
  		<li><a href="NIITResumeBuilder/WebContent/WEB-INF/views/contact.jsp"><span class="glyphicon glyphicon-user"></span> Contact us</a></li>
      
    	<%if (session != null) {
    		if(session.getAttribute("loggedUser")!=null)
    		  {%>
    	      	<li><a href="profile"><i style="font-size:24px" class="fa">&#xf0f6;</i>&nbsp;Profile</a></li> 
     <%}%>
      
      <%if(session.getAttribute("loggedAdmin") !=null )
    		  {%>
            		<li><a href="Admin"><i style="font-size:24px" class="fa">&#xf0f6;</i>&nbsp;Admin</a></li>
      <%}}%>

    </ul>
    <ul class="nav navbar-nav navbar-right">
    <%if (session != null) {
    	if(session.getAttribute("loggedAdmin") !=null || session.getAttribute("loggedUser") != null)
    	{%>
    <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    	<%}
    	 else { %>
      <li><a href="regRedirect"><span class="glyphicon glyphicon-log-in"></span> Registration</a></li>
      <li><a href="loginRedirect"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
      <%}} %>
    </ul>
  </div>
           
</nav>
        
        <marquee behavior="scroll" direction="left">
            <h6>Welcome to NIIT's Online resume building portal, for more suggestions and complains please visit out contact us page.
            </h6>
        </marquee>
