package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.MatchScheduleVO;

public interface ScheduleService {
	public ArrayList<MatchScheduleVO> selectTeamScheduleByTeamAfterToday(Integer teamNum);

	public MatchScheduleVO selectNextTeamSchedule(Integer teamNum);
	
	public MatchScheduleVO selectMatchScheduleByMsNum(Integer ms_num);

	public ArrayList<MatchScheduleVO> selectMatchScheduleByTmNum(Integer teamNum);

}
