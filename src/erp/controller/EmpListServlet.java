package erp.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import erp.dto.DeptDTO;
import erp.service.EmpService;
import erp.service.EmpServiceImpl;

@WebServlet(name = "emp/list", urlPatterns={"/emp/list.do"})
public class EmpListServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		//System.out.println("���� ��û ����");
		req.setCharacterEncoding("euc-kr");
		
		//�����Ͻ� �޼ҵ� ȣ��
		EmpService service = new EmpServiceImpl();
		ArrayList<DeptDTO> userlist= service.getMemberList();
		
		//�����Ͱ���
		String menupath = "";
		String viewpath = "";
	
		menupath = "/menu/insa_menu.jsp";
		viewpath = "/emp/emp_list.jsp";
		
		req.setAttribute("userlist", userlist);
		req.setAttribute("menupath", menupath);
		req.setAttribute("viewpath", viewpath);
		
		RequestDispatcher rd = req.getRequestDispatcher("/template/mainLayout.jsp");
		rd.forward(req, res);
	}
	
	//doPost source���� �������̵�����
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
