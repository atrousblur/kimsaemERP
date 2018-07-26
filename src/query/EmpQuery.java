
package query;
public class EmpQuery {
	public static String FIND_DEPTNO_EMPLIST=
				"select * from member where deptno=?";
	public static String IDCHECK =
				"select * from member where id=?";
	public static String EMP_INSERT =
			"insert into member values(?,?,?,?,?,?,?,'���','���','5��23ȣ',sysdate,null,?,'����',?,?,?,?,?,?,?,'myphoto.jpg')";
	public static String EMP_LIST =
			"select m.*,d.deptname from member m, dept d "
			+"where m.deptno = d.deptno ";
	public static String EMP_DELETE = "delete kitriemp where id=?";
	public static String EMP_READ
			= "select * from member where id = ?";
	/*public static String LOGIN =
			"select * from kitriemp where id=? and pass=?";*/
	public static String LOGIN
		= "select m.*,d.deptname,j.job_category,j.menupath "
		  +"from member m, dept d, job j "
		  +"where m.deptno = d.deptno "
		  +"and d.job_category = j.job_id "
		  +"and id = ? and pass= ?";
	
	public static String EMP_UPDATE
		= "update kitriemp "
		 + "set addr = ?, point = ? , grade = ? "
		 + "where id = ? ";
	
	public static String EMP_SEARCH1 
		= "select * from kitriemp where name like ?";
	public static String EMP_SEARCH2 
		= "select * from kitriemp where addr like ?";
	public static String EMP_SEARCH3 
		= "select * from kitriemp where id like ?";
}
