<%@page import="erp.dto.LoginDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<%
	String str = "test";
%>
<title>Bootstrap Example</title>
<meta charset="euc-kr">

</head>
<body>
	<div>
		<br />
		<br />
		<p>�λ���</p>
		<table class="table">
			<thead>
			<%
				ArrayList<LoginDTO> userlist = (ArrayList<LoginDTO>) request.getAttribute("userlist");
				System.out.println("��������Ʈ "+userlist);
			%>
				<tr>
					<th>���̵�</th>
					<th>����</th>
					<th>�μ���</th>
					<th>��å</th>
					<th>��������</th>
					<th>�系��ȣ</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a href="#">9415jang</a></td>
					<td>�嵿��</td>
					<td>�λ���</td>
					<td>�븮</td>
					<td><a href="#">��������</a></td>
					<td><a href="#">����ó</a></td>
				</tr>
			<%
				int size = userlist.size();
				for (int i = 0; i < size; i++) {
					LoginDTO user = userlist.get(i);
			%>
				<tr>
					<td><a href="#"><%=user.getId() %></a></td>
					<td><%=user.getName() %></td>
					<td><%=user.getDeptname() %></td>
					<td><%=user.getPosition() %></td>
					<td><a href="#">��������</a></td>
					<td><a href="#">����ó</a></td>
				</tr>
			<%} %>
			</tbody>
		</table>
		<ul class="pagination" style="">
			<li><a href="#" aria-label='Previous'>&laquo;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li class="disabled"><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#" aria-label='Next'>&raquo;</a></li>
		</ul>
	</div>

</body>
</html>
