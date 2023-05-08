package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.PlayerrecordHitterVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;
import com.hereo.project.vo.matchRecordVO;

public interface RecordDAO {

	ArrayList<PlayerrecordHitterVO> selectAllHitRecord(@Param("mr_num")int mr_num);

	matchRecordVO selectMatchNum(@Param("lm_mr_num")int lm_mr_num);


}
