<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<div class="container">
	<div>
		<h4>Welcome, ${user}</h4>
	</div>
	<div class="row">
		<div class="col-xs-4">
			<button class="btn btn-info" onclick="
			location.href='home.udo';">
				e-Cart</button>
			<div class="w3-dropdown-hover">
				<button class="btn btn-info">Categories</button>
				<div class="w3-dropdown-content w3-bar-block w3-border">
					<jstl:forEach items="${category}" var="category">
						<a href="category.udo?categoryName=${category.categoryName}">${category.categoryName}</a>
						<br />
					</jstl:forEach>
				</div>
			</div>
			<button class="btn btn-info"
				onclick="location.href='listOfProducts.udo';">Products</button>
		</div>
		<div class="col-xs-6 text-right">

			<button class="btn btn-info" onclick="location.href='showCart.udo';">View
				Cart</button>
			<button class="btn btn-info" onclick="location.href='logout.ado';">Logout</button>
		</div>

	</div>
</div>
