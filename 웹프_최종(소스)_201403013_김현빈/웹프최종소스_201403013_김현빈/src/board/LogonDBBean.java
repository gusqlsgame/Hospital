package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LogonDBBean {
	// static�� ����� ��ü�� �����ϸ� ��ü ���� ���� ��ü�� ��
	// ����, �� ��ü�� �� �ѹ��� �����ǰ� ��ü�� ���� ����
	private static LogonDBBean instance = new LogonDBBean();

	public static LogonDBBean getInstance() {
		return instance;
	}

	// Ŀ�ؼ� Ǯ���� Ŀ�ؼ� ��ü�� ���� �޼ҵ�
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		return ds.getConnection();
	}

	// user�α��� . ����� ���� ������
	public int userCheck(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
			conn = getConnection();
			String orgPass = passwd;
			pstmt = conn.prepareStatement("select mem_pwd from member where mem_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {// �ش� ���̵� ������ ����
				String dbpasswd = rs.getString("mem_pwd");
				if (dbpasswd.equals(orgPass))
					x = 1; // ��������
				else
					x = 0; // ��й�ȣ Ʋ��
			} else// �ش� ���̵� ������ ����
				x = -1;// ���̵� ����
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	// ���̵� �ߺ� Ȯ�� (confirm.jsp)���� ���̵��� �ߺ� ���θ� Ȯ���ϴ� �޼ҵ�
	public int confirm(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select mem_id from member where mem_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())// ���̵� ����
				x = 1; // ���� ���̵� ����
			else
				x = -1;// ���� ���̵� ����
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	// ȸ�� ���� ó��(registerPro.jsp)���� ����ϴ� �� ���ڵ� �߰� �޼ҵ�
	public int insertMember(LogonDataBean member) {
		Connection conn = null;
		Connection conn1 = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null;
		int result = 0;
		boolean x = false;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into member values (null,?,?,?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setTimestamp(3, member.getReg_date());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getTel());
			conn1 = getConnection();
			pstmt1 = conn1.prepareStatement("select *from member where mem_id = ? ");
			pstmt1.setString(1, member.getId());
			rs1 = pstmt1.executeQuery();

			if (rs1.next()) {// �ش� ���̵� ���� ���ڵ尡 ����
				String dbID = rs1.getString("mem_id");
				if (dbID.equals(member.getId())) {
					result = 2;
				}
			} else {
				pstmt.executeUpdate();
				result = 1;
				return result;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null || pstmt1 != null)
				try {
					pstmt.close();
					pstmt1.close();
				} catch (SQLException ex) {
				}
			if (conn != null || conn != null)
				try {
					conn.close();
					conn1.close();
				} catch (SQLException ex) {
				}
		}
		return result;
	}

	// ������(modifyForm.jsp)�� ���� ���� ���� ������ �������� �޼ҵ�

	public LogonDataBean getMember(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean member = null;
		try {
			conn = getConnection();
			String orgPass = passwd;
			pstmt = conn.prepareStatement("select * from member where mem_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {// �ش� ���̵� ���� ���ڵ尡 ����
				String dbpasswd = rs.getString("mem_pwd");
				// ����ڰ� �Է��� ��й�ȣ�� ���̺��� ��й�ȣ�� ������ ����
				if (dbpasswd.equals(orgPass)) {
					member = new LogonDataBean();// ����������� ��ü����
					member.setId(rs.getString("mem_id"));
					member.setName(rs.getString("mem_name"));
					member.setReg_date(rs.getTimestamp("reg_date"));
					member.setAddress(rs.getString("address"));
					member.setTel(rs.getString("tel"));
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return member;// ������ ����� ��ü member ����
	}

	// ȸ�� ���� ���� ó��(modifyPro.jsp)���� ȸ�� ���� ������ ó���ϴ� �޼ҵ�
	public int updateMember(LogonDataBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
			conn = getConnection();
			String orgPass = member.getPasswd();
			pstmt = conn.prepareStatement("select mem_pwd from member where mem_id = ?");
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {// �ش� ���̵� ������ ����
				pstmt = conn.prepareStatement("update member set mem_name=?, mem_pwd=?, address=?, tel=? " + "where mem_id=?");
				pstmt.setString(1, member.getName());
				pstmt.setString(2, orgPass);
				pstmt.setString(3, member.getAddress());
				pstmt.setString(4, member.getTel());
				pstmt.setString(5, member.getId());
				pstmt.executeUpdate();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	// ȸ�� Ż�� ó��(deletePro.jsp)���� ȸ�� ������ �����ϴ� �޼ҵ�
	public int deleteMember(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=-1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select mem_pwd from member where mem_id = ?");
			pstmt.setString(1, id);
			String orgPass = passwd;
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbpasswd = rs.getString("mem_pwd");
				
				if (dbpasswd.equals(orgPass)) {
					pstmt = conn.prepareStatement("delete from member where mem_id=?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1;// ȸ��Ż��ó�� ����
				} else
					x = 0;// ȸ��Ż�� ó�� ����
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}
}