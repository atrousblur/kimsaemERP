package erp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import erp.dto.EmpDTO;
import erp.dto.MemberDTO;
import erp.service.EmpService;
import erp.service.EmpServiceImpl;

@WebServlet(name = "emp/read", urlPatterns={"/emp/read.do"})
public class EmpReadServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		//System.out.println("���� ��û ����");
		request.setCharacterEncoding("euc-kr");
		
		//1. ��û���� ����
		String id = request.getParameter("id");
		String action = request.getParameter("action");
		
		String menupath = "";
		String viewpath = "";
		
		menupath = "/menu/insa_menu.jsp";
		if(action.equals("UPDATE")){
			viewpath = "/emp/emp_update.jsp";
		}else if(action.equals("READ")){
			viewpath = "/emp/emp_read.jsp";
		}
		
		//2. �����Ͻ��޼ҵ� ȣ��
		EmpService service = new EmpServiceImpl();
		MemberDTO user = service.read(id);

		//3. ������ ����
		request.setAttribute("user", user);
		request.setAttribute("menupath", menupath);
		request.setAttribute("viewpath", viewpath);
		
		//4. ��û������
		RequestDispatcher rd = request.getRequestDispatcher("/template/mainLayout.jsp");
		rd.forward(request, response);
		
		
	}
}
