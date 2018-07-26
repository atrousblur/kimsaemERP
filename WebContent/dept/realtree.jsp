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
<!-- 	<link rel="stylesheet" href="/kimsaemERP/common/css/screen.css" /> -->
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script> -->
<script src="/kimsaemERP/common/js/jquery.cookie.js"></script>
<script src="/kimsaemERP/common/js/jquery.treeview.js"></script>
<script type="text/javascript" src="/kimsaemERP/common/js/demo.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".folder").on("click", function() {
			deptname = $(this).text().trim();	// ��������
			
			// this�� ���� ���� ����
			ulnode = $(this).next();
			
			// ul����� id�Ӽ� ���� ���ϱ�
			deptno = $(ulnode).attr("id");
			//alert(deptno);
			
			$.get("/kimsaemERP/ajaxtreedata", {"deptno" : deptno}, getData, "json")
		})
	});
	
	// �������� ������ ���(ajax�������� �߰��� �±�)�� �̺�Ʈ�� ����
	// 1 �Ű����� - �̺�Ʈ����, 2 �Ű����� - � �±׿� �̺�Ʈ�� ������ ������ ����
	// 3 �Ű����� - �̺�Ʈ�� �߻��Ҷ� ������ �Լ�
	$(document).on("click",".file", function(){
		alert("test");
	})

	// jquery�� �̿��ϸ� json�� �Ľ̵Ǿ� ��ü���·� ���ϵȴ�.
	function getData(data) {
		//alert(data.emplist[0].name);
		myli = "";
		for (i in data.emplist){
			myli =  "<li><span class='file' id='"+data.emplist[i].id + "'>"+ data.emplist[i].name + "</span></li>";
		}
		$(ulnode).html(myli);
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

			<li class="closed">
			<span class="folder"> <%=dept.getDeptname()%></span>
			<ul id="<%=dept.getDeptno()%>"></ul>
			</li>
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