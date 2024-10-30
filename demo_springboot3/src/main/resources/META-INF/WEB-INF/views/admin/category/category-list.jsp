<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<a href="<c:url value="/admin/categories/add"/>">Add Category</a>
<br>

<hr>
<table border="I" width="100%">
	<tr>
		<th>STT</th>
		<th>Images</th>
		<th>CategoryName</th>
		<th>Status</th>
		<th>Action</th>
	</tr>
	<c:forEach items="${list}" var="cate" varStatus="STT">
		<tr>
			<td>${STT.index+1 }</td>
			<td>${cate.images }</td>
			<%-- <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
			<td><img height="150" width="200" src="${imgUrl}" /></td>--%>
			<td>${cate.name }</td>
			<td>${cate.status}</td>
			<td><a
				href="<c:url value='/admin/categories/edit/${cate.id}'/>"
				class="center">Sửa</a> | <a
				href="<c:url value='/admin/categories/delete/${cate.id}'/>"
				class="center">Xóa</a></td>
		</tr>
	</c:forEach>
</table>