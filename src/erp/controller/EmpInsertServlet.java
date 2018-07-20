package erp.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import erp.dto.MemberDTO;
import erp.service.EmpService;
import erp.service.EmpServiceImpl;

@WebServlet(name = "emp/insert", urlPatterns = { "/emp/insert.do" })
public class EmpInsertServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//System.out.println("���� ��û ����");

		req.setCharacterEncoding("euc-kr");

		// 1. Ŭ���̾�Ʈ�� ��û���� ����
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String birthday = req.getParameter("birthday");
		String ssn = req.getParameter("ssn");
		String marry = req.getParameter("marry");
		String gender = req.getParameter("gender");
		String deptno = req.getParameter("deptno");
		String zipcode = req.getParameter("zipcode");
		String addr = req.getParameter("addr");
		String detailaddr = req.getParameter("detailaddr");
		String phonehome = req.getParameter("phonehome");
		String phoneco = req.getParameter("phoneco");
		String phonecell = req.getParameter("phonecell");
		String email = req.getParameter("email");
		//marry�� ���� ó��
		if(marry==null){ //üũ�ڽ��� �������� ���� ��ȥ�̶�� �ǹ�
			marry = "0";
		}
		//��¥ �����͸� Date�� ó���ϴ� ��� - �Է������� ��¥ �����Ϳ� �°� �Է¹��� �� �ֵ��� view���� ����
		//String ��¥�� java.sql.DateŸ������ ��ȯ
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		long mydate=0;
		try {
			mydate = sdf.parse(birthday).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// 2. �����Ͻ� �޼ҵ� ȣ��
		EmpService service = new EmpServiceImpl();
		MemberDTO user = new MemberDTO(id, pass, name, ssn, new Date(mydate), marry, deptno, zipcode, addr, detailaddr,
				phonehome, phoneco, phonecell, email);
		int result = service.insert(user);

		// 3. ��û������
		res.sendRedirect("/kimsaemERP/emp/list.do");
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
