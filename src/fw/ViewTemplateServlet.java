package fw;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "View", urlPatterns = { "/View.html" })
public class ViewTemplateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//jsp.menu���� �����°� �޾ƶ�
		String menupath = request.getParameter("menupath");
		String viewpath = request.getParameter("viewpath");
		System.out.println(menupath + " : " + viewpath);
		
		//���ø� �������� �����Ҷ��� ������ mainLayout.jsp�� forward
		//������ �ϱ��� ���ø� �������� ������ view�� ������ request�� ����
		request.setAttribute("menupath", menupath);
		request.setAttribute("viewpath", viewpath);
		
		RequestDispatcher rd = 
				request.getRequestDispatcher("/template/mainLayout.jsp");
		rd.forward(request, response);
	}
}
