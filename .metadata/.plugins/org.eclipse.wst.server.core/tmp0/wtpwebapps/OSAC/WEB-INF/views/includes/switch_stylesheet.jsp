<c:choose>
    <c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/'}">
    	<link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/stylesheets/home.css">
    </c:when>
    <c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/administration'}">
	    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/stylesheets/administration.css">
    </c:when>
    <c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/statistique'}">
    	<%-- <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/stylesheets/statistique.css"> --%>
    </c:when>
    <c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/parametre'}">
	    <%-- <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/stylesheets/parametre.css"> --%>
    </c:when>
    <c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/administration-parametre'}">
        <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/stylesheets/administration.css">
        <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/stylesheets/administration-parametre.css">
    </c:when>
    <c:when test="${requestScope['javax.servlet.forward.servlet_path'] == '/administration/utilisateurs'}">
        <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/stylesheets/administration.css">
        <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/stylesheets/administration-user.css">
    </c:when>
</c:choose>


