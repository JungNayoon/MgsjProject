<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Endpoint list</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>path</th>
				<th>methods</th>
				<th>consumes</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${map}" var="obj">
				<tr>
					<td>${obj}</td>
					<td>${obj.key.patternsCondition}</td>
					<td>${obj.value}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
