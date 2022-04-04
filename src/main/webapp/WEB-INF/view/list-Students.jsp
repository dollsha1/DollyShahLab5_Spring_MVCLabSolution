<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1 class="bg-info text-white" style="text-align: center">Student
			Management System</h1>
		<hr />
		<h2>
			<a href="/StudentManagement/students/showFormForAdd"
				class="btn btn-primary btn-sm float-end">Add Student</a>
		</h2>
		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>Name</th>
					<th>Department</th>
					<th>Country</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Students}" var="student">
					<tr>
						<td><c:out value="${student.name}" /></td>
						<td><c:out value="${student.department}" /></td>
						<td><c:out value="${student.country}" /></td>
						<td><a
							href="/StudentManagement/students/showFormForUpdate?studentId=${student.id}"
							class="btn btn-info btn-sm"> Update </a> <a
							href="/StudentManagement/students/delete?studentId=${student.id}"
							class="btn btn-danger btn-sm"
							onclick="if (!(confirm('Are you sure you want to delete this Student? ${student.name}'))) return false">
								Delete </a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>