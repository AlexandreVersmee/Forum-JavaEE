<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<body:base_layout>
<div class="row">
		<div class="large-12 columns">
			<div class="row">
				<div class="large-offset-1 large-6  columns login-div">
					<h3 class="text-center orange">Connexion a HalloweenBlog</h3>
					<form:form method="POST" modelAttribute="membre" action="/Forum-Bovier-Versmee/connexion">
					<div class="row">
						<div class="large-8 columns">
							<div class="row collapse">
						 		<label><spring:message code="identifiant.lbl"/></label>
								<div class="small-9 columns">
							 	<form:input path="pseudo" type="text" placeholder="pseudo"/> 
									<form:errors path="pseudo" cssClass="error"></form:errors>
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
								<label><spring:message code="password.lbl"/></label>
								<div class="small-9 columns">
							 	<form:input path="password" type="password" placeholder="password"/>
									<form:errors path="password" cssClass="error"></form:errors>
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
				</form:form>					
				</div>
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