<jsp:include page="Header.jsp" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
* {
	box-sizing: border-box;
}

.column {
	float: left;
	width: 33.33%;
	padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
	content: "";
	clear: both;
	display: table;
}

#img1, #img2 {
	width: 300px;
	height: 400px;
	transition: 300ms;
}

#img1:hover {
	-ms-transform: scale(0.5); /* IE 9 */
	-webkit-transform: scale(0.5); /* Safari 3-8 */
	transform: scale(2);
	margin-left: 100%;
	margin-top: 100%;
}

#img2:hover {
	-ms-transform: scale(0.5); /* IE 9 */
	-webkit-transform: scale(0.5); /* Safari 3-8 */
	transform: scale(2);
	margin-left: 30%;
	margin-top: 100%;
}
</style>
</head>
<body>
	<div class="col-md-2 col-sm-2 highlight">
		<div id="myContainer" style="width: 100%;"></div>
	</div>
	<div class="col-md-8 col-sm-6 highlight">
		<div id="myContainer" style="width: 100%;">
			<ul class="nav-justified">
				<li>
					<div class="row">
						<div class="column">
							<div class="card-block">
								<h4 class="card-title">For Experienced</h4>
							</div>
							<a href="experiencedTemplate"><img class="card-img-top"
								src="images/resume22.jpg" alt="Experienced" id="img1" style="cursor: pointer"></a>
						</div>
					</div>
				</li>

				<li><div class="column">
						<div class="card-block">
							<h4 class="card-title">For Freshers</h4>
						</div>
						<a href="fresherTemplate"><img class="card-img-top"
							src="images/resume33.jpg" alt="Fresher" id="img2" style="cursor: pointer"></a>
					</div></li>
			</ul>
		</div>
	</div>
<br/>
<br/>

	<jsp:include page="footer.jsp" />