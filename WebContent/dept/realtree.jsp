<%@page import="erp.dto.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<link rel="stylesheet" href="/kimsaemERP/common/css/jquery.treeview.css" />
<!-- <link rel="stylesheet" href="/kimsaemERP/common/css/screen.css" /> -->
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script> -->
<script src="/kimsaemERP/common/js/jquery.treeview.js"
	type="text/javascript"></script>
<script src="/kimsaemERP/common/js/query.cookie.js"></script>
<script type="text/javascript" src="/kimsaemERP/common/js/demo.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".folder").on("click", function() {
			deptname = $(this).text().trim();
			//this�� �������� ����
			ulnode = $(this).next();
			//ul����� id�Ӽ� ���� ���ϱ�
			deptno = $(ulnode).attr("id");
			//alert(deptno);
			$.get("/kimsaemERP/ajaxtreedata", {"deptno":deptno},getData,"json");
		});
		//�������� ������ ���(ajax�������� �߰��� �±�)�� �̺�Ʈ�� �����ϴ� ���		
		//1���Ű����� - �̺�Ʈ����, 2���Ű����� - � �±׿� �̺�Ʈ�� ������ �� ���� ����
		//3���Ű����� - �̺�Ʈ�� �߻��� �� ������ �Լ�
		$(document).on("click",".file",function(){
			alert("test");
		})
	})
	//jquery�� �̿��ϸ� json�� �Ľ̵Ǿ� ��ü���·� ���ϵȴ�.
	function getData(data){
		//alert(data.emplist[0].name);
		myli = "";
		for(i in data.emplist){
			myli = myli + "<li><span class='file' id='"+ data.emplist[i].id +"'>"
					+ data.emplist[i].name +"</span></li>";
		}
		$(ulnode).html(myli);
	}
</script>
</head>
<body>
<% 
	ArrayList<DeptDTO> deptList = (ArrayList<DeptDTO>)request.getAttribute("deptList");
	int size = deptList.size();
%>
	<h1>KimsaemJavaNara ������ - ��������ǥ��(jquery)</h1>
	<div id="result"></div>
	<ul id="browser" class="filetree" >
		<%for(int i=0; i<size; i++){ 
			DeptDTO dept = deptList.get(i);%>
			<li class="closed">
				<span class="folder">
				<%=dept.getDeptname() %></span>
				<ul id="<%=dept.getDeptno()%>">
					<!-- <li><span class="file">�嵿��</span></li> -->
				</ul>
			</li>
		<%} %>
	</ul>
</body>
</html>