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

	 <table>
	     <thead>
	     <tr>
	         <th>Titre</th>
	         <th>Createur</th>
	         <th width="150">Action</th>
	     </tr>
	     </thead>
	     <tbody>
	     <c:forEach var="item" items="${sujetListe}" varStatus="status">
	         <jsp:useBean id="status" type="javax.servlet.jsp.jstl.core.LoopTagStatus"/>
	         <c:choose>
	             <c:when test="<%=status.getCount()%2==0%>">
	                 <tr>
	                     <td><c:out value="${item.title}"/></td>
	                     <td><c:out value="${item.membre.pseudo}"/></td>
	                     <td>
	                         <%-- <a href="/OSAC/administration/origines/${item.id}/update#openUpdate">Modifier</a> /
	                         <a href="/OSAC/administration/origines/${item.id}/delete#openDelete">Supprimer</a> --%>
	                     </td>
	                 </tr>
	             </c:when>
	             <c:otherwise>
	                 <tr class="bgOrangeSoft">
	                     <td><c:out value="${item.title}"/></td>
	                     <td><c:out value="${item.membre.pseudo}"/></td>
	                     <td>
	                        <%--  <a href="/OSAC/administration/origines/${item.id}/update#openUpdate">Modifier</a> /
	                         <a href="/OSAC/administration/origines/${item.id}/delete#openDelete">Supprimer</a> --%>
	                     </td>
	                 </tr>
	             </c:otherwise>
	         </c:choose>
	     </c:forEach>
	     </tbody>
       </table>
       <cc:if test="${empty sujetListe}">
       <div class="row">
           <div class="large-12 columns text-center grey">
               <i><spring:message code="no.value.find" /></i>
           </div>
       </div>
       </cc:if>
</body:base_layout>