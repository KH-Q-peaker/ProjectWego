package org.zerock.wego.domain.chat;

import lombok.Data;

@Data
public class ChatRoomDTO {

	private Integer chatRoomId;
	private String title;
	private String status;
	private Integer userId;
}

