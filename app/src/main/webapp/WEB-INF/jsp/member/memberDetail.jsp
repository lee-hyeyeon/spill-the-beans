<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
input[type="text"] {
  border: 0;
  font-size: 15px;
  line-height: 18px;
  padding-bottom: 7px;
}

input[type="email"] {
  border: 0;
  font-size: 15px;
  line-height: 18px;
  padding-bottom: 7px;
}

input[type="text"]:focus,
input[type="password"]:focus,
input[type="email"]:focus,
input[type="tel"]:focus,
select:focus,
textarea:focus {
  background: transparent !important;
  border:none !important;
}
    
</style>

<h2 class="major">마이페이지</h2>

<form method='post'>

	<input type='hidden' name='no' value='${loginUser.no}'>

		<div class="mb-3 row">
		  <label for='f-nickname' class="col-sm-2 col-form-label">닉네임</label>
		  <div class="col-sm-10">
		    <input id='f-nickname' type='text' name='nickname' value="${loginUser.nickname}" readonly>
		  </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-email' class="col-sm-2 col-form-label">이메일</label>
		  <div class="col-sm-10">
		    <input id='f-email' type='email' name='email' value="${loginUser.email}" readonly>
		  </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-registeredDate' class="col-sm-2 col-form-label">가입일</label> 
		  <div class="col-sm-10">
		    <input id='f-registeredDate' type="text" readonly value="${loginUser.registeredDate}">
		  </div>
		</div>
	
	<div class="btn_wrap">
		  <c:if test="${loginUser.active == 1}">
			  <button type="submit" formaction="updateForm" class ="button" style="font-size: 16px; width: 49%;">내 정보 수정</button>
		    <a href='deleteForm' class ="button" style="font-size: 16px; width: 49%;">탈퇴</a>
		  </c:if>
		  <c:if test="${loginUser.active == 3}">
	       <button type="submit" formaction="updateForm" class ="button" style="font-size: 16px; width: 100%;">관리자 정보 수정</button>
	    </c:if>
	</div>

</form>
