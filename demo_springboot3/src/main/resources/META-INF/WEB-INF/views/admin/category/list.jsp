<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Category Management</title>
</head>
<body>

	<a th:href="@{/admin/categories/add}">Add Category</a>
	<br>
	<!-- Hiển thông báo -->

	<div th:if="${message != null}">
		<i th:text="${message}"></i>
	</div>

	<!-- Hết thông báo -->

	<form th:action="@{/admin/categories/searchpaginated}" method="get">
		<input type="text" name="name" id="name"
			placeholder="Nhập từ khóa để tìm" />
		<button type="submit">Search</button>
	</form>

	<div th:if="${!categoryPage.hasContent()}">No Category</div>

	<div th:if="${categoryPage.hasContent()}">
		<table>
			<thead>
				<tr>
					<th>STT</th>
					<th>Images</th>
					<th>Category name</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<tr th:each="cate, stat : ${categoryPage.content}">
					<td th:text="${stat.index + 1}"></td>
					<td th:text="${cate.images}"></td>
					<td th:text="${cate.name}"></td>
					<td th:text="${cate.status}"></td>
					<td><a th:href="@{/admin/categories/edit/{id}(id=${cate.id})}">Sửa</a>
						<a th:href="@{/admin/categories/delete/{id}(id=${cate.id})}">Xóa</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<form th:action="">
		Page size: <select name="size" id="size"
			th:attr="onchange='this.form.submit()'">
			<option th:each="size : ${#numbers.sequence(3, 20, 5)}"
				th:value="${size}" th:selected="${size == categoryPage.size}">
				<span th:text="${size}">3</span>
			</option>
		</select>
	</form>

	<div th:if="${categoryPage.totalPages > 0}">
		<ul>
			<li th:each="pageNumber : ${pageNumbers}"
				th:class="${pageNumber == categoryPage.number + 1} ? 'page-item active' : 'page-item'">
				<a
				th:href="@{/admin/categories/searchpaginated(name=${name}, size=${categoryPage.size}, page=${pageNumber})}">
					<span th:text="${pageNumber}"></span>
			</a>
			</li>
		</ul>
	</div>

</body>
</html>
