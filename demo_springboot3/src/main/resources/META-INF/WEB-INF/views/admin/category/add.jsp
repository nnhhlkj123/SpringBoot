<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title th:text="${category.isEdit} ? 'Edit Category' : 'Add Category'">Category
	Management</title>
</head>
<body>

	<h2 th:text="${category.isEdit} ? 'Edit Category' : 'Add Category'"></h2>

	<form th:action="@{/admin/categories/save}" method="post"
		enctype="multipart/form-data">
		<input type="hidden" th:value="${category.isEdit}" name="isEdit">
		<input type="hidden" th:value="${category.id}" name="id"> <label
			for="categoryname">Category name:</label><br> <input type="text"
			id="categoryname" name="name" th:value="${category.name}"><br>

		<label for="images">Link images:</label><br> <input type="text"
			id="images" name="images" th:value="${category.images}"><br>

		<!-- Uncomment if you want to add image file upload feature later
    <label for="images1">Upload images:</label><br>
    <input type="file" id="images1" name="images1"><br>
    -->

		<label for="status">Status</label><br> <input type="radio"
			id="ston" name="status" value="1"
			th:checked="${category.status == 1}"> <label for="ston">Hoạt
			động</label><br> <input type="radio" id="stoff" name="status" value="0"
			th:checked="${category.status == 0}"> <label for="stoff">Khóa</label><br>

		<br>

		<button type="submit"
			th:text="${category.isEdit} ? 'Update' : 'Insert'"></button>

	</form>

</body>
</html>
