package emp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import emp.dto.EmpDTO;
import emp.service.EmpService;
import emp.service.EmpServiceImpl;

@WebServlet(name = "login", urlPatterns = ("/login.do"))
public class LoginServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		
		//1.��û ���� ����
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		//�߰�
		String check = req.getParameter("member_id_save");
		
		System.out.println("id :" + id);
		System.out.println("pass :" + pass);
		
		//2. ����Ͻ� �޼ҵ�ȣ��
		EmpService service = new EmpServiceImpl();
		EmpDTO loginUser = service.login(id, pass);
		
		//�α��� �����ϸ� ��Ű�� ����
		//-> ���̵� ������ üũ�� ���·� �α��� ��ư�� �������� �α����� �����ϸ�
		//���̵� ��Ű�� �����ϱ�
		if(check!=null){
			if(check.equals("T") & loginUser != null){						//�α��� ������ null �ƴϸ�
				Cookie cookie = new Cookie("id", loginUser.getEmp_id());	//DB�� �ѹ� ������ ���ǹ�
				cookie.setMaxAge(60*60*24);
				res.addCookie(cookie);
			}
		}
		//login.jsp�� �ۼ�����

		//3. ������ ����
		req.setAttribute("loginUser", loginUser);
		
		
		
		//�α��� �����ϸ� ������ �����ϰ� ���ǿ� �α��� ������ ������ �߰��Ѵ�.
		//4. ��û������
		//�߰�(������, ���н�)
		String url="";
		if(loginUser!=null){	//�α��μ���
			HttpSession ses = req.getSession();
					ses.setAttribute("loginUser", loginUser);
		}else{					//���н�
			url = "/emp/login.jsp";
		}
		
		
		RequestDispatcher rd = req.getRequestDispatcher(url);
		
		rd.forward(req, res);
	}
}
