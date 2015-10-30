
<%@taglib prefix="body" tagdir="/WEB-INF/tags" %>

<body:base_layout>
		<h1 class="main-title"><span>Administration</span></h1>

	${test.getLdap()}

	<div class="row">
		<div class="large-12 columns">
			<div class="large-offset-1 large-2 text-center columns">
				<a href="#"><i class="fa fa-ticket fa-5x "></i></a>
			</div>
			<div class="large-2 text-center columns">
				<a href="#"><i class="fa fa-buysellads fa-5x "></i></a>
			</div>
			<div class="large-2 text-center columns">
				<a href="#"><i class="fa fa-bullseye fa-5x "></i></a>
			</div>
			<div class="large-2 text-center columns">
				<a href="administration/utilisateurs"><i class="fa fa-group fa-5x "></i></a>
			</div>
			<div class="large-2 text-center columns end">
				<a href="administration-parametre"><i class="fa fa-wrench fa-5x "></i></a>
			</div>
		</div>
	</div>
</body:base_layout>
