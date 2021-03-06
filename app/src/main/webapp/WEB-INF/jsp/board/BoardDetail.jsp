<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.comment-bottom {
  display: flex;
  flex-direction: row;
}

form div {
  margin : 0 auto;
}

.form-control[readonly] {
    color: #ffffff;
    background-color: #fff0;
    background-clip: padding-box;
    padding-top: 25px;
    padding-bottom: 25px;
    padding-left: 0;
    border-radius: 0;
    border: 0;
    border-top: 1px solid #ced4da;
    border-bottom: 1px solid #ced4da;
}

.form-control[readonly]:hover{
  cursor: default;
}

.form-control:focus {
    border: 0;
}

.btn-wrap a {
    font-size: 14px;
    height: auto;
    line-height: 32px;
}

input[type="checkbox"]:checked + label:before{
    font-size: 10px;
    padding-left: 1px;
}

.box{
    -ms-overflow-style: none; 
}

.box::-webkit-scrollbar{
    display:none; 
 }
 
 .home-wrap {
    width: 827px;
    transition: 0.6;
    font-size: 20px;
}

.swal2-title {
    font-size: 18px;
}
.swal2-styled.swal2-confirm {
    line-height: 14px;
    font-weight: bold;
    background-color: rgb(31 71 63 / 100%);
}


</style>


<div class="home-wrap">
  <a href='${contextPath}/app/home'><i class="fas fa-home"></i></a>
  <h2 class="major" style="display: inline-block; margin-left: 368px;">게시글</h2>
</div>

<form style="width: 1000px;">

  <input id='f-no' type='hidden' name='no' class="form-control" value='${board.no}' readonly>

	<div class="mb-3 row">
	  <div class="col-sm-10">
	    <h4>${board.category.label}</h4>
	    <p style="font-size: 22px; margin: 0; font-weight: bold;">${board.title}</p>
	    <h4 style="margin-top: 6px;">${board.writer.nickname} | ${board.registeredDate} | 조회수:${board.viewCount} | 
	    
	    <c:choose>
		    <c:when test="${not empty list}">
		    <a href="unlike?boardNo=${board.no}&memberNo=${loginUser.no}"><i style="font-size:16px; color:#ffd745;" class="fas fa-heart"></i></a> ${board.likeCount}
		    </c:when>
		    <c:otherwise>
		    <a href="like?boardNo=${board.no}&memberNo=${loginUser.no}"><i style="font-size:16px; color:#ffd745;" class="far fa-heart"></i></a> ${board.likeCount}
		    </c:otherwise>
		  </c:choose>
	    </h4>
	    
	  </div>
	</div>

	<div class="mb-3 row">
	  <div class="col-sm-10">
	    <textarea id='f-content' name='content' class="form-control box" rows="8" readonly>${board.content}</textarea>
	  </div>
	</div>

	<div class="btn-wrap" style="margin-left: 684px;">
	<c:if test="${loginUser.no == board.writer.no or loginUser.active == 3}">
	  <c:if test="${loginUser.active == 1}">
		<a href='updateForm?no=${board.no}' class ="button" style="font-size: 14px;">수정</a>
		</c:if>
		<c:if test="${loginUser.active == 3}">
		<a href='updateForm?no=${board.no}' class ="button" style="font-size: 14px; visibility: hidden;">수정</a>
		</c:if>
		<a href='#delete' class ="button" style="font-size: 14px;">삭제</a>
	  <a href='list' class ="button" style="font-size: 14px;">목록</a>
	</c:if>
	
	<c:if test="${loginUser.no != board.writer.no and loginUser.active == 1}">
		<a href='update' class ="button" style="font-size: 14px; visibility: hidden;">수정</a>
		<a href='delete?no=${board.no}' class ="button" style="font-size: 14px; visibility: hidden;">삭제</a>
	  <a href='list' class ="button" style="font-size: 14px;">목록</a>
	</c:if>
	
	</div>
</form>


<!-- PopUp -->
<div id="main">
  
    <!-- 게시글 삭제 -->
	  <article id="delete" style="position: fixed; top: 200px; z-index: 999; box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px; background-color: rgb(31 71 63 / 100%);">
			  <h2 class="major">게시글 삭제</h2>
			  <p>정말 삭제 하시겠습니까?</p>
				<a href='delete?no=${board.no}' class ="button" style="font-size: 16px; width: 49%;">네</a>
				<a href='detail?no=${board.no}' class ="button" style="font-size: 16px; width: 49%;">아니요</a>
	  </article>
</div>

<!-- 댓글 -->
<div style="width: 810px;">
	<div class="mb-3 row">
	  <label for='f-comment-title' class="col-form-label">[댓글]</label>
  <c:if test="${board.writer.active != 2}">
	  <c:if test='${not empty loginUser}'>
		  <div class="col-sm-11">
		    <form action='comment/add' method="post" id="comment-form">
		      <input type="hidden" name="boardNo" value="${board.no}">
			    <input type="hidden" name="parentNo" value="0">
          <input type="hidden" name="classNo" value="0">
          <input type="hidden" name="groupNo" value="0">
          <input type="hidden" name="orderNo" value="1">
			    
			    <span>
				    작성자 : ${loginUser.nickname} &nbsp; | &nbsp;
				    
				    <input type="checkbox" id="demo-copy" name="isPublic" value="2">
	          <label for="demo-copy" style="font-size: 16px; padding: 0; padding-left: 21px; line-height: 11px;">비밀</label>
			    </span>
			    
			    <div class="comment-bottom">
				    <textarea id='f-comment-content' name='content' class="form-control col-md-6" rows="2" style="margin-right:5px;"></textarea>
			      <button class ="button" style="font-size: 14px; height: auto; line-height: 32px;">등록</button>
		      </div>
		    </form>	    
		  </div>
	  </c:if>
  </c:if>

	  <div class="col-sm-12">
      <jsp:include page="../comment/CommentList.jsp"/>
	  </div>
	  
  </div>
</div>
<!-- 댓글 end -->

<script>
document.querySelector("#comment-form").onsubmit = () => {
  if (document.querySelector("#f-comment-content").value == "") {
    Swal.fire("댓글 내용을 입력해 주세요.")
    return false;
  }
};
</script>
