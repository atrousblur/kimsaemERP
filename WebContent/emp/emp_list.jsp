<%@page import="erp.dto.loginDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<%
	String str = "test";
%>
<%
ArrayList<loginDTO> user = (ArrayList<loginDTO>) request.getAttribute("emplist"); 
loginDTO emplist= new loginDTO();
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
				<tr>
					<th>�μ���ȣ</th>
					<th>�μ���</th>
					<th>�����</th>
					<th>����</th>
					<th>��ȭ��ȣ</th>
					<th>����</th>
				</tr>
			</thead>
			<tbody>
				<%for(int i=0;i<user.size();i++){ 
					emplist=user.get(i);
				%>	
				<tr>
					<td><%=emplist.getId() %></td>
					<td><%=emplist.getPass() %></td>
					<td><a href="#"><%=emplist.getJob_category() %></a></td>
					<td><%=emplist.getDetailaddr() %></td>
					<td><a href="#"><%=emplist.getProfile_photo() %></a></td>
					<td><a href="#">����</a></td>
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
