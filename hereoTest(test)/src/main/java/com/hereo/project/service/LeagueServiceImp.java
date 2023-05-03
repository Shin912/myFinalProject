package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.LeagueDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.LeagueParticipationteamVO;
import com.hereo.project.vo.LeagueScheduleVO;
import com.hereo.project.vo.LeagueVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.TeamVO;


@Service
public class LeagueServiceImp implements LeagueService {
	@Autowired
	LeagueDAO leagueDao;

	@Override
	public int countLeague(String state, Criteria cri) {
		return leagueDao.countAllleague(state,cri);
	}
	@Override
	public ArrayList<LeagueVO> selectLeaguesByCriAndState(String state, Criteria cri) {
		return leagueDao.selectLeaguesByCriAndState(state, cri);
	}
	@Override
	public LeagueVO selectLeagueByLgNum(int lg_num) {
		if(lg_num == 0)
			return null;
		return leagueDao.selectLeagueByLgNum(lg_num);
	}
	@Override
	public ArrayList<LeagueAttributeVO> selectLeagueAttByLgNum(int lg_num) {
		if(lg_num == 0)
			return null;
		return leagueDao.selectLeagueAttByLgNum(lg_num);
	}
	@Override
	public ArrayList<LeagueScheduleVO> selectLeagueSchedule(int lg_num) {
		return leagueDao.selectLeagueSchedule(lg_num);
	}
	@Override
	public ArrayList<LeagueParticipationteamVO> getSelectLeagueParti(int lg_num) {
		if(lg_num == 0)
			return null;
		return leagueDao.selectLeagueParti(lg_num);
	}
	@Override
	public Boolean insertLeague(MembersVO user, LeagueVO league) {
		//리그 등록 서비스
		if(user == null) //로그인체크
			return false;
		if(!checkLeague(league)) // 필요한 리그정보 없을시 실패
			return false;
		league.setLg_me_id(user.getMe_id());
		
		leagueDao.insertLeague(league);
		return true;
	}
	private boolean checkLeague(LeagueVO league) {
		//리그정보체크
		if(league == null || league.getLg_name() == null)
			return false;
		return true;
	}

}
