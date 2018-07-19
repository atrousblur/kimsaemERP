<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 </head>
<body>
	<div class="container-fluid">
			<form role="form" class="form-horizontal"
				action="/serverweb/emp/insert.do" method="POST" 
				name="myform">
				<fieldset>
					<div id="legend">
						<legend>�Ʒ� ����� �ۼ����ּ���.</legend>
					</div>
					<div class="form-group" style="padding: 40px">
						<p class="centered">
							<img src="/kimsaemERP/images/myphoto.jpg" 
							 id="userImage" style="width: 100px">
						</p>
						<div>
							<input type="file" name="userImage"
								onchange="document.getElementById('userImage').src = window.URL.createObjectURL(this.files[0])"
								accept="image/*">
						</div>
					</div>
					
					<div class="form-group">
						<!-- �μ��ڵ� -->
						<label class="control-label col-sm-2" for="orgcode">�μ��ڵ�</label>
						<div class="col-sm-3">
							<select name="deptno" class="form-control" >
								<option value="d001">�λ���
								<option value="d002">�繫��
								<option value="d003">������
								<option value="d0031">��������
								<option value="d0032">Ajax��
								<option value="d004">��������
								<option value="d005">�ý���������
								<option value="d006">�ѹ���
								<option value="dg001">�濵��������
								<option value="dg002">��������
								<option value="dg003">IT��������
								<option value="d007">������
								<option value="d008">��ȹ��
								<option value="d009">����1��
								<option value="d010">�����������
								<option value="d011">����2��
								<option value="d012">�����ý�
								
							</select>
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
								placeholder="�н�����" class="form-control" minlength="15" >

						</div>
					</div>
					<div class="form-group">
						<!-- �ֹι�ȣ-->
						<label class="control-label col-sm-2" for="ssn">�ֹι�ȣ</label>
						<div class="col-sm-3">
							<input type="text" id="ssn" name="ssn"
								placeholder="�ֹι�ȣ" class="form-control" 
								minlength="15" >

						</div>
					</div>
					<div class="form-group">
						<!-- ����-->
						<label class="control-label col-sm-2" for="birthday">�������</label>
						<div class="col-sm-3">
							<input type="text" id="birthday" name="birthday"
								placeholder="�������" class="form-control" 
								minlength="15" >

						</div>
					</div>
					<div class="form-group">
						<!-- ��ȥ����-->
						<label class="control-label col-sm-2" for="marry">��ȥ����</label>
						<div class="col-sm-3">
							<input type="checkbox" id="marry" name="marry"
								placeholder="��ȥ����"	minlength="15" >��ȥ����

						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">�����ȣ</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="zipcode"
								id="zipcode" readonly="readonly">
						</div>
						<div class="col-sm-2">
							<button type="button"
								class="btn btn-round btn-primary form-control">�����ȣ �˻�</button>
						</div>
					</div>
					<div class="form-group">
						<!-- �ּ�-->
						<label class="control-label col-sm-2" for="addr">�ּ�</label>
						<div class="col-sm-6">
							<input type="text" id="addr" name="addr" 
							placeholder="�ּ�"
								class="form-control" minlength="4" required>
							
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label"></label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="detailaddr"
								id="detailaddr" readonly="readonly">
						</div>
					
					</div>
					<div class="form-group">
						<!-- ����ȭ-->
						<label class="control-label col-sm-2" for="phonehome">����ȭ</label>
						<div class="col-sm-5">
							<input type="text" id="phonehome" name="phonehome" 
							placeholder="����ȭ"
								class="form-control" minlength="15" required>

						</div>
					</div>
					<div class="form-group">
						<!-- ȸ����ȭ-->
						<label class="control-label col-sm-2" for="phoneco">ȸ����ȭ</label>
						<div class="col-sm-5">
							<input type="text" id="phoneco" name="phoneco" 
							placeholder="ȸ����ȭ"
								class="form-control" minlength="15" required>

						</div>
					</div>
					<div class="form-group">
						<!-- ����ȭ-->
						<label class="control-label col-sm-2" for="phonehome">�ڵ�����ȣ</label>
						<div class="col-sm-5">
							<input type="text" id="phonecell" name="phonecell" 
							placeholder="�ڵ�����ȣ"
								class="form-control" minlength="15" required>

						</div>
					</div>
					<div class="form-group">
						<!-- ���-->
						<label class="control-label col-sm-2" for="grade">�̸���</label>
						<div class="col-sm-3">
							<input type="text" id="email" name="email" 
							placeholder="�̸���"
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
	<div><a href="/serverweb/emp/list.do">ȸ����Ϻ���</a></div>
</body>
</html>