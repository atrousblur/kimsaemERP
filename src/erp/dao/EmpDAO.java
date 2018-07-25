package erp.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import erp.dto.EmpDTO;
import erp.dto.LoginDTO;
import erp.dto.MemberDTO;

import java.sql.Connection;

public interface EmpDAO {
	
	int insert(MemberDTO emp, Connection con) throws SQLException;				// ������
	
	// ArrayList<EmpDTO> getMemberList(Connection con) throws SQLException;	
	ArrayList<LoginDTO> getMemberList(Connection con) throws SQLException;	// ���������
	
	int delete(String id, Connection con) throws SQLException;				// �������
	
	// EmpDTO read(String id, Connection con) throws SQLException;				// �����ȸ
	MemberDTO read(String id, Connection con) throws SQLException;
	
	ArrayList<EmpDTO> search(String column, String search, String pass, Connection con)	
									throws SQLException;					// ����˻� 
	
	int update(EmpDTO user, Connection con) throws SQLException;			// �������
	
	LoginDTO login(String id, String pass, Connection con) throws SQLException;	// �α���
	
	boolean idCheck(String id,Connection con) throws SQLException;	// ���̵� �ߺ�Ȯ��

}
