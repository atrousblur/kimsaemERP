package erp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import erp.dto.MemberDTO;
import erp.service.EmpService;
import erp.service.EmpServiceImpl;

@WebServlet(name = "ajaxEmpInfo", urlPatterns = { "/ajaxEmpInfo" })
public class GetEmpInfoServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) 
					throws ServletException, IOException {
		String id = request.getParameter("id");
		EmpService service = new EmpServiceImpl();
		MemberDTO emp =  service.read(id);
		
		//db로 조회한 데이터를 json으로 변환하는 작업
		JSONObject empjson = new JSONObject();//{}
		empjson.put("id", emp.getId());
	    empjson.put("pass", emp.getPass());
	    empjson.put("name", emp.getName());
	    empjson.put("ssn", emp.getSsn());
	    empjson.put("birthday", emp.getBirthday().toString());
	    empjson.put("position", emp.getPosition());
	    empjson.put("duty", emp.getDuty());
	    empjson.put("classes", emp.getClasses());
	    empjson.put("startday", emp.getStartday().toString());
	    empjson.put("endday",null);
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
	    
		response.setContentType("application/json;charset=euc-kr");
		response.setHeader("cache-control", "no-cache,no-store");
		PrintWriter pw = response.getWriter();
		System.out.println(empjson.toJSONString());
		pw.print(empjson.toJSONString());
		
	}

}
