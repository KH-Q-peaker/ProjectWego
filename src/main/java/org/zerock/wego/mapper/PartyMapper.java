package org.zerock.wego.mapper;

import java.util.concurrent.LinkedBlockingDeque;

import org.apache.ibatis.annotations.Param;
import org.zerock.wego.domain.PartyVO;

public interface PartyMapper {

	
	// 모집글 전체 조회 
	public abstract LinkedBlockingDeque<PartyVO> selectAllParties();
	
	// 특정 모집글 조회 
	public abstract PartyVO selectPartyByPartyId(@Param("partyId")Integer partyId);
	
	// 특정 유저 모집글 조회 
	public abstract LinkedBlockingDeque<PartyVO> selectPartiesByUserId(@Param("userId")Integer userId);
	
	// 산 이름으로 모집글 조회 
	public abstract LinkedBlockingDeque<PartyVO> selectPartiesBySanName(@Param("sanName")String sanName);
	
	
	
	
	// 모집글 이미지 절대경로 조회 
	public abstract String selectPartyImg(@Param("partyId")Integer partyId);
	
	// 모집글 이미지 삭제 
	public abstract Integer deletePartyImg(@Param("partyId")Integer partyId);
	
	
	// 특정 모집글 삭제 
	public abstract Integer deletePartyByPartyId(@Param("partyId")Integer partyId);
	
	
	
	// 모집 참여 여부 조회 
	public abstract Integer selectPartyJoin(@Param("partyId")Integer partyId, @Param("userId")Integer userId);
	
	// 모집 참여 등록
	public abstract Integer insertPartyJoin(@Param("partyId")Integer partyId, @Param("userId")Integer userId);
	
	// 모집 참여 취소 
	public abstract Integer deletePartyJoin(@Param("partyId")Integer partyId, @Param("userId")Integer userId);
}// end interface
