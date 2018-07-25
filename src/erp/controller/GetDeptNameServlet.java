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
		//�����Ͻ� �޼ҵ� ȣ��
		DeptService service = new DeptServiceImpl();
		ArrayList<DeptDTO> deptnamelist = service.getDeptName();
		
		System.out.println("����"+deptnamelist);
		//�����Ͱ���
		request.setAttribute("deptnamelist", deptnamelist);
		request.setAttribute("menupath", "/menu/insa_menu.jsp");
		request.setAttribute("viewpath", "/emp/register.jsp");
		//��û������
		RequestDispatcher rd = 
			request.getRequestDispatcher("/template/mainLayout.jsp");
		rd.forward(request, response);
	}
}
