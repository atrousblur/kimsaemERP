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
							
						</div>
					</div>
					
					<div class="form-group">
						<!-- �μ��ڵ� -->
						<label class="control-label col-sm-2" for="orgcode">�μ��ڵ�</label>
						<div class="col-sm-3">
							<!-- ���⿡ �μ��ڵ带 ����ϼ���  -->
						</div>
					</div>
		
					
					
					<div class="form-group">
						<!-- ����-->
						<label class="control-label col-sm-2" for="orgname">����</label>
						<div class="col-sm-3">
							<!-- ���⿡ �μ��ڵ带 ����ϼ���  -->
						</div>
					</div>
					<div class="form-group">
						<!-- ���-->
						<label class="control-label col-sm-2" for="id">���</label>
						<div class="col-sm-3">
							<!-- ���⿡ ����� ����ϼ���  -->
							
						</div>
						<span id="checkVal"></span>
					</div>
				
					<div class="form-group">
						<!-- �ֹι�ȣ-->
						<label class="control-label col-sm-2" for="ssn">�ֹι�ȣ</label>
						<div class="col-sm-3">
							<!-- ���⿡ �ֹι�ȣ�� ����ϼ���  -->
						</div>
					</div>
					<div class="form-group">
						<!-- ����-->
						<label class="control-label col-sm-2" for="birthday">�������</label>
						<div class="col-sm-3">
							<!-- ���⿡ ������ ����ϼ���  -->

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
						<!-- ����-->
						<label class="control-label col-sm-2" for="pass">�н�����</label>
						<input type="radio" id="marry" name="marry"
								placeholder="��ȥ����"	minlength="15" >����
						<input type="radio" id="marry" name="marry"
								placeholder="��ȥ����"	minlength="15" >����
					</div>
					<div class="form-group">
						<!-- ����-->
						<label class="control-label col-sm-2" for="birthday">����</label>
						<div class="col-sm-3">
							<!-- ���⿡ ���� ����ϼ���  -->

						</div>
					</div>
					<div class="form-group">
						<!-- ��å-->
						<label class="control-label col-sm-2" for="birthday">��å</label>
						<div class="col-sm-3">
							<!-- ���⿡ ��å ����ϼ���  -->

						</div>
					</div>
					<div class="form-group">
						<!-- ����-->
						<label class="control-label col-sm-2" for="birthday">����</label>
						<div class="col-sm-3">
							<!-- ���⿡ ��å ����ϼ���  -->

						</div>
					</div>
					<div class="form-group">
						<!-- �Ի�����-->
						<label class="control-label col-sm-2" for="birthday">�Ի�����</label>
						<div class="col-sm-3">
							<!-- ���⿡ �Ի������� ����ϼ���  -->

						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">������ȣ</label>
						<div class="col-sm-3">
							<!-- ������ȣ������ ����ϼ���-->
						</div>
						
					</div>
					<div class="form-group">
						<!-- �ּ�-->
						<label class="control-label col-sm-2" for="addr">�ּ�</label>
						<div class="col-sm-6">
							<!-- �ּҸ� ��Ÿ������ -->
							
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label"></label>
						<div class="col-sm-5">
							<!-- �ּҸ� ��Ÿ������ -->
							
						</div>
					
					</div>
					<div class="form-group">
						<!-- ����ȭ-->
						<label class="control-label col-sm-2" for="phonehome">����ȭ</label>
						<div class="col-sm-5">
							<!-- ����ȭ�� ����ϼ��� -->

						</div>
					</div>
					<div class="form-group">
						<!-- ȸ����ȭ-->
						<label class="control-label col-sm-2" for="phonehome">ȸ����ȭ</label>
						<div class="col-sm-5">
							<!-- ȸ����ȭ�� ����ϼ��� -->
						</div>
					</div>
					<div class="form-group">
						<!-- �ڵ�����ȣ-->
						<label class="control-label col-sm-2" for="phonehome">�ڵ�����ȣ</label>
						<div class="col-sm-5">
							<!-- �ڵ�����ȣ�� ����ϼ��� -->
						</div>
					</div>
					<div class="form-group">
						<!-- �̸���-->
						<label class="control-label col-sm-2" for="email">�̸���</label>
						<div class="col-sm-3">
							<!-- �̸����� ����ϼ��� -->

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