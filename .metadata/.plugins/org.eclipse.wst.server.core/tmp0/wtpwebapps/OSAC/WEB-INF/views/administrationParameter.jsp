<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<body:base_layout>
    <div class="row">
        <div class="large-12 columns">
            <h1 class="main-title"><span>Paramètre d'aministration</span></h1>

            <div class="row">
                <div class="large-12 columns">
                    <h3 class="second-title"><i class="fa fa-wrench fa-2x fa-padding"></i><span>Paramètres</span></h3>

                    <div class="row">
                        <div class="large-12 columns">
                            <ul class="tabs" data-tab>
                                <li class="tab-title active"><a href="#webservice">Web Service</a></li>
                                <li class="tab-title"><a href="#log">Log</a></li>
                                <li class="tab-title"><a href="#otherParam">Autres Paramètres</a></li>
                            </ul>
                            <div class="tabs-content">
                                    <%-- Web Service --%>
                                <div class="content active" id="webservice">
                                   <form:form method="POST" action="administration-parametre" commandName="ConfigProperties">
                                        <div class="row">
                                            <div class="large-offset-1 large-10 columns end">
                                                <div class="row collapse">
                                                    <form:label path="ldap">Url du LDAP</form:label>
                                                    <div class="large-8 columns">
                                                        <form:input path="ldap" placeholder="Saisir l'url du LDAP"/>
                                                    </div>
                                                    <div class="large-2 columns end">
                                                        <span class="postfix"><i class="fa fa-link"></i></span>
                                                    </div>
                                                </div>
                                                <div class="row collapse">
                                                    <label>Url du web service d'OrangeCarto</label>

                                                    <div class="large-8 columns">
                                                        <input type="text"  value="<c:out value="${configFile.ldap}"/>" placeholder="Saisir l'url du web service d'OrangeCarto"/>
                                                    </div>
                                                    <div class="large-2 columns end">
                                                        <span class="postfix"><i class="fa fa-link"></i></span>
                                                    </div>
                                                </div>
                                                <div class="large-2 large-centered columns no-padding">
                                              
                                                    <input type="submit" class="button" />
                                                </div>
                                            </div>
                                        </div>
                                    </form:form> 
                                </div>

                                    <%-- Log --%>
                                <div class="content" id="log">
                                    <div class="row">
                                        <div class="large-offset-1 large-10 columns end">
                                            <p>This is the second panel of the basic tab example. This is the second panel of the
                                                basic tab example.</p>
                                        </div>
                                    </div>

                                </div>
                                    <%-- Other Parameters --%>
                                <div class="content" id="otherParam">
                                    <div class="row">
                                        <div class="large-offset-1 large-10 columns end">
                                            <p>This is the third panel of the basic tab example. This is the third panel of the
                                                basic tab example.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>


                </div>
            </div>

        </div>
    </div>
</body:base_layout>
