<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="erp.dto.DeptDTO"%>
<%@page import="erp.dto.LoginDTO"%>
<%@page import="erp.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="/kimsaemERP/common/css/jquery.treeview.css" />
<!-- 	<link rel="stylesheet" href="/kimsaemERP/common/css/screen.css" /> -->
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script> -->
<script src="/kimsaemERP/common/js/jquery.cookie.js"></script>
<script src="/kimsaemERP/common/js/jquery.treeview.js"></script>
<script type="text/javascript" src="/kimsaemERP/common/js/demo.js"></script>


<script type="text/javascript">
	function runAjax(mydeptno) {
		// �Ź� �μ����� Ŭ���� ������ runAjax�� ȣ��ǰ� mydeptno�� Ŭ���� �μ��� �μ���ȣ�� ���޵ȴ�.
		deptno = mydeptno; // �ڿ��� id������ ����� ��
		//alert("ȣ�⼺��: "+mydeptno);
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = readyCallback;

		xhr.open("GET", "/kimsaemERP/ajaxtreedata?deptno=" + mydeptno, true);
		xhr.send();
	}

	function readyCallback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			// ����ó���Ǹ� ajax��û�� ����� �������� ������ �����͸� ������ ���ƿ´�.
			//alert(xhr.responseText); // html, text, json�ΰ�� responseText

			// �����κ��� ���޵� json������ ���ڿ��� �Ľ��ؼ� �ڹٽ�ũ��Ʈ���� ������ �� �ִ� JSON ��ü�� ��ȯ
			var myjsonobj = JSON.parse(xhr.responseText);
			//alert(myjsonobj.emplist[0].name);

			// �ش� ul��忡 json��ü���� ������ name�� �߰��ϱ� - innerHTML
			deptnode = document.getElementById(deptno);
			mydata = "";

			//myjsonobj.emplist�� ����� JSONObject�� �ϳ��� ������ i�� �Ҵ�
			for (i in myjsonobj.emplist) {
				mydata = mydata + "<li><span class='file' onclick=empInfo('"
						+ myjsonobj.emplist[i].id + "')>"
						+ myjsonobj.emplist[i].name + "</span></li>";
			}
			deptnode.innerHTML = mydata;
		}
	}

	// emp�� ��û�ϴ� ajax�� ��û
	function empInfo(id) {
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = empCallback;
		xhr.open("GET", "/kimsaemERP/ajaxEmpInfo?id=" + id, true);
		xhr.send();
	}

	function empCallback() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			//alert("empcallback: "+xhr.responseText);
			mydiv = document.getElementById("empinfo");
			mydiv.setAttribute("style", "display:block");

			var emp = JSON.parse(xhr.responseText);
			document.getElementById("userImage").src = "/kimsaemERP/images/"+emp.profile_photo;
			document.getElementById("id").innerHTML = emp.id;
			document.getElementById("deptno").innerHTML = emp.deptno;
			document.getElementById("deptname").innerHTML = emp.deptname;
			document.getElementById("name").innerHTML = emp.name;
			document.getElementById("position").innerHTML = emp.position;
			document.getElementById("duty").innerHTML = emp.duty;

		}
	}
</script>
<%
	ArrayList<DeptDTO> deptnamelist = (ArrayList<DeptDTO>) request.getAttribute("deptnamelist");
	int size = deptnamelist.size();
%>

<%
	LoginDTO user = (LoginDTO) session.getAttribute("loginUser");
%>
</head>

<body>
	<h1>kimsaemJavaNara ������</h1>
	<div id="deptlist" style="margin: 20px" class="col-sm-6">
		<ul id="browser" class="filetree">
			<%
				for (int i = 0; i < size; i++) {
					DeptDTO dept = deptnamelist.get(i);
			%>

			<li class="closed"><span class="folder"
				onclick="runAjax('<%=dept.getDeptno()%>')"><%=dept.getDeptname()%></span>
				<ul id="<%=dept.getDeptno()%>">
					<!-- <li><span class="file">�嵿��</span></li>  -->
				</ul></li>
			<%
				}
			%>
		</ul>
	</div>

	<!-- ===========================�ι�°=============================== -->
	<div style="margin-top: 20px; height: 400px; display: none;"
		class="col-sm-5" id="empinfo">

		<form role="form" class="form-horizontal"
			action="/kimsaemERP/emp/update.do" method="POST" name="myform">
			<fieldset>
				<div id="legend">
					<legend>������ ����� �⺻ �����Դϴ�.</legend>
				</div>
				<div class="form-group">
					<p class="col-sm-4">
						<img src="" id="userImage" style="width: 100px">
					</p>
					<div class="col-sm-7" style="color: blue;">���� ������ �������� ������
						������ ���Ͻø� �μ����λ���ȸ�� �����ϰ� �۾��ϼ���.</div>

				</div>
				<div class="form-group">
					<!-- �μ��ڵ� -->
					<label class="control-label col-sm-4" for="orgcode">�μ��ڵ�</label>
					<div class="control-label col-sm-3" id="deptno">
						<!-- ���⿡ �μ��ڵ带 ����ϼ���  -->
					</div>
				</div>
				<div class="form-group">
					<!-- �μ��� -->
					<label class="control-label col-sm-4" for="orgcode">�μ���</label>
					<div class="control-label col-sm-3" id="deptname">
						<!-- ���⿡ �μ����� ����ϼ���  -->
					</div>
				</div>

				<div class="form-group">
					<!-- ����-->
					<label class="control-label col-sm-4" for="name">����</label>
					<div class="control-label col-sm-3" id="name">
						<!-- ���⿡ ������ ����ϼ���  -->
					</div>
				</div>
				<div class="form-group">
					<!-- ���-->
					<label class="control-label col-sm-4" for="id">���</label>
					<div class="control-label col-sm-3" id="id">
						<!-- ���⿡ ����� ����ϼ���  -->
					</div>
					<span id="checkVal"></span>
				</div>


				<div class="form-group">
					<!-- ����-->
					<label class="control-label col-sm-4" for="birthday">����</label>
					<div class="control-label col-sm-3" id="position">
						<!-- ���⿡ ���� ����ϼ���  -->
					</div>
				</div>
				<div class="form-group">
					<!-- ��å-->
					<label class="control-label col-sm-4" for="birthday">��å</label>
					<div class="control-label col-sm-3" id="duty">
						<!-- ���⿡ ��å ����ϼ���  -->
					</div>
				</div>

			</fieldset>
		</form>
	</div>
</body>
</html>