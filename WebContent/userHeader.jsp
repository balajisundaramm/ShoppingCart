<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<div class="row  col-sm-12" id="header">
	<div class="col-sm-offset-1">
		<div class="col-xs-3">
			<button class="btn btn-info" onclick="location.href='home.udo';">e-Cart</button>
			<div class="w3-dropdown-hover">
				<button class="btn btn-info">Categories</button>
				<div class="w3-dropdown-content w3-bar-block w3-border">
					<jstl:forEach items="${category}" var="category">
						<a href="category.udo?categoryName=${category.categoryName}">${category.categoryName}</a>
						<br />
					</jstl:forEach>
				</div>
			</div>
			<div class="col-xs-8"></div>
		</div>
		<div class="col-sm-offset-1"></div>
	</div>
	<div class="col-sm-offset-3">
		<button class="btn btn-info"
			onclick="location.href='listOfProducts.udo';">Products</button>
	</div>
	<div class="col-sm-offset-5">

		<h4>Welcome,</h4>
	</div>
	<div class="col-sm-offset-7">


		<button class="btn btn-info" onclick="location.href='logout.ado';">View
			Cart</button>
	</div>
	<div class="col-sm-offset-8">

		<button class="btn btn-info" onclick="location.href='logout.ado';">Logout</button>
	</div>
</div>
