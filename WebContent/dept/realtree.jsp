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
	ulnode="";
	$(document).ready(function() {
		$(".folder").on("click", function() {
			deptname = $(this).text().trim();
			//this의 다음노드로 접근
			ulnode = $(this).next();
			//ul노드의 id속성 값을 구하기
			deptno = $(ulnode).attr("id");
			//alert(deptno);
			$.get("/kimsaemERP/ajaxtreedata", {"deptno":deptno},getData,"json");
		});
		//동적으로 생성된 노드(ajax실행결과로 추가된 태그)에 이벤트를 연결하는 방법		
		//1번매개변수 - 이벤트시점, 2번매개변수 - 어떤 태그에 이벤트를 연결할 것 인지 정의
		//3번매개변수 - 이벤트가 발생할 때 실행할 함수
		$(document).on("click",".file",function(){
			id = "";
			alert(id);
			$.get("/kimsaemERP/getempinfo.do", {"id":id}, getEmpInfo, "json");
		})
	})
	//jquery를 이용하면 json이 파싱되어 객체상태로 리턴된다.
	function getData(data){
		//alert(data.emplist[0].name);
		myli = "";
		for(i in data.emplist){
			myli = myli + "<li><span class='file' id='"+ data.emplist[i].id +"'>"
					+ data.emplist[i].name +"</span></li>";
		}
		$(ulnode).html(myli);
	}
	function getEmpInfo(emp){
		alert("test");
		$("#empinfo").css("display","block");
		$("#userImage").attr("src","/kimsaemERP/images/"+emp.profile_photo);
		$("#deptno").text(emp.deptno);
		$("#name").text(emp.name);
		$("#id").text(emp.id);
		$("#position").text(emp.position);
		$("#duty").text(emp.duty);
		
	}
</script>
</head>
<body>
<% 
	ArrayList<DeptDTO> deptList = (ArrayList<DeptDTO>)request.getAttribute("deptList");
	int size = deptList.size();
%>
	<h1>KimsaemJavaNara 조직도 - 계층구조표현(jquery)</h1>
	<div id="result"></div>
	<ul id="browser" class="filetree" >
		<%for(int i=0; i<size; i++){ 
			DeptDTO dept = deptList.get(i);%>
			<li class="closed">
				<span class="folder">
				<%=dept.getDeptname() %></span>
				<ul id="<%=dept.getDeptno()%>">
					<!-- <li><span class="file">장동건</span></li> -->
				</ul>
			</li>
		<%} %>
	</ul>
	
	<div style="margin-top: 20px; height: 400px; display:none;" class="col-sm-5" id="empinfo" >
		<form role="form" class="form-horizontal"
			action="/kimsaemERP/emp/update.do" method="POST" name="myform">
			<fieldset>
				<div id="legend">
					<legend>선택한 사원의 기본 정보입니다.</legend>
				</div>
				<div class="form-group">
					<p class="col-sm-4">
						<img src="" id="userImage" style="width: 90px">
					</p>
					<div class="col-sm-8" style="color: blue;">직원 정보가 보여지는 곳으로
						수정을 원하시면 부서별인사조회를 선택하고 작업하세요.</div>

				</div>
				<div class="form-group">
					<!-- 부서코드 -->
					<label class="control-label col-sm-4" for="orgcode">부서코드</label>
					<div class="control-label col-sm-4" id="deptno">
						<!-- 여기에 부서코드를 출력하세요  -->
					</div>
				</div>
				<div class="form-group">
						<!-- 부서코드 -->
						<label class="control-label col-sm-4" for="orgcode">부서명</label>
						<div class="control-label col-sm-3">
							<!-- 여기에 부서명을 출력하세요  -->
						</div>
				</div>
				<div class="form-group">
					<!-- 성명-->
					<label class="control-label col-sm-4" for="name">성명</label>
					<div class="control-label col-sm-4" id="name">
					</div>
				</div>
				<div class="form-group">
					<!-- 사번-->
					<label class="control-label col-sm-4" for="id">사번</label>
					<div class="control-label col-sm-4" id="id">
						<!-- 여기에 사번을 출력하세요  -->
					</div>
					<span id="checkVal"></span>
				</div>
				<div class="form-group">
					<!-- 직위-->
					<label class="control-label col-sm-4" for="birthday">직위</label>
					<div class="control-label col-sm-4" id="position">
						<!-- 여기에 직위 출력하세요  -->
					</div>
				</div>
				<div class="form-group">
					<!-- 직책-->
					<label class="control-label col-sm-4" for="birthday">직책</label>
					<div class="control-label col-sm-4" id="duty">
						<!-- 여기에 직책 출력하세요  -->
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>