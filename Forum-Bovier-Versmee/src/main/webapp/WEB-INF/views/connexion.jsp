<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<body:base_layout>
<div class="row">
		<div class="large-12 columns">
			<div class="row">
				<div class="large-offset-1 large-6  columns login-div">
					<h3 class="text-center orange">Connexion a HalloweenBlog</h3>

					<%-- <form:form method="POST" modelAttribute="user" action="/OSAC/connexion"> --%>
					<div class="row">
						<div class="large-8 columns">
							<div class="row collapse">
								<%-- <spring:message code="cuid.ph" var="cuidPh"/> --%>
						 		<label><spring:message code="identifiant.lbl"/></label>
								<div class="small-9 columns">
								<%--  	<form:input path="cuid" type="text" placeholder="${cuidPh}" --%> 
									<%-- <form:errors path="cuid" cssClass="error"></form:errors> --%>
								 </div>
								<div class="small-3 columns">
									<span class="postfix"><i class="fa fa-user"></i></span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="large-8 large-centered columns">
							<div class="row collapse">
								<%-- <spring:message code="login.ph" var="passwordPh"/> --%>
								<label><spring:message code="password.lbl"/></label>
								<div class="small-9 columns">
								<%--  	<form:input path="password" type="password" placeholder="${passwordPh}" --%> 
									<%-- <form:errors path="password" cssClass="error"></form:errors> --%>
								</div>
								<div class="small-3 columns">
									<span class="postfix"><i class="fa fa-lock"></i></span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="large-5 large-centered columns">
							<button class="white text-center" type="submit">
								<i class="fa fa-sign-in fa-padding"></i> Se connecter
							</button>
							<br/>								
						</div>
					</div>
				</div>
				<%-- 	</form:form> --%>
				<div class="large-4 end text-center columns">
				<h3 class="orange">S'inscrire</h3>
					<br/>
					<a href="#">
						<i class="fa fa-edit fa-padding"></i> Je m'inscris
					</a>
				</div>
				
			</div>
		</div>
	</div>
</body:base_layout>