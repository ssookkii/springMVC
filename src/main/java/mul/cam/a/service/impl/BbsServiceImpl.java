package mul.cam.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.BbsDao;
import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;
import mul.cam.a.service.BbsService;

@Service
public class BbsServiceImpl implements BbsService {
	
	@Autowired
	private BbsDao bbsDao;
	
	@Override
	public List<BbsDto> getBbsList(BbsParam bbs) {
		return bbsDao.getBbsList(bbs);
	}
	@Override
	public int getAllBbs(BbsParam bbs) {
		return bbsDao.getAllBbs(bbs);
	}
	
	@Override
    public boolean writeBbs(BbsDto dto) {
        dto.setRef(0); // ref 값을 0으로 초기화
        return bbsDao.writeBbs(dto);
    }
	
	public BbsDto getBbs(int seq) {
	    return bbsDao.getBbs(seq);
	}
	
	@Override
	public boolean updateBbs(BbsDto dto) {
		return bbsDao.updateBbs(dto);
	}
	
	@Override
	public boolean deleteBbs(int seq) {
		return bbsDao.deleteBbs(seq);
	}
	@Override
	public boolean readCount(int seq) {
		return bbsDao.readCount(seq);
	}


}