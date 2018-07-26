package erp.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import erp.dto.DeptDTO;
import erp.service.DeptService;
import erp.service.DeptServiceImpl;

@WebServlet(name = "getname", urlPatterns = { "/getname.do" })
public class GetDeptNameServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		System.out.println("������û����");
		String action = request.getParameter("action");
		String viewpath = "";
		if(action.equals("register")){
			viewpath="/emp/register.jsp";
		}else if(action.equals("tree")){
			viewpath="/dept/tree.jsp";
		}else if(action.equals("org")){
			viewpath="/dept/realtree.jsp";
		}
		//�����Ͻ� �޼ҵ� ȣ��
		DeptService service = new DeptServiceImpl();
		ArrayList<DeptDTO> deptnamelist = service.getDeptName();
		
		System.out.println("����"+deptnamelist);
		//�����Ͱ���
		request.setAttribute("deptnamelist", deptnamelist);
		request.setAttribute("menupath", "/menu/insa_menu.jsp");
		request.setAttribute("viewpath", viewpath);
		//��û������
		RequestDispatcher rd = 
			request.getRequestDispatcher("/template/mainLayout.jsp");
		rd.forward(request, response);
	}
}
