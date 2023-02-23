package mul.cam.a.service;

import java.util.List;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;

public interface BbsService {
	public List<BbsDto> getBbsList(BbsParam bbs);
	int getAllBbs(BbsParam bbs);
	public boolean writeBbs(BbsDto dto);

	public boolean updateBbs(BbsDto dto);
	public boolean deleteBbs(int seq);
	public boolean readCount(int seq);
	public BbsDto getBbs(int seq);
}