<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page contentType="text/html;charset=UTF-8" %>

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
			      <div class="small-11 columns">
					<spring:message code="subject.ph" var="subjectPh"/>
					<form:input path="title" type="text" placeholder="${subjectPh}"/>
					<form:errors path="title" cssClass="error"/>
			      </div>
			      <div class="small-1 columns">
				      <button class="button postfix" data-tooltip aria-haspopup="true" title="<spring:message code="validate" />" >
						<i class="fa fa-plus"></i>
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
	<h3 class="text-center">Liste des sujets</h3>
	<div class="row">
		<div class="large-12 columns">
			<c:forEach var="item" items="${sujetListe}" varStatus="status">
				<div class="large-3 end columns panel">
					<p class="text-center"><a href="/Forum-Bovier-Versmee/sujet/${item.id}"><c:out value="${item.title}"/></a></p>
					<i><i class="fa fa-user"></i> - <c:out value="${item.membre.pseudo}"/></i>
					<!-- Si l'utilisateur est une administrateur -->
					<br/><i class="fa fa-trash" title="<spring:message code='subject.delete' />"></i>
				</div>				
			</c:forEach>
		</div>
	</div>
	<!-- Cas s'il n'y a aucun enregistrement en base -->
	<c:if test="${empty sujetListe}">
		<div class="row">
		    <div class="large-12 columns text-center grey">
		        <i><spring:message code="no.title.lbl" /></i>
		    </div>
		</div>
	</c:if>
</body:base_layout> 