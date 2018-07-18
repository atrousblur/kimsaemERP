package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "logout", urlPatterns = { "/logout.do" })
public class logoutServler extends HttpServlet {

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//������� ������ �޾ƿ��� - false�� �Ű������� �����ϸ� ������ ����ϴ� ������ ������ 
		//���ǰ�ü�� �����ϰ� ������ null�� �����Ѵ�.
		HttpSession ses= request.getSession(false);
		if(ses!=null){
			//������ �����Ѵ�.
			ses.invalidate();
		}
		response.sendRedirect("/kimsaemERP/index.jsp");
	}

}
