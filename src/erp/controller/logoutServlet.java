package erp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "logout", urlPatterns = { "/logout.do" })
public class logoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//������μ����� �޾ƿ��� - false�� �Ű������� �����ϸ� (������ ���θ���)
		// ������ ����ϴ� ������ ������ ���ǰ�ü�� �����ϰ� ������ Null�� �����Ѵ�.
		
		HttpSession ses = request.getSession(false);
		if(ses != null){
			//������ �����Ѵ�.
			ses.invalidate();
		}
		response.sendRedirect("/kimsaemERP/index.jsp");
	}

}
