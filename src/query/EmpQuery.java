package query;

import java.sql.Date;

import erp.dao.EmpDAOImpl;

//sql�� ���Ŀ� XML���Ϸ� ������ ����.
public class EmpQuery {
	public static final String EMP_INSERT
		="insert into member values(?,?,?,?,?,?,?,'���','���','5��23ȣ',sysdate,null,?,'����',?,?,?,?,?,?,?,'myphoto.jpg')";
	
	public static final String EMP_LIST
					="select m.id, m.name, m.duty, m.phoneco, d.deptname from member m, dept d where m.deptno=d.deptno";

	public static final String EMP_DELETE
					="delete kitriemp where id=?";
	public static final String EMP_READ
					="select * from kitriemp where id=?";
	
	public static final String EMP_SEARCH1
					="select * from kitriemp where name like ?";
	public static final String EMP_SEARCH2
					="select * from kitriemp where addr like ?";
	public static final String EMP_SEARCH3
					="select * from kitriemp where id like ?";
	
	public static final String EMP_UPDATE
					="update kitriemp set addr=?, grade=?, point=? where id=?";
	
	public static final String LOGIN
					="select m.*,j.job_category,j.menupath "
					+ "from member m, dept d, job j "
					+ "where m.deptno=d.deptno and d.job_category=j.job_id "
					+ "and id=? and pass=?";

}
