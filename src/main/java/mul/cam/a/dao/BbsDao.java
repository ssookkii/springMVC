package mul.cam.a.dao;


import java.util.List;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;

public interface BbsDao {
	// 페이지 번호와 페이지 당 게시물 수를 입력받아, 해당 페이지의 게시물 리스트를 가져오는 메소드
	List<BbsDto> getBbsList(BbsParam bbs);
	 int getAllBbs(BbsParam bbs);
	
	// 게시물 작성 메소드
	public boolean writeBbs(BbsDto dto);
	
	// 게시물 상세보기 메소드
	public BbsDto getBbs(int seq);
	
	// 게시물 수정 메소드
	public boolean updateBbs(BbsDto dto);
	
	// 게시물 삭제 메소드
	public boolean deleteBbs(int seq);
	public boolean readCount(int seq);
}
