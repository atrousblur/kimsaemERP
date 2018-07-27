package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter{
	//���ڵ��� ������ ���ڵ�Ÿ�� - web.xml�� ���ǵ� param-value�� �о�ͼ� ����
	String encoding;
	@Override
	public void init(FilterConfig config) throws ServletException {
		//web.xml�� ������  param�� �д� ����� FilterConfig��ü�� �޼ҵ带 ���ؼ� ����
		
		encoding = config.getInitParameter("encoding");
		System.out.println("������ init():"+encoding);
		
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, 
			ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		//���������� ���ؼ� ���ڵ�Ÿ���� ������ �� �ֵ��� ����
		req.setCharacterEncoding(encoding);
		chain.doFilter(req, res);
			
	}

	

}
