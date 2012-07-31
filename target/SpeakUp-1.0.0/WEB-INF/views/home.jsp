<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Speak UP</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.1/jquery.mobile-1.1.1.min.css" />
	<link rel="stylesheet" href="http://jquerymobile.com/test/docs/_assets/css/jqm-docs.css">
	
	
    <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.1.1/jquery.mobile-1.1.1.min.js"></script> 
	<!--  <script src="http://jquerymobile.com/test/docs/_assets/js/jqm-docs.js"></script> -->
	
	<script src="static/js/gears_init.js"></script>
	<script src="http://better-geolocation-api.googlecode.com/files/geolocation.js"></script>
	<script src="static/js/jquery.geolocation.js"></script>
	<script>
		$(function() {

			function showMyPosition(position) {
				$('.result:eq(0)').html(
						"Your position is: " + position.coords.latitude + ", "
								+ position.coords.longitude + " (Timestamp: "
								+ position.timestamp + ")<br />"
								+ $('.result:eq(0)').html());
			}

			function watchMyPosition(position) {
				$('.result:eq(1)').html(
						"Your position is: " + position.coords.latitude + ", "
								+ position.coords.longitude + " (Timestamp: "
								+ position.timestamp + ")<br />"
								+ $('.result:eq(1)').html());
			}

			function noLocation(error) {
				$('#geo')
						.text(
								"No location info available. Error code: "
										+ error.code);
			}

			$('#getPositionButton').bind('click', function() {
				$.geolocation.get({
					win : showMyPosition,
					fail : noLocation
				});
			});

			$('#watchPositionButton').bind('click', function() {
				if (typeof myPosition != 'undefined') {
					alert('Already watching, mate!');
				} else {
					myPosition = $.geolocation.watch({
						win : watchMyPosition
					});
				}
			});

			$('#stopButton')
					.bind(
							'click',
							function() {
								if (typeof myPosition != 'undefined') {
									alert('Stopping to watch position (watch id '
											+ myPosition + ')');
									$.geolocation.stop(myPosition);
									delete (myPosition);
								} else {
									alert('Nothing to stop at this point. Click the "watch" button first.');
								}
							});

		});
		
	</script>
</head>
<body>


		<div data-role="header" class="ui-header ui-bar-b" role="banner">
		<h1 class="ui-title" role="heading" aria-level="5">Speak UP</h1>
	   </div>
	
	<div style="text-align:center"> 
	<p>
	<img src="static/images/logoGray.png" ></a></p>
	</div>
	
<div>
		<a href="incident/form" data-role="button" data-theme="b" >Share Now!</a> 
	</div>	
		
		<div data-role="footer" class="ui-footer ui-bar-b" role="contentinfo">
		<h4 class="ui-title" role="heading" aria-level="1">
			<a href="index.html" data-role="button" data-theme="b" data-icon="arrow-r" data-inline="true" data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" class="ui-btn ui-shadow ui-btn-corner-all ui-btn-inline ui-btn-icon-right ui-btn-up-b"><span class="ui-btn-inner ui-btn-corner-all"><span class="ui-btn-text">About Us</span>
			<span class="ui-icon ui-icon-arrow-r ui-icon-shadow">&nbsp;</span>
			</span></a>
			</h4>
	</div>
	
	<!-- /page -->


	<!-- <div id="page">
		<div id="header">
			<div id="name-and-company">
				<div id='site-name'>
					<a href="" title="Hello Spring MongoDB ${environmentName}"
						rel="home">Hello Spring MongoDB ${environmentName}</a>
				</div>
				<div id='company-name'>
					<a href="http://www.springsource.com" title="SpringSource">SpringSource
						Home</a>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="content" class="no-side-nav">
			
		

				<p>Demonstration of using the 'cloud' namespace to create Spring
					beans backed by a MongoDB service bound to an application.</p>

				<p>
					Every time you reload the page, another Person object is created
					and stored in MongoDB. The database is then queried and each person
					added to the list you see below. To reset the list, click <a
						href="deleteAll">Delete All</a>
				</p>



				<h2>The following people have been stored in the database:</h2>
				<ul>
					<c:forEach items="${people}" var="people">
						<li><p>${people}</p></li>
					</c:forEach>
				</ul>

				<h2>The following services have been bound to this application:</h2>
				<ul>
					<c:forEach items="${services}" var="service">
						<li><p>${service}</p></li>
					</c:forEach>
				</ul>

				<h2>The following services properties available to the
					application are available:</h2>
				<ul>
					<c:forEach items="${serviceProperties}" var="serviceProperties">
						<li><p>${serviceProperties}</p></li>
					</c:forEach>
				</ul>


			</div>
		</div>
	</div> -->
</body>
</html>