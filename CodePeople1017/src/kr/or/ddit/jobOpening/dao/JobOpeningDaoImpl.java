package kr.or.ddit.jobOpening.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.jobOpening.vo.JobOpeningVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class JobOpeningDaoImpl implements IJobOpeningDao{
	
	private String nameSpace = "jobOpening.";
	
	private SqlMapClient smc;
	private static IJobOpeningDao dao;
	private JobOpeningDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IJobOpeningDao getInstance() {
		if(dao == null) {
			dao = new JobOpeningDaoImpl();
		}
		return dao;
	}


	@Override
	public List<Integer> joSalaryList() throws SQLException {
		List<Integer> list = null;
		list = (List<Integer>) smc.queryForList(nameSpace + "joSalaryList");
		return list;
	}


}
