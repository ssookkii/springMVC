package mul.cam.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.BbsDao;
import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;

@Repository
public class BbsDaoImpl implements BbsDao {

	@Autowired
	SqlSession session;
	
	String ns = "Bbs.";
	
	@Override
	  public List<BbsDto> getBbsList(BbsParam bbs) {
	        return session.selectList(ns + "getBbsList", bbs);
	    }
	  
	public int getAllBbs(BbsParam bbs) {
	    Integer count = session.selectOne(ns + "getAllBbs", bbs);
	    return count == null ? 0 : count;
	}
	
	  @Override
	  public boolean writeBbs(BbsDto dto) {
	      int count = session.insert(ns + "writeBbs", dto);
	      return count > 0 ? true : false;
	  }
	  @Override
	  public BbsDto getBbs(int seq) {
		    return session.selectOne(ns + "getBbs", seq);
		}


	@Override
	public boolean updateBbs(BbsDto dto) {
		int count = session.update(ns + "updateBbs", dto);
		return count > 0 ? true : false;
	}

	@Override
	public boolean deleteBbs(int seq) {
		int count = session.delete(ns + "deleteBbs", seq);
		return count > 0 ? true : false;
	}



	@Override
	public boolean readCount(int seq) {
		int count = session.update(ns + "readCount", seq);
		return count > 0 ? true : false;
	}

	}
	



