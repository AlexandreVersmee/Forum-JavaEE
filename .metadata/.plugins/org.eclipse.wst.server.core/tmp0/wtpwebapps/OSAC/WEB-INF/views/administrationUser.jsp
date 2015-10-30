<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>

<body:base_layout>
    <div class="row">
        <div class="large-12 columns">
            <h1 class="main-title"><span>Paramètre d'aministration</span></h1>

            <div class="row">
                <div class="large-12 columns">
                    <h3 class="second-title">
                        <i class="fa fa-group fa-2x fa-padding"></i>
                        <span>Utilisateurs</span></h3>
                </div>
            </div>
            <!--
                ###############################
                #                             #
                #         Search Bar          #
                #                             #
                ###############################
            -->
            <form:form method="POST" modelAttribute="findUser" action="/OSAC/administration/utilisateurs/searchUser">
                <div class="row">
                    <div class="large-7 large-centered columns">
                        <div class="row collapse">
                            <div class="small-9 columns">
                                <spring:message code="seek.user.ph" var="phSeekUser"/>
                                <form:input path="research" type="text" placeholder="${phSeekUser}"/>
                                <form:errors path="research" cssClass="error"/>
                            </div>
                            <div class="small-3 columns btn-search-div">
                                <button title="<spring:message code="seek.user" />" data-tooltip aria-haspopup="true">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>

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

                    <%-- Add User button --%>
                    <div class="large-5 columns">
                        <a href="#" data-reveal-id="Add">
                            <button class="btn-add-ticket">
                                <i class="fa fa-plus-square-o fa-2x fa-padding"></i>
                                <spring:message code="add.user"/>
                            </button>
                        </a>
                    </div>

                    <%-- Display deleted  --%>
                    <form:form method="POST" modelAttribute="updatePreference" action="/OSAC/administration/utilisateurs/updatePreference">
                    <div class="large-4 columns">
                        <label><spring:message code="display.deleted"/>
                            <form:checkbox  path="displayDeleted"/>
                        </label>
                    </div>

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
            <!--
                ###############################
                #                             #
                #        User table           #
                #                             #
                ###############################
            -->
            <table class="ticket-table">
                <thead>
                <tr>
                    <th>N°</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Email</th>
                    <th>Supprimé</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${userListFromDB}">
                    <tr>
                        <td><a href="#"><c:out value="${user.id}"/></a></td>
                        <td><c:out value="${user.name}"/></td>
                        <td><c:out value="${user.firstName}"/></td>
                        <td><c:out value="${user.email}"/></td>
                        <td><c:out value="${(empty user.deletedDate) ? 'Actif' : user.deletedDate}"/></td>
                        <td>
                            <a href="/OSAC/administration/utilisateurs/${user.id}/update#openUpdate">Modifier</a> /
                            <a href="/OSAC/administration/utilisateurs/${user.id}/delete#openDelete">Supprimer</a>
                        </td>
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
                <h2 id="modalTitle" class="text-center"><spring:message code="add.user"/></h2>

                <br>
                <!-- Research on LDAP -->
                <form:form method="POST" modelAttribute="seekOnLdap" action="/OSAC/administration/utilisateurs/seekLdap">
                    <div class="row">
                        <div class="large-12 columns">
                                <%-- Call to webservice LDAP  --%>
                            <div class="large-offset-2 large-8 columns no-padding">
                                <div class="row collapse">
                                    <label><spring:message code="ldap"/></label>

                                    <div class="large-10 columns">
                                        <spring:message code="seek.user.ldap.ph" var="phSearchLdap"/>
                                        <form:input path="inputResearch" type="text" placeholder="${phSearchLdap}"/>
                                        <form:errors path="inputResearch" cssClass="error"></form:errors>
                                    </div>
                                    <div class="large-2 columns">
                                        <button type="submit" class="button postfix" data-tooltip aria-haspopup="true"
                                                title="<spring:message code='seek.user.ldap'/>" name="seekOnLdap">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>

                <br>

                <!-- Form add new user -->
                <form:form method="POST" modelAttribute="user" action="/OSAC/administration/utilisateurs/add">
                    <div class="row">
                            <%-- User CUID --%>
                        <div class="large-3 columns">
                            <spring:message code="cuid.ph" var="phCuid"/>
                            <label><spring:message code="cuid.lbl"/>
                                <form:input path="cuid" type="text" readonly="true" placeholder="${phCuid}"/>
                                <form:errors path="cuid" cssClass="error" />
                            </label>
                        </div>
                    </div>

                    <div class="row">
                            <%-- User Surname --%>
                        <div class="large-6 columns">
                            <spring:message code='user.surname.ph' var="phSurname"/>
                            <label><spring:message code="user.surname.lbl"/>
                                <form:input path="name" type="text" readonly="true" placeholder="${phSurname}"/>
                            </label>
                        </div>
                            <%-- FirstName --%>
                        <div class="large-6 columns">
                            <spring:message code="user.firstname.ph" var="phfirstname"/>
                            <label><spring:message code="user.firstname.lbl"/>
                                <form:input path="firstName" type="text" readonly="true" placeholder="${phfirstname}"/>
                            </label>
                        </div>
                    </div>

                    <div class="row">
                        <%-- Email --%>
                        <div class="large-6 columns">
                            <spring:message code="user.email.ph" var="phEmail"/>
                            <label><spring:message code="user.email.lbl"/>
                                <form:input path="email" type="text" readonly="true" placeholder="${phEmail}"/>
                            </label>
                        </div>
                        <%-- Type d'utilisateur --%>
                        <div class="large-4 columns end">
                            <spring:message code="user.type.ph" var="userTypePick"/>
                            <label><spring:message code="user.type.lbl" />
                                <form:select path="idUserType">
                                    <form:option value="-1" label="${userTypePick}"/>
                                    <form:options items="${userTypeList}" itemValue="id" itemLabel="name"/>
                                </form:select>
                            </label>
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <%-- Default Application --%>
                        <div class="large-4 columns end">
                            <spring:message code="applicationDef.pick" var="applicationDefPick"/>
                            <label>Application par défaut
                                <form:select path="idApplication">
                                    <form:option value="-1" label="${applicationDefPick}"/>
                                    <form:options items="${applicationList}" itemValue="id" itemLabel="name"/>
                                </form:select>
                            </label>
                        </div>
                        <%-- PassWord --%>
                        <div class="large-6 columns">
                            <spring:message code="user.password.ph" var="phPassword"/>
                            <label><spring:message code="user.password.lbl"/>
                                <form:input path="password" type="password" placeholder="${phPassword}"/>
                                <form:errors path="password" cssClass="error" />
                            </label>
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="large-offset-3 large-3 columns" data-tooltip aria-haspopup="true" title="Enregistrer ce nouvel utilisateur">
                            <input id="btn-submit-add-user" type="submit" class="button" value="<spring:message code="register"/>"
                                    name="userAdd"/>
                        </div>
                        <div class="large-offset-1 large-3 columns end" data-tooltip aria-haspopup="true"
                                title="<spring:message code="back.title"/>">
                            <a class="close-reveal-modal button btn-form" aria-label="Close"><spring:message code="back"/></a>
                        </div>
                    </div>
                </form:form>
                <a class="close-reveal-modal" aria-label="Close">&#215;</a>
            </div>


                <%-- UPDATE --%>
            <div id="Update" class="reveal-modal" data-reveal aria-labelledby="modalTitle" aria-hidden="true" role="dialog">
                <h2 id="modalTitle" class="text-center"><spring:message code="update.user"/></h2>

                <%-- refresh value form LDAP --%>
                <div class="row">
                    <div class="large-3 columns right">
                        <form:form method="POST" action="/OSAC/administration/utilisateurs/${userToUpdate.id}/updateLDAP">
                            <label>
                                <button type="submit" class="button" data-tooltip aria-haspopup="true"
                                        title="<spring:message code='user.refresh.ldap'/>">
                                    <i class="fa fa-retweet"></i>
                                </button>
                            </label>
                        </form:form>
                    </div>
                </div>

                <form:form method="POST" modelAttribute="userToUpdate" action="/OSAC/administration/utilisateurs/${userToUpdate.id}/update">
                    <div class="row">
                            <%-- User CUID --%>
                        <div class="large-3 columns">
                            <spring:message code="cuid.ph" var="phCuid"/>
                            <label><spring:message code="cuid.lbl"/>
                                <form:input path="cuid" type="text" placeholder="${phCuid}"/>
                                <form:errors path="cuid" cssClass="error"></form:errors>
                            </label>
                        </div>
                    </div>

                    <div class="row">
                            <%-- User Surname --%>
                        <div class="large-6 columns">
                            <spring:message code='user.surname.ph' var="phSurname"/>
                            <label><spring:message code="user.surname.lbl"/>
                                <form:input path="name" type="text" placeholder="${phSurname}"/>
                            </label>
                        </div>
                            <%-- FirstName --%>
                        <div class="large-6 columns">
                            <spring:message code="user.firstname.ph" var="phfirstname"/>
                            <label><spring:message code="user.firstname.lbl"/>
                                <form:input path="firstName" type="text" placeholder="${phfirstname}"/>
                            </label>
                        </div>
                    </div>

                    <%-- Email --%>
                    <div class="row">
                        <div class="large-6 columns">
                            <spring:message code="user.email.ph" var="phEmail"/>
                            <label><spring:message code="user.email.lbl"/>
                                <form:input path="email" type="text" placeholder="${phEmail}"/>
                            </label>
                        </div>
                            <%-- Type d'utilisateur --%>
                        <div class="large-4 columns end">
                            <label>Type d'utilisateur
                                <form:select path="idUserType">
                                    <form:option value="-1" label="Choisissez un type d'utilisateur"/>
                                    <form:options items="${userTypeList}" itemValue="id" itemLabel="name"/>
                                </form:select>
                            </label>
                        </div>
                    </div>

                    <br>

                    <div class="row">
                            <%-- Default Application --%>
                        <div class="large-4 columns end">
                            <label>Application par défaut
                                <form:select path="idApplication">
                                    <form:option value="-1" label="Choisissez une application par défaut"/>
                                    <form:options items="${applicationList}" itemValue="id" itemLabel="name"/>
                                </form:select>
                            </label>
                        </div>
                            <%-- PassWord --%>
                        <div class="large-6 columns">
                            <spring:message code="user.password.ph" var="phPassword"/>
                            <label><spring:message code="user.password.lbl"/>
                                <form:input path="password" type="password" placeholder="${phPassword}"/>
                                <form:errors path="password" cssClass="error"></form:errors>
                            </label>
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="large-offset-3 large-3 columns" data-tooltip aria-haspopup="true" title="Enregistrer ce nouvel utilisateur">
                            <input id="btn-submit-update-user" type="submit" class="button" value="<spring:message code="update"/>" name="userAdd"/>
                        </div>
                        <div class="large-offset-1 large-3 columns end" data-tooltip aria-haspopup="true"
                                title="<spring:message code="back.title"/>">
                            <a class="close-reveal-modal button btn-form" aria-label="Close"><spring:message code="back"/></a>
                        </div>
                    </div>
                </form:form>

                <a class="close-reveal-modal" aria-label="Close">&#215;</a>
            </div>

                <%-- Delete --%>
            <div id="Delete" class="reveal-modal" data-reveal aria-labelledby="modalTitle" aria-hidden="true" role="dialog">
                <h2 id="modalTitle" class="text-center"><spring:message code="delete.user"/></h2>

                <form:form method="POST" modelAttribute="userToDelete" action="/OSAC/administration/utilisateurs/${userToUpdate.id}/delete">
                    <form:hidden path="id"/>
                    <div class="row">
                            <%-- User CUID --%>
                        <div class="large-3 columns">
                            <spring:message code="cuid.ph" var="phCuid"/>
                            <label><spring:message code="cuid.lbl"/>
                                <form:input path="cuid" type="text" readonly="true" placeholder="${phCuid}"/>
                                <form:errors path="cuid" cssClass="error"></form:errors>
                            </label>
                        </div>
                    </div>

                    <div class="row">
                            <%-- User Surname --%>
                        <div class="large-6 columns">
                            <spring:message code='user.surname.ph' var="phSurname"/>
                            <label><spring:message code="user.surname.lbl"/>
                                <form:input path="name" type="text" readonly="true" placeholder="${phSurname}"/>
                            </label>
                        </div>
                            <%-- FirstName --%>
                        <div class="large-6 columns">
                            <spring:message code="user.firstname.ph" var="phfirstname"/>
                            <label><spring:message code="user.firstname.lbl"/>
                                <form:input path="firstName" type="text" readonly="true" placeholder="${phfirstname}"/>
                            </label>
                        </div>
                    </div>

                    <%-- Email --%>
                    <div class="row">
                        <div class="large-6 columns">
                            <spring:message code="user.email.ph" var="phEmail"/>
                            <label><spring:message code="user.email.lbl"/>
                                <form:input path="email" type="text" readonly="true" placeholder="${phEmail}"/>
                            </label>
                        </div>
                    </div>

                    <br>

                    <div class="row">
                            <%-- Default Application --%>
                        <div class="large-4 columns end">
                            <label>Application par défaut
                                <form:input path="idApplication" type="text" readonly="true" placeholder="${phEmail}"/>
                            </label>
                        </div>
                    </div>

                    <form:hidden path="password" />
                    <br>

                    <div class="row">
                        <div class="large-offset-3 large-3 columns" data-tooltip aria-haspopup="true" title="Enregistrer ce nouvel utilisateur">
                            <input id="btn-submit-add-user" type="submit" class="button" value="<spring:message code="delete"/>" name="userAdd"/>
                        </div>
                        <div class="large-offset-1 large-3 columns end" data-tooltip aria-haspopup="true"
                                title="<spring:message code="back.title"/>">
                            <a class="close-reveal-modal button btn-form" aria-label="Close"><spring:message code="back"/></a>
                        </div>
                    </div>
                </form:form>

                <a class="close-reveal-modal" aria-label="Close">&#215;</a>
            </div>

        </div>
    </div>
</body:base_layout>