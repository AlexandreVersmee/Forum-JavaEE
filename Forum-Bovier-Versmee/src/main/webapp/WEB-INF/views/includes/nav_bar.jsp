<%@ taglib prefix="body" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="control" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="row">
  <div class="large-12 columns">
    <div class="nav-bar right">
     <ul class="button-group">
		<li><a href="#" class="button"><i class="fa fa-home"></i> Accueil</a></li>
		<li><a href="#" class="button"><i class="fa fa-list"></i> Listes des sujets</a></li>
		<control:if test="${userSession != NULL }">
			<li><a href="#" class="button"><i class="fa fa-user"></i> Profil</a></li>
		</control:if>
		<control:if test="${userSession != NULL }">
				<li><a href="#" class="button"><i class="fa fa-sign-out"></i> Deconnexion</a></li>
		</control:if>
		<control:if test="${userSession == NULL }">
				<li><a href="#" class="button"><i class="fa fa-sign-in"></i> Connexion</a></li>
		</control:if>
      </ul>
    </div>
    <h1>HalloweenBlog</h1>
    <hr/>
  </div>
</div>
