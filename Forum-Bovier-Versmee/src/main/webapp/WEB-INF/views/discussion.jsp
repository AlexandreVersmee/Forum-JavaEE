<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="control" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<body:base_layout>
<div class="row">
	<div class="large-12 columns">
		<h2>Titre de la discution</h2>
		<div class="row">
			<div class="large-10 columns main-answer">
				Premier message
			</div>
			<div class="large-2  columns">
					<ul class="button-group right">
						<li><a href="#" class="fa-padding" title="Commenter"><i class="fa fa-wechat"></i> </a></li>
						<li><a href="#" class="fa-padding" title="Modifier"><i class="fa fa-edit"></i> </a></li>
						<li><a href="#" class="fa-padding" title="Supprimer"><i class="fa fa-trash"></i> </a></li>
					</ul>
				</div>
		</div>
		<div class="row">
			<div class="large-12 columns answer child-answer">
				<div class="row">
					<div class="large-10 columns">
						Reponse du message
					</div>
					<div class="large-2  columns">
						<ul class="button-group right">
							<li><a href="#Comment" class="fa-padding add-comment" title="Commenter"><i class="fa fa-wechat"></i> </a></li>
							<li><a href="/Forum-Bover-Versmee/edit" class="fa-padding" title="Modifier"><i class="fa fa-edit"></i> </a></li>
							<li><a href="#" class="fa-padding" title="Supprimer"><i class="fa fa-trash"></i> </a></li>
						</ul>
					</div>
				</div>
				<div class="row comment-row">
					<div class="large-12 columns">
						<div class="row">
							<div class="large-12 columns">
								<label>Votre message
							 		 <textarea placeholder="small-12.columns"></textarea>
								</label>
							</div>
						</div>
						<div class="row">
							<div class="large-12 columns">
								<button class="small right">Valider</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">	
			<div class="large-10 columns">
				Main message
			</div>
			<div class="large-2  columns">
					<ul class="button-group right">
						<li><a href="#" class="fa-padding" title="Commenter"><i class="fa fa-wechat"></i> </a></li>
						<li><a href="#" class="fa-padding" title="Modifier"><i class="fa fa-edit"></i> </a></li>
						<li><a href="#" class="fa-padding" title="Supprimer"><i class="fa fa-trash"></i> </a></li>
					</ul>
				</div>
		</div>
	</div>
</div>
<br/><br/>
<div class="row">
	<div class="large-12 columns">
		<div class="row">
			<div class="large-12 columns">
				<label>Votre message
			 		 <textarea placeholder="small-12.columns"></textarea>
				</label>
			</div>
		</div>
		<div class="row">
			<div class="large-12 columns">
				<button class="right">Valider</button>
			</div>
		</div>
	</div>
</div>
</body:base_layout>