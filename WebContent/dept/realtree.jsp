<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="erp.dto.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" 
		href="/kimsaemERP/common/css/jquery.treeview.css" />
	<!-- <link rel="stylesheet" 
			href="/kimsaemERP/common/css/screen.css" /> -->

	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script> -->
	<script src="/kimsaemERP/common/js/jquery.cookie.js"></script>
	<script src="/kimsaemERP/common/js/jquery.treeview.js"></script>

	<script type="text/javascript" 
		src="/kimsaemERP/common/js/demo.js"></script>
	<%
	 ArrayList<DeptDTO> deptnamelist =
	 	(ArrayList<DeptDTO>) request.getAttribute("deptnamelist");
	 int size  = deptnamelist.size();
	 System.out.println("jsp"+deptnamelist);
 %>
</head>
<body>
<h2>kimsaemJavaNara������ - ��������ǥ��</h2>
	<div  style="margin: 20px" class="col-sm-6">
		<ul id="browser" class="filetree">
			<%for(int i=0;i<size;i++){
				DeptDTO dept = deptnamelist.get(i);
			%>
				<li class="closed">
					<span class="folder" onclick="runAjax()">
						<%= dept.getDeptname() %></span>
					<ul>
	<!-- <li><span class="file">�嵿��</span></li> -->
					</ul>
				</li>
			<%} %>
		</ul>
	</div>
</body>
</html>