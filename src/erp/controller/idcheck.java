package erp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import erp.service.EmpService;
import erp.service.EmpServiceImpl;

@WebServlet(name = "emp/idcheck", urlPatterns = { "/emp/idcheck.do" })
public class idcheck extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		System.out.println("������û����");
		
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache,no-store");
		PrintWriter pw = response.getWriter();
		String id = request.getParameter("id");
		
		EmpService service = new EmpServiceImpl();
		boolean result = service.idCheck(id);
		String msg = "";
		if(result==true){
			msg = "��밡�ɾ��̵�";
		}else{
			msg = "���Ұ��ɾ��̵�";
		}
		pw.println(msg);
	}
}
