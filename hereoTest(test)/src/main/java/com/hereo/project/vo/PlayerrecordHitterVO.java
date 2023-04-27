package com.hereo.project.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PlayerrecordHitterVO {
	private int ph_num;
	private int ph_tp_num;
	private int ph_mr_num;
	private int ph_single_hits;
	private int ph_twobase_hits;
	private int ph_threebase_hits;
	private int ph_homeruns;
	private int ph_errors;
	private int ph_steals;
	private int ph_fail_steals;
	private int ph_fourballs;
	private int ph_strike_outs;
	private int ph_hits;
	private int ph_bats;
	private int ph_doubleplays;
	private int ph_hitbypitches;
	private TeamVO ph_tm_name;
	private MembersVO ph_me_name;
	private TeamPlayerVO ph_tp_backnum;
}
