package erp.controller;

import java.io.FileReader;
import java.io.FileWriter;
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
import org.json.simple.parser.JSONParser;

import erp.dto.MemberDTO;
import erp.service.EmpService;
import erp.service.EmpServiceImpl;
/*
 * ajax��û�� �� ���޵Ǵ� �μ���ȣ�� �޾Ƽ� �ش� �μ��� �ٹ��ϴ� ���������� ��ȸ�Ѵ�.
 * ��ȸ�� ������ jsp�� response�� �� �񵿱�� ó���� ��û�̹Ƿ� forward�� �� �� ���� 
 * ��ȸ�� ������ json���� ��ȯ�ؼ� response�ؾ� �Ѵ�.
*/
@WebServlet(name = "treedata", urlPatterns = { "/ajaxtreedata" })
public class GetTreeEmpListServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("������û����");
		
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache,no-store");
		
		String deptno = request.getParameter("deptno");
		System.out.println("�μ���ȣ : "+deptno);
		EmpService service = new EmpServiceImpl();
		ArrayList<MemberDTO> emplist = service.getTreeEmpList(deptno);
		
		// DB�� ��ȸ�� �����͸� json���� ��ȯ�ϴ� �۾�
		JSONObject emproot = new JSONObject();
		JSONArray empjsonlist = new JSONArray();
		int size = emplist.size();
		
		// DB���� ��ȸ�� ���ڵ��� ������ŭ for���� �����鼭 �۾�
		for(int i=0;i<size;i++){

			// ArrayList���� �ϳ� ���� MemberDTO��  SONObject�� ��ȯ
			MemberDTO emp = emplist.get(i);		// DB���� ���� ��
			JSONObject empjson  =new JSONObject();	// ���� ������� ��ü
			
			// empjson�� db���� ���� emp�� �������� put���Ѿ� �Ѵ�.
			empjson.put("id", emp.getId());
			empjson.put("pass", emp.getPass());
			empjson.put("name", emp.getName());
			empjson.put("ssn", emp.getSsn());
			empjson.put("birthday", emp.getBirthday().toString());	// date�� toString�� ���������� json�������� �������
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
			empjson.put("deptname", emp.getDeptname());
			
			// DB ���ڵ� -> DTO�� ��ȯ -> JSONObject�� ��ȯ
			empjsonlist.add(empjson);
		}
		
		// ��ȯ�� JSONArray�� ���������� root�� JSONObject�� �߰��Ѵ�.
		emproot.put("emplist", empjsonlist);
		System.out.println(emproot.toJSONString());
		
		// Ajax�� ��û�� �� ó���ؾ� �ϴ� �۾�
		response.setContentType("application/json;charset=euc-kr");
		response.setHeader("cache-control", "no-cache,no-store");
		
		PrintWriter pw = response.getWriter();
		pw.println(emproot.toJSONString());
	}
	
	// Servlet�� Test
/*	public static void main(String[] args){
		EmpService service = new EmpServiceImpl();
		ArrayList<MemberDTO> emplist = service.getTreeEmpList("d001");
		
		// DB�� ��ȸ�� �����͸� json���� ��ȯ�ϴ� �۾�
		JSONObject emproot = new JSONObject();
		JSONArray empjsonlist = new JSONArray();
		int size = emplist.size();
		
		// DB���� ��ȸ�� ���ڵ��� ������ŭ for���� �����鼭 �۾�
		for(int i=0;i<size;i++){

			// ArrayList���� �ϳ� ���� MemberDTO��  SONObject�� ��ȯ
			MemberDTO emp = emplist.get(i);		// DB���� ���� ��
			JSONObject empjson  =new JSONObject();	// ���� ������� ��ü
			
			// empjson�� db���� ���� emp�� �������� put���Ѿ� �Ѵ�.
			empjson.put("id", emp.getId());
			empjson.put("pass", emp.getPass());
			empjson.put("name", emp.getName());
			empjson.put("ssn", emp.getSsn());
			empjson.put("birthday", emp.getBirthday().toString());	// date�� toString�� ���������� json�������� �������
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
			empjson.put("deptname", emp.getDeptname());
			
			// DB ���ڵ� -> DTO�� ��ȯ -> JSONObject�� ��ȯ
			empjsonlist.add(empjson);
		}
		
		// ��ȯ�� JSONArray�� ���������� root�� JSONObject�� �߰��Ѵ�.
		emproot.put("emplist", empjsonlist);
		System.out.println(emproot.toJSONString());
	}*/
}
		