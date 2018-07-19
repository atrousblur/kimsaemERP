package fw;
/*
 * �����۸�ũ�� Ŭ���ؼ� �並 ��Ÿ�� �� ȣ��� ����
 * ���� ���ο��� mainLayout.jsp�� forward�Ǹ�
 * ���ð� ���� ���������� left�޴� �κп� ����� view�� ������ ������ �κп� 
 * ����� view�� ������ �Ѱ��ִ� ����
 * ������ .properties�����̳� xml�� ���� ���� ���Ͽ� view�� ���� ������ ����ϰ� �Ľ��ؼ� 
 * ������ �����;������� Ŭ���� �� �Ķ���ͷ� �信 ���� ������ �ѱ��.
 * ���ʿ� ����� �信 ���� ������ menupath��� �Ķ���ͷ� �ѱ��.
 * �����ʿ� ����� �信 ���� ������ viewpath��� �Ķ���ͷ� �ѱ��.
 */
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "view", urlPatterns = { "/view.html" })
public class ViewTemplateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String menupath = request.getParameter("menupath");
		String viewpath = request.getParameter("viewpath");
		
		request.setAttribute("menupath", menupath);
		request.setAttribute("viewpath", viewpath);
		RequestDispatcher rd = request.getRequestDispatcher("/template/mainLayout.jsp");
		rd.forward(request, response);
	}
}
