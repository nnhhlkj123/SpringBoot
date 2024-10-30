<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>

<h2>${category.isEdit ? 'Edit Category' : 'Add Category'}</h2>
<form action="<c:url value="/admin/categories/save"/>" method="post"
	enctype="multipart/form-data">
	<input type="hidden" value="${category.isEdit }" name="isEdit"> 
	<input type="hidden" value="${category.id }" name="id">
	<label for="fname">Category name:</label><br> 
	<input type="text" id="categoryname" name="name" value="${category.name }"><br> 
	<label for="lname">Link images:</label><br> 
	<input type="text" id="images" name="images" value="${category.images }"><br> 
	<%--<label for="lname">Upload
		images:</label><br> --%>
	<%--<input type="file" id="images1" name="images1"><br>--%>
	<label for="html">Status</label><br> 
	<input type="text" name ="status" value="${category.status }"><br>
	<input type="radio" id="ston"
		name="status" value="1"> <label for="css">Hoạt động</label><br>


	<input type="radio" id="stoff" name="status" value="0"> <label
		for="javascript">Khóa</label> <br> <br>
		
	<c:if test ="${category.isEdit }">
	<input type="submit" value="Update">
	</c:if>
	<c:if test ="${!category.isEdit }">
	<input type="submit" value="Insert">
	</c:if>

</form>