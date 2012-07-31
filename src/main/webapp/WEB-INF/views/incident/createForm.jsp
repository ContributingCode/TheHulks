<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Create Incident</title>
<!--[if lt IE 8]>
		<link rel="stylesheet" href="<c:url value="/resources/blueprint/ie.css" />" type="text/css" media="screen, projection">
	<![endif]-->

<meta name="viewport" content="width=device-width, initial-scale=1">


</head>
<body>
	<div data-role="header" class="ui-header ui-bar-b" role="banner">
		<h1 class="ui-title" role="heading" aria-level="5">Report Incident</h1>
	</div>
	
	<div class="container">
		<div class="span-12 last">
			<form:form modelAttribute="incident" action="/incident/done" method="post">
				<fieldset>
					<!-- <p>
					<form:label	for="id" path="id" cssErrorClass="error">Type id</form:label><br/>
					<form:input path="id" /> <form:errors path="id" />			
				</p> -->
					<p style="display:none;">
						<form:label for="cause" path="cause" cssErrorClass="error">cause number</form:label>
						<br />
						<form:input path="cause" />
						<form:errors path="cause" />
					</p>
				

				</fieldset>
			</form:form>
			
			
			<form:form modelAttribute="incident" action="/incident/done" method="post">
				<fieldset>
			
					<div data-role="fieldcontain">
					    <fieldset data-role="controlgroup">
					    	<legend>Incident:</legend>
								<c:forEach items="${cause}" var="cause">
									<form:radiobutton path="cause" name="cause" id="cause-${cause.id}" value="${cause.id}"/>
					         		<form:label path="cause" for="cause-${cause.id}">${cause.title}</form:label>
								</c:forEach>
					    </fieldset>
					</div>
		
					<p style="display:none">
						<form:label for="latitude" path="latitude" cssErrorClass="error">Latitude</form:label>
						<br />
						<form:input path="latitude" id="latitude" />
						<form:errors path="latitude" />
					</p>
					<p style="display:none">
						<form:label for="longitude" path="longitude" cssErrorClass="error">Longitude</form:label>
						<br />
						<form:input path="longitude" id="longitude" />
						<form:errors path="longitude" />
					</p>
					<p>
						<form:label for="description" path="description" cssErrorClass="error">Description</form:label>
						<form:textarea for="description" path="description"
							cssErrorClass="error" cols="40" rows="8"></form:textarea>
						<br />
						<form:errors path="description" />
					</p>
							
						<!-- <p data-role="fieldcontain"
							class="ui-field-contain ui-body ui-br ui-li ui-li-static ui-btn-up-c">
							<textarea
								cols="40" rows="8" name="description" id="description"
								class="ui-input-text ui-body-c ui-corner-all ui-shadow-inset"></textarea>
						</p> -->
		
						<p> 
							<input type="submit" value="Submit" />
						</p>
				</fieldset>
			</form:form>
				
			<!-- 
			
			<ul data-role="listview" data-inset="true"
				class="ui-listview ui-listview-inset ui-corner-all ui-shadow">

				<li data-role="fieldcontain"
					class="ui-field-contain ui-body ui-br ui-li ui-li-static ui-btn-up-c"><fieldset
						data-role="controlgroup"
						class="ui-corner-all ui-controlgroup ui-controlgroup-vertical">
 
						<div class="ui-controlgroup-controls">

							<div class="ui-radio">
								<input type="radio" name="radio-choice-1" id="radio-choice-1"
									value="choice-1" checked="checked"> <label
									for="radio-choice-1" data-corners="true" data-shadow="false"
									data-wrapperels="span" data-icon="radio-off" data-theme="c"
									class="ui-btn ui-btn-up-c ui-btn-icon-left ui-radio-on ui-corner-top">
									<span class="ui-btn-inner ui-corner-top"> <span
										class="ui-btn-text">Injured Seal?</span> <span
										class="ui-icon ui-icon-shadow ui-icon-radio-on"></span>
								</span>
								</label>
							</div>


							<div class="ui-radio">
								<input type="radio" name="radio-choice-1" id="radio-choice-2"
									value="choice-2"> <label for="radio-choice-2"
									data-corners="true" data-shadow="false" data-wrapperels="span"
									data-icon="radio-off" data-theme="c"
									class="ui-btn ui-btn-up-c ui-btn-icon-left ui-radio-off">
									<span class="ui-btn-inner"> <span class="ui-btn-text">Homeless
											Person?</span> <span
										class="ui-icon ui-icon-radio-off ui-icon-shadow"></span>
								</span>
								</label>
							</div>


							<div class="ui-radio">
								<input type="radio" name="radio-choice-1" id="radio-choice-3"
									value="choice-3"><label for="radio-choice-3"
									data-corners="true" data-shadow="false" data-wrapperels="span"
									data-icon="radio-off" data-theme="c"
									class="ui-btn ui-btn-up-c ui-btn-icon-left ui-radio-off"><span
									class="ui-btn-inner"><span class="ui-btn-text">Or
											Just Drunk?</span><span
										class="ui-icon ui-icon-radio-off ui-icon-shadow"></span></span></label>
							</div>


							<div class="ui-radio">
								<input type="radio" name="radio-choice-1" id="radio-choice-4"
									value="choice-4"><label for="radio-choice-4"
									data-corners="true" data-shadow="false" data-wrapperels="span"
									data-icon="radio-off" data-theme="c"
									class="ui-btn ui-btn-up-c ui-btn-icon-left ui-radio-off ui-corner-bottom ui-controlgroup-last"><span
									class="ui-btn-inner ui-corner-bottom ui-controlgroup-last"><span
										class="ui-btn-text">Something Else...</span><span
										class="ui-icon ui-icon-radio-off ui-icon-shadow"></span></span></label>
							</div>
						</div>
					</fieldset></li>
					-->

				<!-- <select name="select-choice-0" id="select-choice-0">
					<option value="standard">Standard: 7 day</option>
					<option value="rush">Rush: 3 days</option>
					<option value="express">Express: next day</option>
					<option value="overnight">Overnight</option>
				</select> -->

				<!-- <li data-role="fieldcontain"
					class="ui-field-contain ui-body ui-br ui-li ui-li-static ui-btn-up-c"><textarea
						cols="40" rows="8" name="textarea" id="textarea"
						class="ui-input-text ui-body-c ui-corner-all ui-shadow-inset"></textarea>
				</li>

				<li class="ui-body ui-body-b ui-li ui-li-static ui-btn-up-c ui-corner-bottom ui-li-last">
					<fieldset class="ui-grid-a">

						<div class="ui-block-a">


							<button type="submit" data-theme="a" name="submit"
								value="submit-value" class="ui-btn-hidden" aria-disabled="false">Submit</button>
						</div>
					</fieldset>
				</li> -->

			</ul>






			<ul style="display:none;">
				<c:forEach items="${incidents}" var="incidents">
					<li><p>${incidents}</p></li>
				</c:forEach>
			</ul>

		</div>

	</div>
	<div data-role="footer" class="ui-footer ui-bar-b" role="contentinfo">
		<h4 class="ui-title" role="heading" aria-level="1">
			<a href="/" data-role="button" data-theme="b" data-icon="arrow-l" data-inline="true" data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" class="ui-btn ui-shadow ui-btn-corner-all ui-btn-inline ui-btn-icon-left ui-btn-up-a"><span class="ui-btn-inner ui-btn-corner-all"><span class="ui-btn-text">Home</span><span class="ui-icon ui-icon-arrow-l ui-icon-shadow">&nbsp;</span></span></a>
			<!-- <a href="index.html" data-role="button" data-theme="a" data-icon="arrow-r" data-inline="true" data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" class="ui-btn ui-shadow ui-btn-corner-all ui-btn-inline ui-btn-icon-right ui-btn-up-a"><span class="ui-btn-inner ui-btn-corner-all"><span class="ui-btn-text">Next?</span><span class="ui-icon ui-icon-arrow-r ui-icon-shadow">&nbsp;</span></span></a> -->
		</h4>
	</div><!-- /footer -->
		
			
	<script>
		function showMyPosition(position) {
			$('#latitude').val(position.coords.latitude);
			$('#longitude').val(position.coords.longitude);
		}
		function noLocation() {
			alert("No location detected.");
		}
		$.geolocation.get({
			win : showMyPosition,
			fail : noLocation
		});

		//alert("2nd");
	</script>

</body>
</html>