<%@page import="erp.dto.DeptDTO"%>
<%@page import="erp.dto.LoginDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/kimsaemERP/common/css/jquery.treeview.css" />
	<!-- <link rel="stylesheet" href="/kimsaemERP/common/css/screen.css" /> -->

	<!-- ���ο� js�� �����Ƿ� ���� �浹�� �Ͼ���� �ּ� -->
	<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>-->
	<script src="/kimsaemERP/common/js/jquery.cookie.js"></script>
	<script src="/kimsaemERP/common/js/jquery.treeview.js"></script>

	<script type="text/javascript" src="/kimsaemERP/common/js/demo.js"></script>
	
	<script type="text/javascript">
	
		deptno = "";
 		function runAjax(mydeptno){
 			// �Ź� �μ����� Ŭ���� ������ runAjax�� ȣ��ǰ� mydeptno�� Ŭ���� �μ��� �μ���ȣ�� ���޵ȴ�.
 			deptno = mydeptno;		// �ڿ��� id������ ����� ��(li class="closed"�� id)
 			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = readyCallback;
			xhr.open("GET", "/kimsaemERP/ajaxtreedata?deptno="+mydeptno,true);
			xhr.send();	
 		}
 		function readyCallback(){
 			if(xhr.readyState==4 && xhr.status==200){
 				// ����ó���Ǹ� ajax��û�� ����� �������� ������ �����͸� ������ ���ƿ´�.
 				alert(xhr.responseText);	// html, text, json
 				
 				// �����κ��� ���޵� json������ ���ڿ��� �Ľ��ؼ� �ڹٽ�ũ��Ʈ���� ������ �� �ִ� JSON��ü�� ��ȯ
 				var myjsonObj = JSON.parse(xhr.responseText);
 				// alert(myjsonObj.emplist[0].name);
 				
 				// �۾����� ��ü�� ���ϱ� - �۾����� ��ü�� ������ ���� (�ð��� ���� �ɸ� �� �־ ���� �����ϴ� ������� ��)
 				/* 
 				deptnode = document.getElementById(deptno);
 				deptChildes = deptnode.childNodes;
 				alert(deptChildes.length); */
 				
 				// myjsonObj.emplist���� �ϳ��� ��ü�� ������ i�� �����ϰ� 
 				// myjsonObj.emplist�ȿ� ����� object�� ������ŭ  for���� ����
 				/* for(i in myjsonObj.emplist){
 				} */
 				
 				// �ش� ul��忡 json��ü���� ������ name�� �߰��ϱ� - innerHTML
 				deptnode = document.getElementById(deptno);
 				
 				mydata = "";
 				// myjsonObj.emplist�� ����� JSONObject�� �ϳ��� ������ i�� �Ҵ�
 				for(i in myjsonObj.emplist){
 					mydata = mydata + "<li><span class='file' onclick=empInfo('"+myjsonObj.emplist[i].id+"')>"+myjsonObj.emplist[i].name+"</span></li>";
 				}
 				deptnode.innerHTML = mydata;
 			}
 		}
 		
 		// emp������ ajax�� ��û
 		function empInfo(empid){
 			alert(empid);
 			alert("��û���� : "+empid);
 			alert(xhr.responseText);
 			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState==4 && xhr.status==200){
	 				var myjsonObj = JSON.parse(xhr.responseText);
	 				deptno = document.getElementById("empdeptno");
	 				deptname = document.getElementById("empdeptname");
	 				empname = document.getElementById("empname");
	 				empno = document.getElementById("empno");
	 				empposition = document.getElementById("empposition");
	 				empduty = document.getElementById("empduty");
	 				
	 				image = document.getElementById("userImage");
	 				image.src = myjsonObj.profile_photo;
	 				
	 				deptno.innerHTML = myjsonObj.deptno;
	 				deptname.innerHTML = myjsonObj.deptname;
	 				empname.innerHTML = myjsonObj.name;
	 				empno.innerHTML = myjsonObj.id;
	 				empposition.innerHTML = myjsonObj.position;
	 				empduty.innerHTML = myjsonObj.duty;
				}
			}
			xhr.open("GET", "/kimsaemERP/empinfo?id="+empid,true);
			xhr.send();	 
 		}
	</script>
	<%
		ArrayList<DeptDTO> deptnamelist = (ArrayList<DeptDTO>) request.getAttribute("deptnamelist");
		int size = deptnamelist.size();
		// System.out.println("jsp" + deptnamelist);
	%>
	<%
		LoginDTO user = (LoginDTO) session.getAttribute("loginUser");
	%>
</head>
<body>
	<h1>kimsaemJavaNara������</h1>

	<div id="deptlist" style="margin: 20px" class="col-sm-6">
		<ul id="browser" class="filetree">
			<%
				for (int i = 0; i < size; i++) {
					DeptDTO dept = deptnamelist.get(i);
			%>
			<li class="closed"><span class="folder"
				onclick="runAjax('<%=dept.getDeptno()%>')"><%=dept.getDeptname()%></span>
				<ul id="<%=dept.getDeptno()%>">
					<!-- <li><span class="file">�嵿��</span></li> -->
				</ul></li>
			<%
				}
			%>
		</ul>
	</div>


	<div style="margin-top: 20px; height: 400px;"
		class="col-sm-5">

		<form role="form" class="form-horizontal"
			action="/kimsaemERP/emp/update.do" method="POST" name="myform">
			<fieldset>
				<div id="legend">
					<legend>������ ����� �⺻ �����Դϴ�.</legend>
				</div>
				<div class="form-group">
					<p class="col-sm-4">
						<img src="/kimsaemERP/images/<%=user.getProfile_photo() %>"
							id="userImage" style="width: 100px">
					</p>
					<div class="col-sm-7" style="color: blue;">���� ������ �������� ������
						������ ���Ͻø� �μ����λ���ȸ�� �����ϰ� �۾��ϼ���.</div>

				</div>
				<div class="form-group">
					<!-- �μ��ڵ� -->
					<label class="control-label col-sm-4" for="orgcode">�μ��ڵ�</label>
					<div class="control-label col-sm-3" id="empdeptno">
						<!-- ���⿡ �μ��ڵ带 ����ϼ���  -->
					</div>
				</div>
				<div class="form-group">
					<!-- �μ��ڵ� -->
					<label class="control-label col-sm-4" for="orgcode">�μ���</label>
					<div class="control-label col-sm-3" id="empdeptname">
						<!-- ���⿡ �μ��ڵ带 ����ϼ���  -->
					</div>
				</div>

				<div class="form-group">
					<!-- ����-->
					<label class="control-label col-sm-4" for="name">����</label>
					<div class="control-label col-sm-3" id="empname">
					</div>
				</div>
				<div class="form-group">
					<!-- ���-->
					<label class="control-label col-sm-4" for="id">���</label>
					<div class="control-label col-sm-3" id="empno">
						<!-- ���⿡ ����� ����ϼ���  -->
					</div>
					<span id="checkVal"></span>
				</div>


				<div class="form-group">
					<!-- ����-->
					<label class="control-label col-sm-4" for="birthday">����</label>
					<div class="control-label col-sm-3" id="empposition">
						<!-- ���⿡ ���� ����ϼ���  -->
					</div>
				</div>
				<div class="form-group">
					<!-- ��å-->
					<label class="control-label col-sm-4" for="birthday">��å</label>
					<div class="control-label col-sm-3" id="empduty">
						<!-- ���⿡ ��å ����ϼ���  -->
					</div>
				</div>



			</fieldset>
		</form>
	</div>

</body>
</html>