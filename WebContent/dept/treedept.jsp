<%@page import="erp.dto.MemberDTO"%>
<%@page import="erp.dto.LoginDTO"%>
<%@page import="erp.dto.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jQuery treeview</title>

<link rel="stylesheet" href="/kimsaemERP/common/css/jquery.treeview.css" />
<!-- <link rel="stylesheet" href="/kimsaemERP/common/css/screen.css" /> -->
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script> -->
<script src="/kimsaemERP/common/js/jquery.treeview.js"
	type="text/javascript"></script>
<script src="/kimsaemERP/common/js/query.cookie.js"></script>
<script type="text/javascript" src="/kimsaemERP/common/js/demo.js"></script>
<script type="text/javascript">
	var xhr
	var deptno = "";
	function runAjax(mydeptno) {
		//�Ź� �μ����� Ŭ���� ������ runAjax�� ȣ��ǰ� mydeptno�� Ŭ���� �μ��� �μ���ȣ�� ���޵ȴ�.
		deptno = mydeptno; //�ڿ��� id������ ����� ��
		//alert("test");
		//alert(mydeptno);
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				//����ó���Ǹ� ajax��û�� ����� �������� ������ �����͸� ������ ���´�.
				// alert(xhr.responseText); //html, text, json

				//�����κ��� ���޵� json������ ���ڿ��� �Ľ��ؼ� �ڹٽ�ũ��Ʈ���� ������ �� �ִ� JSON��ü�� ��ȯ
				var myjsonObj = JSON.parse(xhr.responseText);
				//alert(myjsonObj.emplist[0].name);

				//�۾����� ��ü ���ϱ� - �۾����� ��ü�� ������ ����
				deptnode = document.getElementById(deptno);

				//myjsonObj.emplist�� ����� JSONObject�� �ϳ��� ������ i�� �Ҵ�
				//deptchildes = deptnode.childNodes;
				mydata = "";
				for (i in myjsonObj.emplist) {
					mydata = mydata + "<li><span class='file' onclick=empInfo('"+myjsonObj.emplist[i].id+"')>"
							+ myjsonObj.emplist[i].name + "</span></li>";
					/* mydata = mydata + "<li><span class='file'>"
						+ myjsonObj.emplist[i].name + "</span></li>"; */
				}
				deptnode.innerHTML = mydata;
			}
		}
		xhr.open("GET", "/kimsaemERP/ajaxtreedata?deptno="+ mydeptno,true);
		xhr.send();
	}
	
	//emp������ ajax�� ��û
	function empInfo(myid) {
		//alert(myid);
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				mydiv = document.getElementById("empinfo");
				mydiv.setAttribute("style", "display:block");
				
				var emp = JSON.parse(xhr.responseText);
				
				image = "/kimsaemERP/images/"+emp.profile_photo;
				document.getElementById("userImage").src = image;
				document.getElementById("deptno").innerHTML = emp.deptno;
				document.getElementById("name").innerHTML = emp.name;
				document.getElementById("id").innerHTML = emp.id;
				document.getElementById("position").innerHTML = emp.position;
				document.getElementById("duty").innerHTML = emp.duty;
			}
		}
		xhr.open("GET", "/kimsaemERP/getempinfo.do?id="+ myid,true);
		xhr.send();
	}
</script>
</head>
<body>
	<%
		ArrayList<DeptDTO> deptList = (ArrayList<DeptDTO>) request.getAttribute("deptList");
		int size = deptList.size();
	%>
	<h1>KimsaemJavaNara������</h1>
	<div id="deptlist" style="margin: 20px" class="col-sm-6">
		<ul id="browser" class="filetree">
			<%
				for (int i = 0; i < size; i++) {
					DeptDTO dept = deptList.get(i);
			%>
			<li class="closed"><span class="folder"
				onclick="runAjax('<%=dept.getDeptno()%>')"> <%=dept.getDeptname()%></span>
				<ul id="<%=dept.getDeptno()%>"></ul>
			</li>
			<%
				}
			%>
			<!-- <li><span class="folder">Folder 2</span>
			<ul>
				<li><span class="folder">Subfolder 2.1</span>
					<ul id="folder21">
						<li><span class="file">File 2.1.1</span></li>
						<li><span class="file">File 2.1.2</span></li>
					</ul>
				</li>
				<li><span class="file">File 2.2</span></li>
			</ul>
		</li>
		<li class="closed"><span class="folder">Folder 3 (closed at start)</span>
			<ul>
				<li><span class="file">File 3.1</span></li>
			</ul>
		</li>
		<li><span class="file">File 4</span></li> -->
		</ul>
	</div>

	<div style="margin-top: 20px; height: 400px; display:none; "
		class="col-sm-5" id="empinfo" >

		<form role="form" class="form-horizontal"
			action="/kimsaemERP/emp/update.do" method="POST" name="myform">
			<fieldset>
				<div id="legend">
					<legend>������ ����� �⺻ �����Դϴ�.</legend>
				</div>
				<div class="form-group">
					<p class="col-sm-4">
						<img src="" id="userImage" style="width: 90px">
					</p>
					<div class="col-sm-8" style="color: blue;">���� ������ �������� ������
						������ ���Ͻø� �μ����λ���ȸ�� �����ϰ� �۾��ϼ���.</div>

				</div>
				<div class="form-group">
					<!-- �μ��ڵ� -->
					<label class="control-label col-sm-4" for="orgcode">�μ��ڵ�</label>
					<div class="control-label col-sm-4" id="deptno">
						<!-- ���⿡ �μ��ڵ带 ����ϼ���  -->
					</div>
				</div>
				<div class="form-group">
						<!-- �μ��ڵ� -->
						<label class="control-label col-sm-4" for="orgcode">�μ���</label>
						<div class="control-label col-sm-3">
							<!-- ���⿡ �μ����� ����ϼ���  -->
						</div>
				</div>
				<div class="form-group">
					<!-- ����-->
					<label class="control-label col-sm-4" for="name">����</label>
					<div class="control-label col-sm-4" id="name">
					</div>
				</div>
				<div class="form-group">
					<!-- ���-->
					<label class="control-label col-sm-4" for="id">���</label>
					<div class="control-label col-sm-4" id="id">
						<!-- ���⿡ ����� ����ϼ���  -->
					</div>
					<span id="checkVal"></span>
				</div>
				<div class="form-group">
					<!-- ����-->
					<label class="control-label col-sm-4" for="birthday">����</label>
					<div class="control-label col-sm-4" id="position">
						<!-- ���⿡ ���� ����ϼ���  -->
					</div>
				</div>
				<div class="form-group">
					<!-- ��å-->
					<label class="control-label col-sm-4" for="birthday">��å</label>
					<div class="control-label col-sm-4" id="duty">
						<!-- ���⿡ ��å ����ϼ���  -->
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>