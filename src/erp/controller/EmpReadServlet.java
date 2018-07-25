package erp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import erp.dto.EmpDTO;
import erp.dto.LoginDTO;
import erp.dto.MemberDTO;
import erp.service.EmpService;
import erp.service.EmpServiceImpl;

@WebServlet(name = "read", urlPatterns = { "/read.do" })
public class EmpReadServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		req.setCharacterEncoding("euc-kr");
		System.out.println("������û����");

		// 1. ��û���� ����
		String id = req.getParameter("id");
		
		// 2. �����Ͻ� �޼ҵ� ȣ��
		EmpService service = new EmpServiceImpl();
		MemberDTO user = service.read(id);

		// 3. �����Ͱ���
		req.setAttribute("user", user);
		
		String menupath = "/menu/insa_menu.jsp";
		String viewpath = "/emp/emp_read.jsp";
	
		req.setAttribute("menupath",  menupath);
		req.setAttribute("viewpath", viewpath);
		
		// 4. ��û������
		RequestDispatcher rd = req.getRequestDispatcher("/template/mainLayout.jsp");
		rd.forward(req, res);
	}
}