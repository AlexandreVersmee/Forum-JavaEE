
<%-- <c:out value="${pageContext.request.requestURL}"/><br/>
<c:out value="${requestScope['javax.servlet.forward.servlet_path']}"/><br/> 
<c:out value="${pageContext.request.servletPath}"/><br/>
<c:out value="${pageContext.request.contextPath}"/><br/>
<c:out value="${pageContext.request.requestURI}"/>
 --%>
<c:choose>
    <c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/'}">
        <script src="resources/javascripts/vendor/jquery.js" type="text/javascript"></script>
    </c:when>
    <c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/administration'}">
        <script src="resources/javascripts/vendor/jquery.js" type="text/javascript"></script>
    </c:when>
    <c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/statistique'}">
        <script src="resources/javascripts/vendor/jquery.js" type="text/javascript"></script>
    </c:when>
    <c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/parametre'}">
        <script src="resources/javascripts/vendor/jquery.js" type="text/javascript"></script>
    </c:when>
    <c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/administration-parametre'}">
        <script src="resources/javascripts/vendor/jquery.js" type="text/javascript"></script>>
        <script src="resources/javascripts/vendor/jquery.js" type="text/javascript"></script>
    </c:when>
        <c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/administration-utilisateurs'}">
            <script src="resources/javascripts/vendor/jquery.js" type="text/javascript"></script>
        <link rel="stylesheet" media="screen" href="resources/javascripts/administration-user.css">
    </c:when>
</c:choose>
