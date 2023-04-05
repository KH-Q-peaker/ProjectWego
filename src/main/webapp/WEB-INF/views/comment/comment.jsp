<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.zerock.wego.domain.CommentVO" %>
<%@page import= "java.util.List" %>
<%@page import= "java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${path}/resources/js/comment.js" defer ></script>
<script type="text/javascript" src="${path}/resources/js/delete.js" defer ></script>
<script type="text/javascript" src="${path}/resources/js/report.js" defer ></script>

<script>
var target = JSON.parser('${target}');
var userId = sessionScope.__AUTH__;
</script>
<!-- </head> -->
<!-- <body> -->


			<!-- 댓글 전체 컨테이너  -->
	<div class="cmtcontainer">
	
			
		<!-- 새로운 댓글 작성 폼  -->
		<div class="cmtwrite" id="cmtwrite">
			<textarea id="contents" name="contents" placeholder="댓글을 작성해주세요." maxlength="1000" required></textarea>
			<input type="button" value="등록" class="insert ncmt" disabled> 
			<input type="button" value="지우기??" class="cancle">
		</div>
		
		
			<c:forEach items="${comments}" var="c">
				<!-- 멘션일 경우와 아닐경우 분리 -->
				<c:if test="${c.status != 'Y' }">
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${c.mentionId == null}"> --%>
						<div class="comments ${c.mentionId == null ? 'mention' : ''}">
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<div class="comments mention"> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
				
				<input type="hidden" id="mentionId" value="${c.mentionId }"/>
				<c:if test="${c.status == 'N' }">
				<img class="cmtuserPic" src="${c.userPic}"/>
				<div class="cmtuser">${c.status != 'N' ? '알수없음' : c.nickname }</div>
				<div class="cmtdate">
						<fmt:formatDate pattern="MM-dd HH:mm" value="${c.modifiedDt == null? c.createdDt : c.modifiedDt}"></fmt:formatDate>
				</div>
				<div class="btns">
					<input type="hidden" id= "commentId" name="commentId" value="${c.commentId}">
					<c:if test="${c.userId == sessionScope.__AUTH__ && c.reportCnt < 5 }"> <!--  이거 조건 바꿔야된다!!!! -->
					<input type="button" class="modifycmt" name="modifycmt" value="수정" /> 
					<input type="button" class="deletecmt" name="deletecmt" value="삭제" /> 
					</c:if>
					<input type="button" class="reportcmt" name="reportcmt" value="신고" />
				</div>
				</c:if>
				<c:choose>
				<c:when test="${c.reportCnt >= 5 }">
					<div class="comment">🚨 ︎블라인드 처리된 댓글입니다.</div>
				</c:when>
				<c:otherwise>
					<div class="comment">${c.contents}</div>
					<c:if test="${c.mentionId == null && c.status == 'N'}">
					<input type="button" class="mentionbtn" name="mentionbtn" value="↪ ︎답글" />
					</c:if>
				</c:otherwise>
				</c:choose>
				
				<div class="updatebtn">
					<input type="button" name="updatecls" value="취소" />
					<input type="button" name="updatecmt" value="수정" />
				</div>
			</div>

				
			<!--  멘션 작성 폼 -->  
			<c:if test="${c.mentionId == null}">
				<div class="cmtwrite mentionwrite">
					<input type="hidden" id= "mentionId" name="mentionId" value="${c.commentId}">
					<textarea  id="mcontents" class="mcontents" name="contents" placeholder="답글을 작성해주세요." maxlength="1000" required></textarea>
					<input type="button" value="등록" class="insert men" disabled> 
					<input type="button" value="취소" class="cancle">
				</div>
			<!-- </div> -->
			</c:if>
		</c:if>
		</c:forEach>
	
		</div>
