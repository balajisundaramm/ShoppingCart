<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<div class="row" id="header">
	<div class="col-sm-offset-2">
		<button class="btn btn-info" onclick="location.href='adminHome.ado';">e-Cart</button>
		<div class="w3-dropdown-hover">
			<button class="btn btn-info">Categories</button>
			<div class="w3-dropdown-content w3-bar-block w3-border">
				<jstl:forEach items="${category}" var="category">
					<a href="category.ado?categoryName=${category.categoryName}">${category.categoryName}</a>
					<br />
				</jstl:forEach>
				<a href="#addCategory" data-toggle="modal"
					data-target="#addCategory">Add New</a>
			</div>
		</div>
		<button class="btn btn-info"
			onclick="location.href='listOfUsers.ado';">Users</button>
		<button class="btn btn-info"
		onclick="location.href='logout.ado';">Logout</button>
	</div>
</div>
<!-- add category modal  -->
<div class="modal fade" id="addCategory" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add Category</h4>
			</div>
			<form id="addCategory" class="modalview" action="addCategoryInt.jsp"
				method="post">
				<div class="modal-body">
					<div class="col-sm-3">
						<lable>Catagory Name : <span>*</span></lable>
					</div>
					<div class="col-sm-9" id="email-error-dialog">
						<input type="text" id="" name="categoryName"
							class="addInputs" placeholder="Enter admin" required
							data-validation="required alphanumeric"
  							data-validation-error-msg-required="You must enter a user name"
  							data-validation-error-msg-alphanumeric="User name may only contain alphanumeric characters"/><br />
						<br />
					</div>
					<div class="col-sm-3">
						<lable>Description:<span>*</span> </lable>
					</div>
					<div class="col-sm-9">
						<textarea rows="5" id="text" onclick='value=""' cols="255" maxlength="50"
							placeholder="Description" name="categoryDescription" required="required">
							</textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" id="" class="btn btn-info">Add
						Category</button>
					<button type="reset" id="clear" class="btn btn-danger">Clear</button>
				</div>
			</form>
		</div>
	</div>
</div>