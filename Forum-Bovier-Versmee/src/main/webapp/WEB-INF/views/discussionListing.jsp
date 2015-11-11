<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="control" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<body:base_layout>
	<!-- 
	###############################
	#                             #
	#    Ajout d'une discussion   #
	#                             #
	###############################
	 -->
	<div class="row">
		<div class="large-12 text-center columns">
		<!-- /${idSujetParent} -->
			<form:form method="POST" modelAttribute="addFilDiscussion" action="/Forum-Bovier-Versmee/sujet/add/${idSujetParent}" >
			<div class="row">
			  <div class="large-6 large-centered columns">
			    <div class="row collapse">
			      <div class="small-11 columns">
					<spring:message code="discussion.ph" var="discussionPh"/>
					<form:input path="title" type="text" placeholder="${discussionPh}"/>
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
	#    Liste des discussions    #
	#                             #
	###############################
	 -->
	<h3 class="text-center"><span class="underline text-bold">Liste des discussions</span></h3>
	<c:forEach var="item" items="${listeFilDiscussion}" varStatus="loop">
		<jsp:useBean id="loop" type="javax.servlet.jsp.jstl.core.LoopTagStatus" />
		<c:if test="${loop.first}">
			<div class="row" data-equalizer>
		</c:if>
				<div class="large-3 end columns panel bgOrangeSoft" data-equalizer-watch>
					<p class="text-center"><a href="/Forum-Bovier-Versmee/discussion/${item.id}"><c:out value="${item.title}"/></a></p>
					<c:choose>
						<c:when test="${item.membre.deleted != NULL}">
							<i><i class="fa fa-remove"></i> - Utilisateur supprimé</i>
						</c:when>
						<c:otherwise>
							<i><i class="fa fa-user"></i> - <c:out value="${item.membre.pseudo}"/></i>
						</c:otherwise>
					</c:choose>
				</div>	
		<c:choose>
			<c:when test="${loop.last}">
				</div>
			</c:when>
			<c:when test="${loop.getCount()%4==0}">
				</div>
				<div class="row" data-equalizer>
			</c:when>
		</c:choose>			
	</c:forEach>
	<!-- Cas s'il n'y a aucun enregistrement en base -->
       <c:if test="${empty listeFilDiscussion}">
       <div class="row">
           <div class="large-12 columns text-center grey">
               <i><spring:message code="no.discussion.lbl" /></i>
           </div>
       </div>
       </c:if>
</body:base_layout>