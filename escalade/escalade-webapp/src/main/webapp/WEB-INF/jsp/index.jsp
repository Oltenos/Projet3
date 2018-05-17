<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/jsp/_include/head.jsp"%>
	</head>
	
	<body class="container">
		<%@ include file="/WEB-INF/jsp/_include/header.jsp"%>
		
		<img class="gdeImage" src="img/PhotoAccueil.jpg" alt= "Accueil" />

		<div class="jumbotron marge">
			<h2><s:text name="index.titre" /></h2>
			
			<p>
				<s:text name="index.para.l1" /><br/>
				<s:text name="index.para.l2" /><br/>
				<s:text name="index.para.l3" /><br/>
				<s:text name="index.para.l4" /><br/>
				<s:text name="index.para.l5" /><br/><br/>
				<s:text name="index.para.l6" />
			</p>
		</div>

		
		<!-- jQuery -->
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<!-- Javascript de Bootstrap -->
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
			integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
			crossorigin="anonymous">
		</script>
		
		<%@ include file="/WEB-INF/jsp/_include/footer.jsp"%>
	</body>
	

</html>
