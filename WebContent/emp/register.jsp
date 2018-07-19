<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
			<form role="form" class="form-horizontal"
				action="/serverweb/register.do" method="POST" 
				name="myform">
				<fieldset>
					<div id="legend">
						<legend>�Ʒ� ����� �ۼ����ּ���.</legend>
					</div>
					<div class="form-group">
						<!-- �μ��ڵ� -->
						<label class="control-label col-sm-2" for="orgcode">�μ��ڵ�</label>
						<div class="col-sm-3">
							<input type="text" id="orgcode" name="deptno"
								placeholder="�μ��ڵ�" class="form-control"
								 required>
						</div>
					</div>

					
					
					<div class="form-group">
						<!-- ����-->
						<label class="control-label col-sm-2" for="orgname">����</label>
						<div class="col-sm-3">
							<input type="text" id="orgname" name="name"
								placeholder="����" class="form-control" minlength="4" required>

						</div>
					</div>
					<div class="form-group">
						<!-- ���-->
						<label class="control-label col-sm-2" for="id">���</label>
						<div class="col-sm-3">
							<input type="text" id="id" name="id"
								placeholder="���" class="form-control" 
								minlength="4" required onkeyup="runAjax()">
							
						</div>
						<span id="checkVal"></span>
					</div>



				


					
					<div class="form-group">
						<!-- �н�����-->
						<label class="control-label col-sm-2" for="pass">�н�����</label>
						<div class="col-sm-3">
							<input type="text" id="pass" name="pass"
								placeholder="�н�����" class="form-control" minlength="4" >

						</div>
					</div>
					<div class="form-group">
						<!-- �ּ�-->
						<label class="control-label col-sm-2" for="addr">�ּ�</label>
						<div class="col-sm-3">
							<input type="text" id="addr" name="addr" 
							placeholder="�ּ�"
								class="form-control" minlength="4" required>

						</div>
					</div>
					<div class="form-group">
						<!-- ����Ʈ-->
						<label class="control-label col-sm-2" for="point">����Ʈ</label>
						<div class="col-sm-3">
							<input type="text" id="point" name="point" 
							placeholder="����Ʈ"
								class="form-control" minlength="4" required>

						</div>
					</div>
					<div class="form-group">
						<!-- ���-->
						<label class="control-label col-sm-2" for="grade">���</label>
						<div class="col-sm-3">
							<input type="text" id="grade" name="grade" 
							placeholder="���"
								class="form-control" minlength="4" required>

						</div>
					</div>
					<div class="form-group">
						<!-- Button -->
						<div class="col-sm-3 col-sm-offset-2">
							<input type="submit" value="�����ϱ�" class="btn btn-success"/>
						</div>
					</div>
				</fieldset>
			</form>
	</div>
	<div><a href="/serverweb/list.do">ȸ����Ϻ���</a></div>
</body>
</html>