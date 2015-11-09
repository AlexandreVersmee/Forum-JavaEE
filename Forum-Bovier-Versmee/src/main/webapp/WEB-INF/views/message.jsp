<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="control" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<body:base_layout>
<div class="row">
	<div class="large-12 columns">
		<h3 class="orange"><c:out value="${discussion.title}"/></h3>
		<br/>
		<c:forEach var="item" items="${messageListe}">		
		<c:choose>			
			<c:when test="${item.id != item.parentId}">
				<div class="row">
					<div class="large-12 columns answer child-answer">
						<div class="row">
							<div class="large-10 columns">
								<c:out value="${item.texte}"/>
							</div>
							<div class="large-2  columns">
								<ul class="button-group right">
									<control:if test="${membreSession != NULL && membreSession.id == item.membre.id}">
										<li><a id ="${item.id}" class="add-comment fa-padding" title="Ajout un message"><i class="fa fa-wechat"></i></a></li>
									</control:if>
									<control:if test="${membreSession.pouvoir > 1}">
										 <li><a href="/Forum-Bovier-Versmee/discussion/${discussion.id}/message/${item.id}" title="Modifier" class="edit-comment fa-padding"><i class="fa fa-edit"></i></a></li>
										<li><a href="#" data-reveal-id="myDeleteModal${item.id}"><i class="fa fa-trash"></i></a>	</li>
									</control:if>
								</ul>
							</div>
						</div>
					</div>					
					<div id="comment-row${item.id}" class="row comment-row">
						<div class="large-12 columns">
							<spring:message code="enter.message.ph" var="messagePh"/>
							<form:form method="POST" modelAttribute="answerMessage" action="/Forum-Bovier-Versmee/discussion/${discussion.id}/answer/${item.parentId}" >
								<div class="row">
									<div class="large-12 columns">
										<form:textarea path="texte" type="text" placeholder="${messagePh}"/>
		 		 						<form:errors path="texte" cssClass="error"/>
									</div>
								</div>
								<div class="row">
									<div class="large-12 columns">
										<button class="hideComment${item.id} small">Masquer</button>
										<button class="small right" type="submit"><spring:message code="validate" /></button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
					<div id="edit-row${item.id}" class="row  comment-row">
						<div class="large-12 columns">
							<spring:message code="enter.message.ph" var="messagePh"/>
							<form:form method="POST" modelAttribute="editMessage" action="/Forum-Bovier-Versmee/discussion/${discussion.id}/edit/${item.id}" >
								<div class="row">
									<div class="large-12 columns">
										<form:textarea path="texte" type="text" placeholder="${messagePh}"/>
		 		 						<form:errors path="texte" cssClass="error"/>
									</div>
								</div>
								<div class="row">
									<div class="large-12 columns">
										<button class="hideEdit${item.id} small">Masquer</button>
										<button class="small right" type="submit"><spring:message code="validate" /></button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<div class="large-10 columns main-answer">
						<c:out value="${item.texte}"/>
					</div>
					<div class="large-2 columns">
						<ul class="button-group right">
							<control:if test="${membreSession != NULL && membreSession.id == item.membre.id}">
								<li><a id ="${item.id}" class="add-comment fa-padding"><i class="fa fa-wechat"></i></a></li>
							</control:if>
							<control:if test="${membreSession.pouvoir > 1}">
								<li><a href="/Forum-Bovier-Versmee/discussion/${discussion.id}/message/${item.id}" title="Modifier" class="edit-comment fa-padding"><i class="fa fa-edit"></i></a></li>
								<li><a href="#" class="fa-padding" title="Supprimer"><i class="fa fa-trash"></i> </a></li>
							</control:if>
						</ul>
					</div>
					<div id="comment-row${item.id}" class="row comment-row">
						<div class="large-12 columns">
							<spring:message code="enter.message.ph" var="messagePh"/>
							<form:form method="POST" modelAttribute="answerMessage" action="/Forum-Bovier-Versmee/discussion/${discussion.id}/answer/${item.parentId}" >
								<div class="row">
									<div class="large-12 columns">
										<form:textarea path="texte" type="text" placeholder="${messagePh}"/>
		 		 						<form:errors path="texte" cssClass="error"/>
									</div>
								</div>
								<div class="row">
									<div class="large-12 columns">
										<button class="hideComment${item.id} small">Masquer</button>
										<button class="small right" type="submit"><spring:message code="validate" /></button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
					<div id="edit-row${item.id}" class="row  comment-row">
						<div class="large-12 columns">
							<spring:message code="enter.message.ph" var="messagePh"/>
							<form:form method="POST" modelAttribute="editMessage" action="/Forum-Bovier-Versmee/discussion/${discussion.id}/edit/${item.id}" >
								<div class="row">
									<div class="large-12 columns">
										<form:textarea path="texte" type="text" placeholder="${messagePh}"/>
		 		 						<form:errors path="texte" cssClass="error"/>
									</div>
								</div>
								<div class="row">
									<div class="large-12 columns">
										<button class="hideEdit${item.id} small">Masquer</button>
										<button class="small right" type="submit"><spring:message code="validate" /></button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<!-- MODAL USE FOR DELETE -->
		<div id="myDeleteModal${item.id}" class="reveal-modal" data-reveal aria-labelledby="modalTitle" aria-hidden="true" role="dialog">
			<h2 id="modalTitle" class="text-center">Suppression du message <span class="orange">${item.id}</span></h2><br/>
			<p class="lead text-center">Vous allez supprimer de manière definitive ce message êtes-vous sur ?</p>
			
			<div class="row">
				<div class="large-4 large-centered columns">
					<div class="large-3 columns">
						<form:form method="POST" modelAttribute="answerMessage" action="/Forum-Bovier-Versmee/discussion/${discussion.id}/delete/${item.id}" >
						<button type="submit" title="Supprimer">Oui</button>
						</form:form>
					</div>
					<div class="large-3 columns">
						<a class="close-reveal-modal button white reset-btn-modal" aria-label="Close">Non</a>
					</div>
				</div>
			</div>			
			<a class="close-reveal-modal" aria-label="Close">&#215;</a>
		</div>
		</c:forEach>
	</div>
</div>

<!-- Submit a new message in discussion -->
<br/>
<div class="row">
	<div class="large-12 columns">
		<hr>
	</div>
</div> 
<form:form method="POST" modelAttribute="addMessage" action="/Forum-Bovier-Versmee/discussion/add/${discussion.id}" >
<div class="row">
	<div class="large-12 columns">
		<div class="row">
			<div class="large-12 columns">
				<spring:message code="enter.message.ph" var="messagePh"/>
				<label><spring:message code="enter.message.lbl"/>
					 <form:input path="texte" type="text" placeholder="${messagePh}"/>
			 		 <form:errors path="texte" cssClass="error"/>
				</label>
			</div>
		</div>
		<div class="row">
			<div class="large-12 columns">
				<button class="right" type="submit">Valider</button>
			</div>
		</div>
	</div>
</div>
</form:form>
</body:base_layout>