<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<body:base_layout>
<div class="row">
	<div class="large-12 columns">
		<table>
			<thead>
			<tr>
				<th>Nom</th>
				<th>Pseudo</th>
				<th>Adresse email</th>
				<th>Ip</th>
				<th class="text-center">Action</th>
			</tr>
			</thead>
            	<tbody>
                	<c:forEach var="item" items="${membreList}" varStatus="status">
                    	<jsp:useBean id="status" type="javax.servlet.jsp.jstl.core.LoopTagStatus"/>
                    	<c:choose>
                    		<c:when test="<%=status.getCount()%2==0%>">
                            	<tr>
                                	<td><c:out value="${item.name}"/></td>
                                	<td><c:out value="${item.pseudo}"/></td>
                                	<td><c:out value="${item.email}"/></td>
                                	<td><c:out value="${item.ip}"/></td>
                                	<td>
                                    	<a href="/Forum-Bovier-Versmee/administration-inscriptions/${item.id}">Valider</a>
                                	</td>
                            	</tr>
                        	</c:when>
                        	<c:otherwise>
                            	<tr>
                                	<td><c:out value="${item.name}"/></td>
                                	<td><c:out value="${item.pseudo}"/></td>
                                	<td><c:out value="${item.email}"/></td>
                                	<td><c:out value="${item.ip}"/></td>
                                	<td>
                                    	<a href="/Forum-Bovier-Versmee/administration-inscriptions/${item.id}">Valider</a>
                                	</td>
                            	</tr>
                        	</c:otherwise>
                    	</c:choose>
                	</c:forEach>
                </tbody>
            </table>
            <c:if test="${empty membreList}">
            <div class="row">
                <div class="large-12 columns text-center grey">
                    <i>Pas d'utilisateurs</i>
                </div>
            </div>
            </c:if>
            	</div>
</div>
</body:base_layout>