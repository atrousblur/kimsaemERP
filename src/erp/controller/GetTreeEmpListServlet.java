package erp.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import erp.dto.MemberDTO;
import erp.service.EmpService;
import erp.service.EmpServiceImpl;

//ajax��û�ɶ� ���޵Ǵ� �μ���ȣ�� �޾Ƽ� �ش� �μ��� �ٹ��ϴ� ���������� ��ȸ�Ѵ�
//��ȸ�� ������ jsp�� response�� �� �񵿱�� ó���� ��û�̹Ƿ� forward�� �� ����
//��ȸ�� ������ json���� ��ȯ�ؼ� response�ؾ��Ѵ�.
@WebServlet(name = "treedata", urlPatterns = { "/ajaxtreedata" })
public class GetTreeEmpListServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");

		String deptno = request.getParameter("deptno");
		EmpService service = new EmpServiceImpl();
		ArrayList<MemberDTO> emplist = service.getTreeEmpList(deptno);
		// db�� ��ȸ�� �����͸� json���� ��ȯ�ϴ� �۾�
		JSONObject emproot = new JSONObject();
		JSONArray empjsonlist = new JSONArray();
		int size = emplist.size(); // db���� ��ȸ�� ���ڵ��� ������ŭ for���� �����鼭 �۾�
		for (int i = 0; i < size; i++) {
			//ArrayList���� �ϳ� ���� MemberDTO�� JSONObect�� ��ȯ
			MemberDTO emp = emplist.get(i); //db���� ������
			JSONObject empjson = new JSONObject(); //���θ��������ü
			//empjson�� db���� ���� emp�� �������� put���Ѿ� �Ѵ�.
			empjson.put("id", emp.getId());
			empjson.put("pass", emp.getPass());
			empjson.put("name", emp.getName());
			empjson.put("ssn", emp.getSsn());
			empjson.put("birthday", emp.getBirthday().toString());
			empjson.put("position", emp.getPosition());
			empjson.put("duty", emp.getDuty());
			empjson.put("classes", emp.getClasses());
			empjson.put("startday", emp.getStartday().toString());
			empjson.put("endday", null);
			empjson.put("deptno", emp.getDeptno());
			empjson.put("curstate", emp.getCurstate());
			empjson.put("zipcode", emp.getZipcode());
			empjson.put("addr", emp.getAddr());
			empjson.put("detailaddr", emp.getDetailaddr());
			empjson.put("phonehome", emp.getPhonehome());
			empjson.put("phoneco", emp.getPhoneco());
			empjson.put("phonecell", emp.getPhonecell());
			empjson.put("email", emp.getEmail());
			empjson.put("profile_photo", emp.getProfile_photo());
			//db���ڵ� ->dto��ȯ ->JSONObject�� ��ȯ
			empjsonlist.add(empjson);
		}
		//������ JSONArray�� ���������� root�� JSONObject�� �߰��Ѵ�.
		emproot.put("emplist", empjsonlist);
		//System.out.println(emproot.toJSONString());

		//Ajax�� ��û�� �� 
		response.setContentType("application/json");
		response.setHeader("cache-control", "no-cache,no-store");
		PrintWriter pw = response.getWriter();
		pw.print(emproot.toJSONString());
	}
}
