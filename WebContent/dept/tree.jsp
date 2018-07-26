<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="erp.dto.DeptDTO"%>
<%@page import="erp.dto.LoginDTO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/kimsaemERP/common/css/jquery.treeview.css" />
<!-- <link rel="stylesheet" 
			href="/kimsaemERP/common/css/screen.css" /> -->

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script> -->
<script src="/kimsaemERP/common/js/jquery.cookie.js"></script>
<script src="/kimsaemERP/common/js/jquery.treeview.js"></script>

<script type="text/javascript" src="/kimsaemERP/common/js/demo.js"></script>

<script type="text/javascript">
	deptno = "";
	function runAjax(mydeptno) {
		//�Ź� �μ����� Ŭ���Ҷ����� runAjax�� ȣ��ǰ� mydeptno�� Ŭ���� �μ��� �μ���ȣ��
		//���޵ȴ�.
		deptno = mydeptno;//�ڿ��� id������ ����� ��
		alert("ȣ�⼺��:" + mydeptno);
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = readyCallback;
		xhr.open("GET", "/kimsaemERP/ajaxtreedata?deptno=" + mydeptno, true);
		xhr.send();
	}
	function readyCallback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//����ó���Ǹ� ajax��û�� ����� �������� ������ �����͸� ������ ���ƿ´�.
			alert(xhr.responseText);//html,text,json
			//�����κ��� ���޵� json������ ���ڿ��� �Ľ��ؼ� �ڹٽ�ũ��Ʈ���� ������ �� �ִ�
			//JSON��ü�� ��ȯ
			var myjsonObj = JSON.parse(xhr.responseText);
			alert(myjsonObj.emplist[0].name);
			//�ش� ul��忡 json��ü���� ������ name�� �߰��ϱ� - innerHTML
			deptnode = document.getElementById(deptno);
			mydata = "";
			//myjsonObj.emplist�� ����� JSONObject�� �ϳ��� ������ i�� �Ҵ�
			for (i in myjsonObj.emplist) {
				mydata = mydata 
				+ "<li><span class='file' onclick=empInfo('"+myjsonObj.emplist[i].id+"')>"
						+ myjsonObj.emplist[i].name + "</span></li>";
			}
			deptnode.innerHTML = mydata;

		}
	}
	//emp������ ajax�� ��û
	function empInfo(id){
		alert("��û����===>"+id);
		
	}
</script>
<%
	ArrayList<DeptDTO> deptnamelist = (ArrayList<DeptDTO>) request.getAttribute("deptnamelist");
	int size = deptnamelist.size();
	System.out.println("jsp" + deptnamelist);
%>
<% LoginDTO user = 
				(LoginDTO) session.getAttribute("loginUser"); %>
</head>
<body>
	<h1>kimsaemJavaNara������</h1>
	<div id="deptlist" style="margin: 20px" class="col-sm-5">
		<ul id="browser" class="filetree">
			<%
				for (int i = 0; i < size; i++) {
					DeptDTO dept = deptnamelist.get(i);
			%>
			<li class="closed"><span class="folder"
				onclick="runAjax('<%=dept.getDeptno()%>')"> <%=dept.getDeptname()%></span>
				<ul id="<%=dept.getDeptno()%>">

				</ul></li>
			<%
				}
			%>
		</ul>
	</div>
	<div style="margin-top: 20px; height: 400px;display: none; "
		class="col-sm-6">

		<form role="form" class="form-horizontal"
			action="/kimsaemERP/emp/update.do" method="POST" name="myform">
			<fieldset>
				<div id="legend">
					<h4>������ ����� �⺻ �����Դϴ�.</h4>
				</div>
				<div class="form-group">
					<p class="col-sm-5">
						<img src="/kimsaemERP/images/<%=user.getProfile_photo()%>"
							id="userImage" style="width: 100px">
					</p>
					<div	 class="col-sm-7" style="color: blue;">���� ������ �������� ������
						������ ���Ͻø� �μ����λ���ȸ�� �����ϰ� �۾��ϼ���.</div>

				</div>
				<div class="form-group">
					<!-- �μ��ڵ� -->
					<label class="control-label col-sm-5" for="orgcode">�μ��ڵ�</label>
					<div class="control-label col-sm-5">
						<!-- ���⿡ �μ��ڵ带 ����ϼ���  -->
						<%=user.getDeptno()%>
					</div>
				</div>
				<div class="form-group">
					<!-- �μ��ڵ� -->
					<label class="control-label col-sm-5" for="orgcode">�μ���</label>
					<div class="control-label col-sm-5">
						<!-- ���⿡ �μ��ڵ带 ����ϼ���  -->
						<%=user.getDeptname()%>
					</div>
				</div>

				<div class="form-group">
					<!-- ����-->
					<label class="control-label col-sm-5" for="name">����</label>
					<div class="control-label col-sm-5">
						<%=user.getName()%>
					</div>
				</div>
				<div class="form-group">
					<!-- ���-->
					<label class="control-label col-sm-5" for="id">���</label>
					<div class="control-label col-sm-5">
						<!-- ���⿡ ����� ����ϼ���  -->
						<%=user.getId()%>
					</div>
					<span id="checkVal"></span>
				</div>


				<div class="form-group">
					<!-- ����-->
					<label class="control-label col-sm-5" for="birthday">����</label>
					<div class="control-label col-sm-5">
						<!-- ���⿡ ���� ����ϼ���  -->
						<%=user.getPosition()%>
					</div>
				</div>
				<div class="form-group">
					<!-- ��å-->
					<label class="control-label col-sm-5" for="birthday">��å</label>
					<div class="control-label col-sm-5">
						<!-- ���⿡ ��å ����ϼ���  -->
						<%=user.getDuty()%>
					</div>
				</div>



			</fieldset>
		</form>
	</div>
</body>
</html>




