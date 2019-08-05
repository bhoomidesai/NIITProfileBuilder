<jsp:include page="Header.jsp" />
<div class="col-md-3 col-sm-2 highlight">
    <div id="myContainer" style=" width: 100%;"></div>
    </div>
	<div class="col-md-6 col-sm-6 highlight">
	<div id="myContainer" style=" width: 100%;">

    <h2><b>Login</b></h2>
<br />
 <form action="login" method="get">
   
    <div class="form-group">
    	<label for="email">Email :</label>
    	<input type="text" class="form-control" name="email"  placeholder="ie. example@gmail.com">
    </div>
    
    <div class="form-group">
    	<label for="pno">Password :</label>
    	<input type="password" class="form-control" name="password" placeholder="password" >
    </div>

				<div class="form-group">
						<button type="submit" class="btn btn-success">Login</button>
				</div>
				<div class="form-group">
						<h5>
							<a>Forget password...!</a>
						</h5>
						<h5>
							<a href="regRedirect">Register</a>

						</h5>
				</div>
				<div class="form-group">
						<h5 style="color: red">
							<%
								if (request.getAttribute("invalid") == null) {

								} else {
									out.print(request.getAttribute("invalid"));
								}
							%>
						</h5>
					</div>

			</form>
		</div>
	</div>
	<br /> <br /> <br /> <br /> <br />



<jsp:include page="footer.jsp" />