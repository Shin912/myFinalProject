package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.LeagueDAO;
import com.hereo.project.dao.RecordDAO;
import com.hereo.project.vo.LeagueVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.PlayerrecordHitterVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;


@Service
public class RecordServiceImp implements RecordService {
	@Autowired
	RecordDAO recordDao;
	@Autowired
	LeagueDAO leagueDao;

	@Override
	public ArrayList<PlayerrecordHitterVO> getSelectAllHitRecord(int lg_num) {
		if(lg_num == 0)
			return null;
		LeagueVO league = leagueDao.selectLeagueByLgNum(lg_num);
		
		return recordDao.selectAllHitRecord(league.getLg_num());
	}
	
}
