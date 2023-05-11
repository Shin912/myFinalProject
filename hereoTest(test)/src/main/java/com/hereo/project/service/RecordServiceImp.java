package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.LeagueDAO;
import com.hereo.project.dao.RecordDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.LeagueMatchListVO;
import com.hereo.project.vo.LeagueParticipationteamVO;
import com.hereo.project.vo.LeagueScheduleVO;
import com.hereo.project.vo.LeagueVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.PlayerrecordHitterVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;
import com.hereo.project.vo.matchRecordVO;


@Service
public class RecordServiceImp implements RecordService {
	@Autowired
	RecordDAO recordDao;
	@Autowired
	LeagueDAO leagueDao;

	@Override
	public ArrayList<PlayerrecordHitterVO> getSelectAllHitRecord(int lg_num) {
		LeagueMatchListVO lm = leagueDao.selectLeagueMatchLgNum(1);
		matchRecordVO mr = recordDao.selectMatchNum(lm.getLm_mr_num());
		
		return recordDao.selectAllHitRecord(mr.getMr_num());
	}

	
}
