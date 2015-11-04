<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<body:base_layout>
		<div class="large-12 columns">
			<div class="large-8 large-centered columns">
			<h2 class="text-center orange">Profil</h2>
			<form:form method="POST" modelAttribute="modifMembre" action="/Forum-Bovier-Versmee/profil/add">		
				<div class="row">
				  <div class="large-4 columns">
				    <label>Name
				      <form:input path="name" type="text" placeholder="nom"/>
					  <form:errors path="name" cssClass="error"></form:errors>
				    </label>
				  </div>
				</div>
				<div class="row">
				  <div class="large-4 columns">
				    <label>Mail
				      <form:input path="email" type="text" placeholder="mail"/>
					  <form:errors path="email" cssClass="error"></form:errors>
				    </label>
				  </div>
				</div>
				<div class="row">
				  <div class="large-4 columns">
				    <label>Password
				      <form:input path="password" type="password" placeholder="password"/>
					  <form:errors path="password" cssClass="error"></form:errors>
				    </label>
				  </div>
				</div>
				<div class="row">
				  <div class="large-4 columns">
				    <label>IP
				      <form:input path="ip" type="text" placeholder="adresse ip"/>
					  <form:errors path="ip" cssClass="error"></form:errors>
				    </label>
				  </div>
				</div>
					<div class="row">
						<div class="large-5 large-centered columns">
							<button class="white text-center" type="submit">
								<i class="fa fa-sign-in fa-padding"></i> Modifier
							</button>
							<br/>								
						</div>
					</div>
					<form:hidden path="pseudo"/>
			</form:form>
			<form:form method="POST" modelAttribute="supprMembre" action="/Forum-Bovier-Versmee/profil/suppr">
				<div class="row">
					<div class="large-5 large-centered columns">
						<button class="white text-center" type="submit">
							<i class="fa fa-sign-in fa-padding"></i> Supprimer
						</button>
						<br/>								
					</div>
				</div>			
			</form:form>
			</div>
		</div>
</body:base_layout>