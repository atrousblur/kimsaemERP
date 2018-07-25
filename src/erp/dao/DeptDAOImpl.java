package erp.dao;

import static fw.DBUtil.close;
import static query.EmpQuery.LIST;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import erp.dto.DeptDTO;
import erp.dto.LoginDTO;

public class DeptDAOImpl implements DeptDAO {

	@Override
	public ArrayList<DeptDTO> getMemberList(Connection con) throws SQLException {
		ArrayList<DeptDTO> deptlist = new ArrayList<DeptDTO>();
		DeptDTO dept = null;
		PreparedStatement ptmt = con.prepareStatement(LIST);
		ResultSet rs = ptmt.executeQuery();
		System.out.println("daoȣ��");
		while (rs.next()) {
			dept = new DeptDTO(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getDate(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
			deptlist.add(dept);
		}
		close(rs);
		close(ptmt);
		return deptlist;
	}
}