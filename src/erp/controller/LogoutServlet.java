package erp.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import erp.dto.EmpDTO;
import erp.service.EmpService;
import erp.service.EmpServiceImpl;

@WebServlet(name = "logout", urlPatterns = { "/logout.do" })
public class LogoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("������û����");

		// ������� ������ �޾ƿ��� - false�� �Ű������� �����ϸ� ������ ����ϴ� ������ ������ ���ǰ�ü�� �����ϰ� ������ null�� �����Ѵ�.
		HttpSession ses = request.getSession(false);
		if(ses!=null){
			// ������ �����Ѵ�.
			ses.invalidate();
		}
		response.sendRedirect("/kimsaemERP/index.jsp");
	}
}

				