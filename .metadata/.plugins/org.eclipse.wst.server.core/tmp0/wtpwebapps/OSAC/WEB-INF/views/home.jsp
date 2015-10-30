<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<body:base_layout>
	<!--
		###############################
		#                             #
		#       Welcome sentence      #
		#                             #
		###############################
	-->

	<div class="row">
		<div class="large-12 columns">
			<h5 class="orange">Bonjour ${userSession.firstName} ${userSession.name}</h5>
		</div>
	</div>

	<!--
		###############################
		#                             #
		#         Search Bar          #
		#                             #
		###############################
	-->
	<div class="row">
		<div class="large-7 large-centered columns">
			<div class="row collapse">
				<div class="small-9 columns">
					<input type="text" placeholder="<spring:message code="seek.ticket"/>" />
				</div>
				<div class="small-3 columns btn-search-div" >
					<button data-tooltip aria-haspopup="true" title="<spring:message code="search.btn" />" >
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div>
	</div>

	<br/><br/>
	<!--
		########################################################################
		#                                                                      #
		#   add ticket / date start and date end / number of ticket by page    #
		#                                                                      #
		########################################################################
	-->
	<div class="row">
		<div class="large-12 columns">

			<%-- Add ticket button --%>
			<div class="large-3 columns">
				<a href="#" data-reveal-id="Add">
					<button class="btn-add-ticket">
						<i class="fa fa-plus-square-o fa-2x fa-padding"></i>
						<spring:message code="add.ticket"/>
					</button>
				</a>
			</div>

			<%-- Start date  --%>
			<div class="large-3 columns">
				<label><spring:message code="dateStart.lbl"/></label>
				<div class="row collapse postfix-radius">
					<div class="small-9 columns">
						<input type="datetime" id="datepickerStartSeek" placeholder="<spring:message code="dateStart.ph"/>">
					</div>
					<div class="small-3 columns">
						<span class="postfix"><i class="fa fa-calendar"></i></span>
					</div>
				</div>
			</div>

			<%-- End date --%>
			<div class="large-3 columns">
				<label><spring:message code="dateEnd.lbl"/></label>
				<div class="row collapse postfix-radius">
					<div class="small-9 columns">
						<input type="datetime" id="datepickerEndSeek" placeholder="<spring:message code="dateEnd.ph"/>">
					</div>
					<div class="small-3 columns">
						<span class="postfix"><i class="fa fa-calendar"></i></span>
					</div>
				</div>
			</div>

			<%-- Display deleted  --%>
			<form:form method="POST" modelAttribute="updatePreference" action="/OSAC/home/updatePreference">
				<form:hidden path="displayDeleted"/>

				<div class="large-3 columns">
					<div class="large-9 columns no-padding">
						<label><spring:message code="rowByPage.lbl"/></label>
						<form:select path="rowByPage">
							<form:option value="5" label="5"/>
							<form:option value="10" label="10"/>
							<form:option value="15" label="15"/>
							<form:option value="25" label="25"/>
							<form:option value="50" label="50"/>
							<form:option value="75" label="75"/>
							<form:option value="100" label="100"/>
						</form:select>
					</div>
					<div class="large-3 columns">
						<br/>
						<button type="submit" class="button postfix" data-tooltip aria-haspopup="true"
								title="<spring:message code='rowByPage.btn'/>" >
							<i class="fa fa-floppy-o"></i>
						</button>
					</div>
				</div>
			</form:form>

		</div>
	</div>

	<br/><br/>

	<%--
	###############################
	#                             #
	#        Ticket table         #
	#                             #
	###############################
	--%>
	<table class="ticket-table">
		<thead>
		<tr>
			<th>N°</th>
			<th>Application</th>
			<th>Origine</th>
			<th>Type</th>
			<th>Date affectation</th>
			<th>Date clôture</th>
			<th>Etat</th>
			<th>Action</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="ticket" items="${ticketListFromDB}">
			<tr>
				<td><a href="#"><c:out value="${ticket.id}"/></a></td>
				<td><c:out value="${ticket.application.name}"/></td>
				<td><c:out value="${ticket.origine.name}"/></td>
				<td><c:out value="${ticket.ticketType.name}"/></td>
				<td><c:out value="${ticket.dateCreate}"/></td>
				<td><c:out value="${ticket.dateClose}"/></td>
				<td><c:out value="${(empty ticket.deletedDate) ? 'Ouvert' : user.deletedDate}"/></td>
				<td>...</td>
					<%--<td>
                        <a href="/OSAC/administration-utilisateurs/${user.id}/update#openUpdate" id="userUpdateBtn">Modifier</a> /
                        <a href="/OSAC/administration-utilisateurs/${user.id}/delete#openDelete" id="userDeleteBtn">Supprimer</a>
                    </td>--%>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<!--
	#################
	#               #
	#  Pagination   #
	#               #
	#################
	-->
	<%@include file="includes/pagination.jsp" %>

	<!--
	###############################
	#                             #
	#           Modals            #
	#                             #
	###############################
	-->

	<%-- ADD --%>
	<div id="Add" class="reveal-modal" data-reveal aria-labelledby="modalTitle" aria-hidden="true" role="dialog">
		<h2 id="modalTitle" class="text-center"><spring:message code="add.ticket"/></h2>
		<br>
		<!-- Form add new ticket -->
		<form:form method="POST" modelAttribute="addTicket" action="home/add">
			<div class="row">
				<%-- Ticket Application --%>
				<div class="large-4 columns">
					<spring:message code="application.pick" var="applicationPick"/>
					<label><spring:message code="application.lbl"/>
						<form:select path="applicationId">
							<form:option value="-1" label="${applicationPick}"/>
							<form:options items="${applicationList}" itemValue="id" itemLabel="name"/>
						</form:select>
					</label>
				</div>
				<%-- Ticket origin --%>
				<div class="large-4 columns">
					<spring:message code="origin.pick" var="originPick"/>
					<label><spring:message code="origin.lbl"/>
						<form:select path="origineId">
							<form:option value="-1" label="${originPick}"/>
							<form:options items="${origineList}" itemValue="id" itemLabel="name"/>
						</form:select>
					</label>
				</div>
				<%-- Ticket date --%>
				<div class="large-4 columns end">
					<div class="row collapse postfix-radius">
						<spring:message code="dateStart.ph" var="dateStartPick"/>
						<label><spring:message code="dateStart.lbl"/></label>
						<div class="small-9 columns">
							<form:input path="dateCreate" id="datepickerStart" placeholder="${dateStartPick}" />
							<form:errors path="dateCreate" cssClass="error"/>
						</div>
						<div class="small-3 columns">
							<span class="postfix"><i class="fa fa-calendar"></i></span>
						</div>
					</div>
				</div>
			</div>

			<br>

			<div class="row">
				<%-- Type ticket --%>
				<div class="large-5 columns">
					<spring:message code="typeTicket.pick" var="typeTicketPick"/>
					<label><spring:message code="typeTicket.lbl"/>
						<form:select path="typeTicketId">
							<form:option value="-1" label="${typeTicketPick}"/>
							<form:options items="${typeTicketList}" itemValue="id" itemLabel="name"/>
						</form:select>
					</label>
				</div>
				<%-- Sous type ticket --%>
				<div class="large-5 columns end">
					<spring:message code="underTypeTicket.pick" var="underTypeTicketPick"/>
					<label><spring:message code="underTypeTicket.lbl"/>
						<form:select path="underTypeTicketId">
							<form:option value="-1" label="${underTypeTicketPick}"/>
							<form:options items="${underTypeTicketList}" itemValue="id" itemLabel="name"/>
						</form:select>
					</label>
				</div>
			</div>

			<br>

			<%-- Title --%>
			<div class="row">
				<div class="large-10 columns">
					<spring:message code="title.ticket.ph" var="titleTicketPick"/>
					<label><spring:message code="title.ticket.lbl"/>
						<form:input path="title" placeholder="${titleTicketPick}" />
						<form:errors path="title" cssClass="error"/>
					</label>
				</div>
			</div>

			<%-- Description --%>
			<div class="row">
				<div class="large-10 columns">
					<spring:message code="description.ticket.ph" var="descriptionPick"/>
					<label><spring:message code="description.ticket.lbl"/>
						<form:input path="description" placeholder="${descriptionPick}" />
						<form:errors path="description" cssClass="error"/>
					</label>
				</div>
			</div>

			<br>

			<%-- Attached Document --%>
			<div class="row">
				<div class="large-4 columns">
					<label><spring:message code="attachedDocument.lbl"/>
						<%--<form:input path="attachedDocument" />--%>
					</label>
				</div>
			</div>

			<br>

			<div class="row">
				<%-- Doing time --%>
				<div class="large-5 columns">
					<div class="row collapse postfix-radius">
						<spring:message code="timeDoing.ph" var="timeDoingPick"/>
						<label><spring:message code="timeDoing.lbl"/></label>
						<div class="small-9 columns">
							<form:input path="timeDoing" placeholder="${timeDoingPick}"/>
							<form:errors path="timeDoing" cssClass="error" />
						</div>
						<div class="small-3 columns">
							<span class="postfix"><i class="fa fa-clock-o"></i></span>
						</div>
					</div>
				</div>
				<%-- close date --%>
				<div class="large-5 columns end">
					<div class="row collapse postfix-radius">
						<spring:message code="dateClose.ph" var="dateClosePick"/>
						<label><spring:message code="dateClose.lbl"/></label>
						<div class="small-9 columns">
							<form:input path="dateClose" id="datepickerEnd" placeholder="${dateClosePick}"/>
							<form:errors path="dateClose" cssClass="error"/>
						</div>
						<div class="small-3 columns">
							<span class="postfix"><i class="fa fa-calendar"></i></span>
						</div>
					</div>
				</div>
			</div>

			<br>

			<div class="row">
				<div class="large-offset-3 large-3 columns" data-tooltip aria-haspopup="true" title="Enregistrer ce nouveau ticket">
					<input id="btn-submit-add-ticket" type="submit" class="button" value="<spring:message code="register"/>"/>
				</div>
				<div class="large-offset-1 large-3 columns end" data-tooltip aria-haspopup="true"
						title="<spring:message code="back.title"/>">
					<a class="close-reveal-modal button btn-form" aria-label="Close"><spring:message code="back"/></a>
				</div>
			</div>
		</form:form>
		<a class="close-reveal-modal" aria-label="Close">&#215;</a>
	</div>
</body:base_layout>


