package erp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import erp.dto.LoginDTO;
import erp.service.EmpService;
import erp.service.EmpServiceImpl;

@WebServlet(name = "login", urlPatterns = { "/login.do" })
public class LoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		//1. ��û���� ����
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String check = request.getParameter("member_id_save");
		
		//2. �����Ͻ��޼ҵ�ȣ��
		EmpService service = new EmpServiceImpl();
		LoginDTO loginUser = service.login(id, pass);
		
		//�α��� �����ϸ� ��Ű�� ����
		//-> ���̵� ������ üũ�� ���·� �α��� ��ư�� �������� �α����� �����ϸ� ���̵� ��Ű�� �����ϱ�
		if(check!=null){
			if(check.equals("T") & loginUser!=null){
				Cookie cookie = new Cookie("id", loginUser.getId());
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
			}
		}
		
		//�α��� �����ϸ� ������ �����ϰ� ���ǿ� �α��� ������ ������ �߰��Ѵ�.
		//4. ��û������
		String menupath = "";
		String viewpath = "";
		if(loginUser!=null){//�α��μ���
			menupath = loginUser.getMenupath();
			viewpath = "/emp/mypage.jsp";
			HttpSession ses = request.getSession();
			ses.setAttribute("loginUser", loginUser);
		}else{//�α��ν���
			menupath = "/menu/pub_menu.jsp";
			viewpath = "/emp/login.jsp";
		}
		request.setAttribute("menupath", menupath);
		request.setAttribute("viewpath", viewpath);
		RequestDispatcher rd = request.getRequestDispatcher("/template/mainLayout.jsp");
		rd.forward(request, response);

	}
}
