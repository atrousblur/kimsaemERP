package erp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import erp.dto.EmpDTO;
import erp.service.EmpService;
import erp.service.EmpServiceImpl;

public class EmpListServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		// 1. ����Ͻ� �޼ҵ� ȣ��
		EmpService service = new EmpServiceImpl();
		ArrayList<EmpDTO> empList= service.getMemberList();
		
		// 2. ������ ����
		req.setAttribute("empList", empList);
		
		// 3. ��û������ - forward
		RequestDispatcher rd = req.getRequestDispatcher("/emp/list.jsp");
		rd.forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}

