package mul.cam.a.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;
import mul.cam.a.service.BbsService;

@Controller
public class BbsController {
	
	@Autowired
	private BbsService bbsService;
	
	@GetMapping(value ="bbslist.do")
	public String GetBbslist(BbsParam param, Model model) {
		//글의 시작과 끝
		int pn = param.getPageNumber();
		int start = 1 + pn * 10;
		int end = (pn + 1) * 10;
		
		param.setStart(start);
		param.setEnd(end);
		
		List<BbsDto> list = bbsService.getBbsList(param);
		int len = bbsService.getAllBbs(param);
		
		int pageBbs = len / 10;
		if((len % 10) > 0 ) {
			pageBbs = pageBbs + 1;
		}
		
		if(param.getChoice() == null || param.getChoice().equals("") 
				|| param.getSearch() == null || param.getSearch().equals("")) {
			param.setChoice("검색");
			param.setSearch("");
		}
		model.addAttribute("bbslist",list); // 게시판 리스트
		model.addAttribute("pageBbs", pageBbs); // 총페이지수
		model.addAttribute("pageNumber", param.getPageNumber()); //현재 페이지
		model.addAttribute("choice",param.getChoice());  // 검색 카테고리
		model.addAttribute("search", param.getSearch()); // 검색어
		
		return "bbslist";
		
	}
	@RequestMapping(value = "bbswrite.do", method = RequestMethod.GET)
	public String bbsWrite(Model model, HttpSession session) {
	    // 세션에서 현재 로그인된 사용자의 정보를 읽어와서 DTO에 설정합니다.
	    String id = (String)session.getAttribute("loginId");
	    BbsDto dto = new BbsDto();
	    dto.setId(id);
	    model.addAttribute("dto", dto);

	    return "bbswrite";
	}
	
	@RequestMapping(value = "bbswrite.do", method = RequestMethod.POST)
	public String bbsWrite(BbsDto dto, RedirectAttributes redirectAttributes) {
	    boolean result = bbsService.writeBbs(dto);
	    if (result) {
	        redirectAttributes.addFlashAttribute("msg", "게시글을 작성하였습니다.");
	    } else {
	        redirectAttributes.addFlashAttribute("msg", "게시글 작성에 실패하였습니다.");
	    }
	    return "redirect:/bbslist.do";
	}
	


	
	@RequestMapping(value = "bbsdelete.do", method = RequestMethod.GET)
	public String bbsDelete(@RequestParam("seq") int seq, Model model) {
		boolean result = bbsService.deleteBbs(seq);
		if(result) {
			model.addAttribute("msg", "게시글을 삭제하였습니다.");
		} else {
			model.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
		}
		return "bbslist.do";
	}
	
	@RequestMapping(value = "bbsdetail.do", method = RequestMethod.GET)
	public String bbsDetail(@RequestParam int seq, Model model) {
	    bbsService.readCount(seq);
	    BbsDto dto = bbsService.getBbs(seq);
	    model.addAttribute("bbs", dto);
	    return "bbsdetail";
	}
	@RequestMapping(value = "/bbsupdate.do", method = RequestMethod.GET)
	public String bbsUpdate(HttpServletRequest request, Model model) {
	    int seq = Integer.parseInt(request.getParameter("seq"));
	    BbsDto dto = bbsService.getBbs(seq);
	    dto.setTitle("[수정]"+dto.getTitle());
	    model.addAttribute("dto", dto);
	    return "bbsupdate";
	}

	@RequestMapping(value = "/bbsupdateAf.do", method = RequestMethod.POST)
	public String bbsUpdateAf(HttpServletRequest request, BbsDto dto) {
		
		boolean isSucceed = bbsService.updateBbs(dto);
		if (isSucceed) {
			dto.setTitle("[수정]"+dto.getTitle());
			return "redirect:/bbslist.do";
		} else {
			request.setAttribute("errorMsg", "게시글 수정에 실패했습니다.");
			return "error";
		}
	}

}