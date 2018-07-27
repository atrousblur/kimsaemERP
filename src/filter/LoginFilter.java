package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import erp.dto.MemberDTO;
// ... /emp/*�� ��û�Ǵ� ���  ���񽺴� �α����� ���� �ʾ��� ��� �α����������� forward�ϵ��� �۾�
public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, 
			ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpReq = (HttpServletRequest)req;
		HttpSession ses = httpReq.getSession(false);
		
		MemberDTO loginUser = null;
		//session���� loginUser�� �����ؼ� MemberDTO�� null�̸� �α����������� forward
		//null�� �ƴϸ� ���� filter�� �������� ��û�� �ѱ��.
		String menupath = "";
		String viewpath = "";
		if(ses!=null){
			loginUser = (MemberDTO)ses.getAttribute("loginUser");
			if(loginUser==null){//�α��� ���°� �ƴ�
				menupath = "/menu/pub_menu.jsp";
				viewpath = "/emp/login.jsp";
				httpReq.setAttribute("menupath", menupath);
				httpReq.setAttribute("viewpath", viewpath);
				RequestDispatcher rd = 
			httpReq.getRequestDispatcher("/template/mainLayout.jsp");
				rd.forward(req, res);
			}else{
				chain.doFilter(req, res);
			}
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
