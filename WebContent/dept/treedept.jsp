<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="erp.dto.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="erp.dto.LoginDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="/kimsaemERP/common/css/jquery.treeview.css" />
<!--  <link rel="stylesheet" href="/kimsaemERP/common/css/screen.css" />  -->
<!-- <script src="/kimsaemERP/common/js/jquery.cookie.js"></script> -->
<script src="/kimsaemERP/common/js/jquery.treeview.js"></script>

<script type="text/javascript" src="/kimsaemERP/common/js/demo.js"></script>
<%
 ArrayList<DeptDTO> deptnamelist =(ArrayList<DeptDTO>) request.getAttribute("deptnamelist");
	int size  = deptnamelist.size();
	System.out.println("jsp"+deptnamelist);
	
 %>
 <% LoginDTO user = 
				(LoginDTO) session.getAttribute("loginUser"); %>
</head>
<body>
	<h1>KimSaemJavaNara������</h1>
	
	<div id="deptlist" style="margin: 20px" class="col-sm-6">
		<ul id="browser" class="filetree">
			<%for(int i=0;i<size;i++){
				DeptDTO dept = deptnamelist.get(i);
			%>
			<li class="closed"><span class="folder"><%= dept.getDeptname() %></span>
				 <ul>
				
				
				</ul> 
				<!--  <ul>
					<li><span class="file">�嵿��</span></li>
				</ul>  -->
			</li>
		    <%} %>
			<!-- 		<li>
		<span class="folder">Folder 2</span>
				<ul>
					<li><span class="folder">Subfolder 2.1</span>
						<ul id="folder21">
							<li><span class="file">File 2.1.1</span></li>
							<li><span class="file">File 2.1.2</span></li>
						</ul></li>
					<li><span class="file">File 2.2</span></li>
				</ul>
		</li>
		<li class="closed">
			<span class="folder">Folder 3 (closedat start)</span>
			<ul>
				<li><span class="file">File 3.1</span></li>
			</ul>
		</li>
		<li><span class="file">File 4</span></li> -->
		</ul>
	</div>
	<div style="margin-top:20px; height: 400px;display: none;" class="col-sm-5">
	
				<form role="form" class="form-horizontal"
				action="/kimsaemERP/emp/update.do" method="POST" 
				name="myform">
				<fieldset>
					<div id="legend">
						<legend>������ ����� �⺻ �����Դϴ�.</legend>
					</div>
					<div class="form-group" >
						<p class="col-sm-4">
							<img src="/kimsaemERP/images/<%=user.getProfile_photo() %>" 
							 id="userImage" style="width: 100px">
						</p>
						<div class="col-sm-7" style="color: blue;">
							���� ������ �������� ������ ������ ���Ͻø� �μ����λ���ȸ�� �����ϰ� �۾��ϼ���.
						</div>
				
					</div>
					<div class="form-group">
						<!-- �μ��ڵ� -->
						<label class="control-label col-sm-4" for="orgcode">�μ��ڵ�</label>
						<div class="control-label col-sm-3">
							<!-- ���⿡ �μ��ڵ带 ����ϼ���  -->
							<%= user.getDeptno() %>
						</div>
					</div>
					<div class="form-group">
						<!-- �μ��ڵ� -->
						<label class="control-label col-sm-4" for="orgcode">�μ���</label>
						<div class="control-label col-sm-3">
							<!-- ���⿡ �μ��ڵ带 ����ϼ���  -->
							<%= user.getDeptname() %>
						</div>
					</div>
		
					<div class="form-group">
						<!-- ����-->
						<label class="control-label col-sm-4" for="name">����</label>
						<div class="control-label col-sm-3">
							<%= user.getName()%>
						</div>
					</div>
					<div class="form-group">
						<!-- ���-->
						<label class="control-label col-sm-4" for="id">���</label>
						<div class="control-label col-sm-3">
							<!-- ���⿡ ����� ����ϼ���  -->
							<%= user.getId() %>
						</div>
						<span id="checkVal"></span>
					</div>
				
				
					<div class="form-group">
						<!-- ����-->
						<label class="control-label col-sm-4" for="birthday">����</label>
						<div class="control-label col-sm-3">
							<!-- ���⿡ ���� ����ϼ���  -->
							<%= user.getPosition()%>
						</div>
					</div>
					<div class="form-group">
						<!-- ��å-->
						<label class="control-label col-sm-4" for="birthday">��å</label>
						<div class="control-label col-sm-3">
							<!-- ���⿡ ��å ����ϼ���  -->
							<%= user.getDuty()%>
						</div>
					</div>
				
				
				
				</fieldset>
			</form></div>
</body>
</html>