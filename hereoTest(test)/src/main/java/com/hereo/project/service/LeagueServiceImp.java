package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.LeagueDAO;
import com.hereo.project.vo.PlayerrecordHitterVO;


@Service
public class LeagueServiceImp implements LeagueService {
	@Autowired
	LeagueDAO leagueDao;

	@Override
	public ArrayList<PlayerrecordHitterVO> getSelectAllHitRecord() {
		return leagueDao.selectAllHitRecord();
	}
	

}
