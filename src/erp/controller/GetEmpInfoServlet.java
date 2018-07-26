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
@WebServlet(name = "empinfo", urlPatterns = { "/empinfo" })
public class GetEmpInfoServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("������û����");
		
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache,no-store");
		
		String id = request.getParameter("id");
		System.out.println("��� : "+id);
		EmpService service = new EmpServiceImpl();
		MemberDTO user = service.readNew(id);
		
		JSONObject empjson = new JSONObject();
		
		empjson.put("id", user.getId());
		empjson.put("pass", user.getPass());
		empjson.put("name", user.getName());
		empjson.put("ssn", user.getSsn());
		empjson.put("birthday", user.getBirthday().toString());
		empjson.put("position", user.getPosition());
		empjson.put("duty", user.getDuty());
		empjson.put("classes", user.getClasses());
		empjson.put("startday", user.getStartday().toString());
		empjson.put("endday", null);
		empjson.put("deptno", user.getDeptno());
		empjson.put("curstate", user.getCurstate());
		empjson.put("zipcode", user.getZipcode());
		empjson.put("addr", user.getAddr());
		empjson.put("detailaddr", user.getDetailaddr());
		empjson.put("phonehome", user.getPhonehome());
		empjson.put("phoneco", user.getPhoneco());
		empjson.put("phonecell", user.getPhonecell());
		empjson.put("email", user.getEmail());
		empjson.put("profile_photo", user.getProfile_photo());
		empjson.put("deptname", user.getDeptname());
		
		System.out.println(empjson.toJSONString());
		
		response.setContentType("application/json;charset=euc-kr");
		response.setHeader("cache-control", "no-cache,no-store");
		
		PrintWriter pw = response.getWriter();
		pw.println(empjson.toJSONString());
	}
}
		