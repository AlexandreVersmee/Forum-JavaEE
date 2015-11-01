<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<body:base_layout>
	<!-- 
	###############################
	#                             #
	#    Ajout d'un sujet         #
	#                             #
	###############################
	 -->
	<div class="row">
		<div class="large-12 text-center columns">
			<form:form method="POST" modelAttribute="addSubject" action="/Forum-Bovier-Versmee/sujets/add">
			<div class="row">
			  <div class="large-6 large-centered columns">
			    <div class="row collapse">
			      <div class="small-10 columns">
					<spring:message code="title.ph" var="titlePh"/>
					<form:input path="title" type="text" placeholder="${titlePh}"/>
					<form:errors path="title" cssClass="error"/>
			      </div>
			      <div class="small-2 columns">
				      <button class="button postfix" data-tooltip aria-haspopup="true" title="<spring:message code="validate" />" >
						<i class="fa fa-plus fa-2x"></i>
					</button>
			      </div>
			    </div>
			  </div>
			</div>
			</form:form>
		</div>
	</div><br/><br/>
	<!-- 
	###############################
	#                             #
	#    Liste des sujets         #
	#                             #
	###############################
	 -->
	<div class="row">
		<div class="large-12 text-center columns">
			<div class="large-4 columns">Sujet 1</div>
			<div class="large-4 columns">Sujet 2</div>
			<div class="large-4 columns">Sujet 3</div>
		</div>
	</div>
</body:base_layout>