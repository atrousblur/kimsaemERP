package erp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import erp.dto.EmpDTO;
import erp.dto.MemberDTO;
import erp.service.EmpService;
import erp.service.EmpServiceImpl;

@WebServlet(name = "insert", urlPatterns = { "/insert.do" })
public class EmpInsertServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		req.setCharacterEncoding("euc-kr");
		System.out.println("������û����");
		
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
		// marry�� ���� ó��
		if(marry==null){ // üũ�ڽ��� �������� ���� ��ȥ�̶�� �ǹ�
			marry = "0";
		}
		// ��¥ �����͸� Date�� ó���ϴ� ��� - �Է������� ��¥ �����Ϳ� �°� �Է¹��� �� �ֵ��� view���� ����
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		long mydate = 0;
		
		try {
			mydate = sdf.parse(birthday).getTime();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 2. �����Ͻ� �޼ҵ� ȣ��
		EmpService service = new EmpServiceImpl();
		MemberDTO user = new MemberDTO(id, pass, name, ssn, new Date(mydate), marry, deptno, zipcode, addr, detailaddr, phonehome, phoneco, phonecell, email);
		
		System.out.println(user);
		int result = service.insert(user);
		
		// 3. ������ ����
		String msg = "";
		if(result>=1){
			msg = result + "�� �� ���� ����";
		}else{
			msg = "���Խ���";
		}
	
		req.setAttribute("msg", msg);
		
		// 4. ��û������ - forward
		res.sendRedirect("/kimsaemERP/emp/emp_list.jsp");
		
		// RequestDispatcher rd = req.getRequestDispatcher("/emp/insertResult.jsp");
		// rd.forward(req, res);
	}
}