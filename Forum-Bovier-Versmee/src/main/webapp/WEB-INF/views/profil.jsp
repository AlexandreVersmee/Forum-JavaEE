<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<body:base_layout>
	<form>
		<div class="large-12 columns">
			<div class="large-8 large-centered columns">
			<h2 class="text-center orange">Profil</h2>
				<div class="row">
				  <div class="large-12 columns">
				    <label>Input Label
				      <input type="text" placeholder="large-12.columns" />
				    </label>
				  </div>
				</div>
				<div class="row">
				  <div class="large-4 columns">
				    <label>Input Label
				      <input type="text" placeholder="large-4.columns" />
				    </label>
				  </div>
				  <div class="large-4 columns">
				    <label>Input Label
				      <input type="text" placeholder="large-4.columns" />
				    </label>
				  </div>
				  <div class="large-4 columns">
				    <div class="row collapse">
				      <label>Input Label</label>
				      <div class="small-9 columns">
				        <input type="text" placeholder="small-9.columns" />
				      </div>
				      <div class="small-3 columns">
				        <span class="postfix">.com</span>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</form>
</body:base_layout>