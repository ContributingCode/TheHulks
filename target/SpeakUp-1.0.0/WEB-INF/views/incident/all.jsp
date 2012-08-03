<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Speakup</title>

</head>
<body>

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
					<c:forEach items="${incidents}" var="incidents">
						<li><p>${incidents}</p></li>
					</c:forEach>
				</ul>

			</div>
		</div>
</body>
</html>
