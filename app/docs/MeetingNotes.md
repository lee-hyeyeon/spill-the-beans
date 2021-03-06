## 회의록 (2021-12-06 ~ 2021-12-23)

<details>
<summary> 1일차(2021-12-06,월) </summary>
	
- 프로젝트 기획
	- 주제 선정 회의
	- 공용 깃허브 생성
	- .gitignore 설정
   	- gradle eclipse 설정

- 요구사항 명세
    - 기능 요구 사항 : 로그인, 회원가입, 게시판, 댓글
    - 비기능 요구 사항 : 닉네임 중복 검사, 이메일 중복 검사, 게시판 유효성 검사, 로그인 유효성 검사, 회원가입 유효성 검사, 로그인 여부에 따른 접근 제어, 유저 상태에 따른 접근 제어, 동작 흐름에 따른 응답 
    - 데이터베이스 요구 사항 : 여러 기능에서 사용될 데이터의 타입(INTEGER, DATE, VARCHAR), 엔티티(회원, 카테고리, 게시판, 댓글, 좋아요), 관계 설정, 무결성 제약조건
    - 인터페이스 요구 사항 : 시스템 인터페이스, 사용자 인터페이스

- 데이터베이스 설계
    - 테이블 설정
    - 로컬 MySQL 서버에 접속
        > mysql -u root -p
    - MySQL 사용자 추가
        > CREATE USER 'ear'@'localhost' IDENTIFIED BY '1111';
    - MySQL 데이터베이스 생성
        > CREATE DATABASE eardb
            DEFAULT CHARACTER SET utf8
            DEFAULT COLLATE utf8_general_ci;
    - MySQL 사용자에게 데이터베이스 사용 권한 부여
        > GRANT ALL ON eardb.* TO 'ear'@'localhost';
    - MySQL 사용자 목록 조회
        > select user from mysql.user;

- 프로젝트 시작
    - 데이터베이스 모델링
        - 테이블 생성
    - npm install
    - Tomcat 서버 생성
        - 클라이언트/서버 프로젝트 준비
    - DTO 생성
        - BoardDTO
        - CategoryDTO
        - CommnetDTO
        - MemberDTO
    - JSP 적용
        - auth
        - footer
        - header
        - home
        - template1

- 회의 내용
    - 도메인 추가
    - 테이블 추가

 </details>
 
<details>
<summary> 2일차(2021-12-08, 수) </summary>
	
- 파트 분배
    - 혜연: 게시판
    - 솔: 유저
    - 은채: 댓글
    - 공용: 카테고리, 로그인

- DBMS(데이터베이스 관리 시스템: database management system)
    - DQL, DML 작성
    - BoardDao.xml
    - CategoryDao.xml
    - CommentDao.xml
    - MemberDao.xml

- Data SQL
    - board-data.sql
    - category-data.sql
    - comment-data.sql
    - member-data.sql

- 서블릿(Spring WebMVC Framework 적용)
    - AuthController
    - BoardController
    - CommentController
    - HomeController
    - MemberController

- 서블릿 프로그래밍
    - JSP 프로그래밍(통합)
        - board
        - comment
        - member
</details>

<details>
<summary> 3일차(2021-12-10, 금) </summary>
	
- 프로젝트 회의
    - 관리자/유저 로그인 관련
        - 사용자 인증: 로그인
        - 사용자 인증: 내 정보 보기
        - 사용자 인증: 로그인 정보 활용
        - 사용자 인증: 로그인 여부에 따라 메뉴 출력 제어

- Data SQL
    - 관리자 추가
    - member-data.sql 수정
</details>

<details>
<summary> 4일차(2021-12-13, 월) </summary>
	
- 템플릿 적용
    - 메인 페이지 : 소개, 로고, 배경 구현
    - 헤더 : 메뉴 구현, 로그인 여부에 따라 메뉴 출력 제어(비회원, 회원, 관리자)
    - 로그인, 로그아웃
    - 로그인 실패 페이지 구현 미완성

- UI 틀 잡기 완성
</details>

<details>
<summary> 5일차(2021-12-14, 화) </summary>

- 로그인 실패 페이지 구현 완료

- 회원 가입 폼 구현
    - 닉네임 중복검사 구현 완료
    - 이메일 중복검사 구현 완료

- ID/PW 찾기 구현
    - 이메일 찾기 폼 구현 완료
    - 비밀번호 찾기 폼 구현 완료

- 마이페이지 구현
    - 마이페이지 상세 구현 완료
</details>

<details>
<summary> 6일차(2021-12-16, 목) </summary>

- 회원 마이페이지
    - 회원 마이페이지 구현 완료
    - 마이페이지 수정 구현 완료
        - 비밀번호 수정 구현 완료
    - 탈퇴 구현 완료
        - 탈퇴 성공 시 메시지 팝업 구현 완료
        - 탈퇴 성공 시 jsp에서 refresh를 활용하여 페이지 이동 구현 완료
        - 탈퇴 실패 시 메시지 팝업 구현 완료

- 회원 가입 폼 구현
    - 회원 가입 완료 시 메시지 팝업 구현 완료

- 관리자 페이지
    - 회원 목록 메시지 팝업 구현 완료
    - 회원 목록 메시지 팝업에서 페이징 구현 완료
</details>

<details>
<summary> 7일차(2021-12-17, 금) </summary>

- 관리자용 회원 관리
    - 회원 상세보기 페이지 구현 완료
    - 회원 탈퇴 시키기 구현 완료
        - 회원 상태에 따른 상세페이지 구현 완료
        - 탈퇴 완료 메세지 팝업 구현 완료

- 뒤로가기 버튼 구현
    - history.back(); 을 사용하여 뒤로 가기 버튼 구현 완료

- 게시판 목록
    - 게시판 목록 바로 가기 링크 연결
    - 게시판 목록 검색 기능 구현 완료
        - BoardController --> search() 추가
        - BoardDao.xml --> findByKeyword 추가
        - 전체 검색 기능
        - 제목 검색 기능
        - 작성자 검색 기능
    - 게시판 목록 비어있을 때, 검색 목록 비어있을 때 구현 완료
    - 홈 버튼 추가
        - fortawesome npm install

- Board 테스트 값 수정

- Board 테이블 수정
</details>

<details>
<summary> 8일차(2021-12-18, 토) </summary>

- 게시판 목록
    - 비회원일때 목록만 조회 가능

- 게시판 상세
    - 게시판 상세 CSS 구현 완료

- 게시판 수정
    - 게시판 수정 기능 구현 완료
    - 게시판 수정 css 구현 완료

- 게시판 삭제
    - 게시판 삭제 팝업 구현 완료
    - 게시판 삭제 기능 구현 완료
    - 게시판 삭제 css 구현 완료

- 댓글
    - 댓글 목록 css 구현 완료
    - 비밀 댓글 아이콘 변경
    - 비밀 댓글 출력 내용 변경
</details>

<details>
<summary> 9일차(2021-12-19, 일) </summary>

- 게시판 등록
    - 게시판 등록 기능 구현 완료
    - 게시판 등록 CSS 구현 완료
    - 게시판 등록 팝업 구현 완료
    - 게시판 등록 시 제목이나 내용이 비어있을 때 알림창 팝업 구현 완료
    - 게시판 내용 등록 시 글자 수 출력 완료

- 등록 취소 버튼 구현
    - location.hash = ''; 구현 완료

- 게시판 좋아요
    - BoardLike 테이블 추가
    - BoardLikeDTO 추가
    - BoardDao.xml 수정
    - BoardController에 like 추가
    - BoardController에 unlike 추가
    - 좋아요 기능 구현 완료
    - 좋아요 취소 기능 구현 완료
    - 좋아요 중복 방지 기능 구현 완료
    - 좋아요 유무에 따른 아이콘 변경 구현 완료

- 게시판 상세
    - 게시판 내용 스크롤 기능 살리고 스크롤 숨기기

- 게시판 댓글
    - CommentController 수정
        - update 메서드 수정 완료
        - updateFormPopUp 메서드 추가 완료
    - 댓글 등록
        - 기능, CSS 구현 완료
    - 댓글 삭제
        - 기능, CSS 구현 완료
    - 댓글 수정
        - 기능 구현 중
        - 팝업 메세지 구현 완료
            - RedirectAttributes 사용해서 파라미터 넘기기
            - @RequestParam 사용해서 파라미터 받기
        - 팝업 CSS 구현 완료
        - 팝업에서 취소 버튼 구현 완료
            - onclick="history.back();" 활용
        - 팝업에서 radio 버튼으로 공개 / 비밀 체크 활용할 수 있도록 구현 완료
</details>

<details>
<summary> 10일차(2021-12-22, 수) </summary>

- Comment 테이블
    - comment 테이블 수정(컬럼 추가)
    - 포워드 엔지니어링을 통한 ddl 재수정
    - comment-data 테스트 값 수정 및 추가

- commentList.jsp
    - 토글을 활용한 대댓글 출력
        - 자바스크립트 누르면 펼쳐지는 아코디언 메뉴 구현
            - 참고 url: (https://ungdoli0916.tistory.com/784)
        - 클릭 시 보이기 / 숨기기 기능 구현 완료
    - 답글 쓰기 클릭 시 대댓글 입력 폼 출력 완료

- BoardController
    - BoardDetail에 Reply까지 함께 넘겨서 대댓글 출력 구현 완료

- 대댓글 구현
    - groupNo끼리 비교하여 조건 출력 구현 완료
    - 대댓글 목록 출력 구현 완료
        - sql : findAll 수정, replyCount 갯수 가져오기
            - select count(*) 사용
</details>

<details>
<summary> 11일차(2021-12-23, 목) </summary>
	
- 대댓글 구현
    - 대댓글 등록
        - replyComtroller : add 메서드 추가
        - sql : insertReply문 추가
        - dao : insertReply 메서드 추가
        - 공개여부 체크박스 구현 완료
        - orderNo, groupNo, classNo 변수 추가
        - 댓글 하위 등록 구현 완료
        - 등록 전 로그인 유저 한번 더 체크하는 조건문 추가
        - 등록 구현 완료
    - 대댓글 목록에서 답글 쓰기
        - javaScript 사용하여 해당 대댓글만 열고 닫기 구현 완료
    - 대댓글 수정
        - 기존 구현한 코드로 댓글 하위 테스트 완료
        - 수정 기능 구현 완료
    - 대댓글 삭제
        - sql문 수정
            - 원댓글 삭제 시 같은 그룹, 같은 부모번호를 가지 하위 댓글 같이 삭제
        - 테스트 완료
        - 삭제 기능 구현 완료
    - 대댓글 목록
        - 출력 시 해당 댓글의 하위만 출력되도록 조건문 수정 완료
            - 상위댓글의 고유번호와 하위댓글의 부모번호로 비교
            - <c:if test="${comment.no == reply.parentNo}">
            - 목록 기능 구현 완료
    - 대댓글 출력
        - 대댓글 입력 폼 순서 변경 완료
        - 내용 개수에 따른 출력 영역 높이 수정 완료
        - 과거순으로 순서 정렬 완료

- 댓글
    - 과거순으로 순서 정렬 완료

- 관리자
    - 게시글 관리
        - 게시글 삭제 기능 추가 완료
        - 게시글 댓글 삭제 기능 추가 완료

- 유지 보수(디버깅)
    - 비회원일 때 게시글 상세보기 실행 시 팝업으로 접근 차단
        - 로그인 유효성 검사 시 닉네임으로 구분 기능 추가 완료
        - 회원 가입 시 닉네임에 "null" 입력 금지 추가 완료
    - 좋아요
        - 아이콘 잘 안 보여서 하트로 변경 및 색상 변경 완료
    - 게시글
        - 탈퇴된 회원의 게시글일 경우 댓글 작성 금지
        - 탈퇴된 회원의 게시글일 경우 답글 작성 금지
        - 목록 : 홈버튼 아이콘 위치 수정 완료
        - 목록 : 댓글 수 출력 추가 완료
        - 상세 : 홈버튼 아이콘 추가 완료
    - 댓글
        - 수정 버튼 위치 수정 완료
        - 삭제 버튼 위치 수정 완료
        - 수정, 삭제 아이콘 css 구현 완료
    - 관리자
        - 게시글 수정 조건문 수정 완료
        - 게시글 삭제 조건문 수정 완료
        - 댓글 출력 조건문 수정 완료
        - 대댓글 출력 조건문 수정 완료
    - 회원
        - 탈퇴 시 메세지 추가 완료
    - 데이터(테스트 값) 정리
        - Board-Data 수정 완료
        - Member-Data 수정 완료
        - Comment-Data 수정 완료
    - 정리
        - 파일 정리
        - 코드 정리
        - 주석 정리
        - README.md 정리
</details>