package com.hereo.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.dao.RegionDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.pagination.PageMaker;
import com.hereo.project.service.PlayerService;
import com.hereo.project.service.TeamService;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.RegionVO;
import com.hereo.project.vo.TeamApprovalListVO;
import com.hereo.project.vo.TeamVO;

@Controller
public class TeamController {
	@Autowired
	TeamService teamService;
	@Autowired
	PlayerService playerService;
	@Autowired
	RegionDAO regionDao;
	
//	팀 메인 페이지 
	@RequestMapping(value = "/team/main", method = RequestMethod.GET)
	public ModelAndView teamMainPage(ModelAndView mv, Criteria cri) {
		int totalCount = teamService.countTeams("활동중", cri);
		if(cri==null) {
			cri = new Criteria();
		}
		cri.setPerPageNum(5);
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		RegionVO[] regionArr = regionDao.selectAllRegion();
		ArrayList<TeamVO> teamList = teamService.selectTeamsByCriAndState(pm.getCri(), "활동중");
		mv.addObject("region", regionArr);
		mv.addObject("teamList", teamList);
		mv.addObject("pm", pm);
		mv.setViewName("/team/team-main");
		return mv;
	}
	

	
//	팀 개별 페이지
	@RequestMapping(value = "/team/sep", method = RequestMethod.GET)
	public ModelAndView teamMainPage(ModelAndView mv, Integer teamNum) {
		TeamVO tmpTeam = teamService.selectTeamByTm_Num(teamNum);
		
		mv.addObject("team", tmpTeam);
		mv.setViewName("/team/team-sep");
		return mv;
	}
//	팀 전체 선수 페이지
	@RequestMapping(value = "/team/wholeplayer", method = RequestMethod.GET)
	public ModelAndView teamWholePlayer(ModelAndView mv, Integer teamNum) {
		ArrayList<PlayerVO> playerList = playerService.selectPlayerByTm_Num(teamNum);
		
		
		mv.addObject("playerList", playerList);
		mv.setViewName("/team/team-wholeplayer");
		return mv;
	}
//	선수 디테일 페이지(일단 이걸로 구현)
	@RequestMapping(value = "/team/pdetail", method = RequestMethod.GET)
	public ModelAndView teamPlayerDetail(ModelAndView mv, Integer player) {
		PlayerVO tmpPlayer = playerService.selectPlayerByPl_Num(player);
		mv.addObject("Player", tmpPlayer);
		mv.setViewName("/team/team-playerdetail");
		return mv;
	}
//	팀 신청 페이지(일단 이걸로 구현)
	@RequestMapping(value = "/team/create", method = RequestMethod.GET)
	public ModelAndView teamCreate(ModelAndView mv) {
		
		mv.setViewName("/team/team-create");
		return mv;
	}
//	팀 신청 페이지 - POST 신청 받기
	@RequestMapping(value = "/team/create", method = RequestMethod.POST)
	public ModelAndView teamCreatePost(ModelAndView mv, TeamVO team, MultipartFile imgFile) {
		boolean res = teamService.insertTeam(team, imgFile);
		
		
		mv.setViewName("/team/team-create");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/team/create_dupCheck", method = RequestMethod.POST)
	public Map<String, Object>teamCreateDuplicateCheck(@RequestBody TeamVO tmp) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = teamService.selectTeamByName(tmp.getTm_name());
		map.put("res", res);
		return map;
		
		
	}
//	팀 가입 페이지 -get
	@RequestMapping(value = "/team/join", method = RequestMethod.GET)
	public ModelAndView teamJoin(ModelAndView mv) {
		
		mv.setViewName("/team/team-join");
		return mv;
	}
//	팀 기록 페이지 -get
	@RequestMapping(value = "/team/record", method = RequestMethod.GET)
	public ModelAndView teamRecord(ModelAndView mv, Integer teamNum) {
		TeamVO tmpTeam = teamService.selectTeamByTm_Num(teamNum);
		mv.addObject("team", tmpTeam);
		mv.setViewName("/team/team-record");
		return mv;
	}
	
	@RequestMapping(value = "/team/admin", method = RequestMethod.GET)
	public ModelAndView adminMain(ModelAndView mv) {
		mv.setViewName("/team/team_admin_main");
		return mv;
	}
	@RequestMapping(value = "/team/adteam_create", method = RequestMethod.GET)
	public ModelAndView adminTeamCreate(ModelAndView mv, Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		ArrayList<TeamVO> teamList = teamService.selectTeamsByCriAndState(cri, "심사중");
		ArrayList<TeamApprovalListVO> TAppList = new ArrayList<TeamApprovalListVO>();
		for(TeamVO tmpTeam: teamList) {
			TeamApprovalListVO tmpApp= teamService.selectTeamAppListByTeam(tmpTeam);
			if(tmpApp !=null) {
			tmpApp.setTeam(tmpTeam);
			TAppList.add(tmpApp);
			}
		}
		mv.addObject("TAList", TAppList);
		mv.setViewName("/team/team_admin_teamcreate");
		return mv;
	}
	@RequestMapping(value = "/team/adteam_createBoard", method = RequestMethod.GET)
	public ModelAndView adminTeamCreateBoard(ModelAndView mv, Integer teamNum) {
		TeamVO tmpTeam = teamService.selectTeamByTm_Num(teamNum);
		TeamApprovalListVO tmpApp= teamService.selectTeamAppListByTeam(tmpTeam);
		if(tmpApp !=null) {
			tmpApp.setTeam(tmpTeam);
		}
		if(tmpApp.getTa_state()==0) {
			boolean res = teamService.updateTeamAppListState(teamNum, 1);
			
		}
		mv.addObject("TAL", tmpApp);
		mv.setViewName("/team/team_admin_teamcreateboard");
		return mv;
	}
	@RequestMapping(value = "/team/adteam_createBoard", method = RequestMethod.POST)
	public ModelAndView adminTeamCreateBoardPost(ModelAndView mv, Integer teamNum, Integer teamState) {
		boolean res = teamService.updateTeamAppListState(teamNum, teamState);
		if(res) {
			teamService.deleteTeamAppListState(teamNum, teamState);
			
		}
		
		mv.setViewName("redirect:/team/adteam_create");
		return mv;
	}
	@RequestMapping(value="/team/board_list", method = RequestMethod.GET)
	public ModelAndView TeamBoardMain(ModelAndView mv) {
		
		mv.setViewName("/team/team-board_list");
		return mv;
	}
	
}
