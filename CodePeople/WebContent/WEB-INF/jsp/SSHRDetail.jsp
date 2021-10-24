<%@page import="kr.or.ddit.hr.vo.HRCrrVO"%>
<%@page import="kr.or.ddit.cv.vo.CVVO"%>
<%@page import="kr.or.ddit.certification.vo.CertificationVO"%>
<%@page import="kr.or.ddit.progLang.vo.ProgLangVO"%>
<%@page import="kr.or.ddit.hr.vo.HRInfoVO"%>
<%@page import="kr.or.ddit.edu.vo.EduVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%
int hrNo = (int)(request.getAttribute("hrNo"));

int certListSize = (int)(request.getAttribute("certListSize"));
int plListSize = (int)(request.getAttribute("plListSize"));
int crrListSize = (int)(request.getAttribute("crrListSize"));
int eduListSize = (int)(request.getAttribute("eduListSize"));


%>


<!DOCTYPE html>
<html lang="en">

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://kit.fontawesome.com/d3ee6ce800.js" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
  
</head>

<body>
  <!-- 헤더 -->
  <div id="header">
    <!-- 헤더 메인 메뉴 바 -->
    <div id="header-container">
      <!-- 좌측 메뉴 -->
      <div id="header-left-menu">
        <!-- 로고 -->
        <a href="" id="logo"><i class="fas fa-copyright" style="font-size: 32px;"></i></a>
        <div class="divider"></div>
        <!-- 통합 검색창 -->
        <div id="search-box">
          <div id="search-item">
            <i class="fas fa-search item" style="width: 15.3px; height: 19px;">
            </i> <input class="" type="text"
              style="height: 19px; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"
              placeholder="통합검색">
          </div>
        </div>
      </div>
      <!-- 우측 메뉴 -->
      <div id="header-right-menu">
        <!-- 메인 메뉴 링크 -->
        <div id="header-link-box">
          <a class="header-link" href="/CodePeople/rehearsal/mainHr.html">인재</a>
          <a class="header-link" href="/CodePeople/rehearsal/company.html">기업</a>
          <a class="header-link" href="/CodePeople/rehearsal/mainJo.html">채용</a>
          <a class="header-link" href="/CodePeople/rehearsal/mainBoard.html">커뮤니티</a>
          <a class="header-link" href="/CodePeople/rehearsal/mainMypage.html">마이페이지</a>
        </div>
        <div class="divider"></div>
        <!-- 로그인버튼 -->
        <a href="/CodePeople/rehearsal/home.html"><button id="header-login-btn"
            class="btn btn-primary btn-sm">로그인</button></a>
      </div>
    </div>
  </div>
  <!-- 바디 -->
  <div id="body">
    <div id="body-container">
      <!-- 마이페이지 좌측 메뉴바 -->
      <div class="nav-left-bar nav-my">
        <div class="nav-sticky">
          <ul class="list-group">
            <li class="list-group-item "><a class="nav-link" href="/CodePeople/rehearsal/mainHr.html">모든 인재보기</a></li>
          
            <li class="list-group-item"><a class="nav-link" href="#edu">학력</a></li>
            <li class="list-group-item"><a class="nav-link" href="#crr">경력</a></li>
            <li class="list-group-item"><a class="nav-link" href="#pl">활동분야</a></li>
            <li class="list-group-item"><a class="nav-link" href="#cert">자격증</a></li>
          
          </ul>
        </div>
      </div>
      <!-- 바디 콘텐츠 -->
      <div id="content">
        <!-- 마이페이지 -->


        <!-- 학력-->
        <div id="edu" class="content-box search-result board board-main board-best">
          <div class="board-header">
            <div class="board-name">
              <h1 class="h1">학력</h1>
            </div>
          </div>
          <div class="board-body">
            <div class="divider"></div>
            <!-- 아코디언 : 게시판 게시글들 시작 -->
            <div id="accordion">
<% 
		if(eduListSize==0){
%>		
		<p style="text-align: center;">학력정보가 없습니다.</p>
		
		
		
<%		
		}else{
			List<EduVO> eduList = (List<EduVO>)request.getAttribute("eduList");
			for(int i = 0; i< eduList.size(); i++){
				EduVO edu = eduList.get(i);
				if(!edu.getEduCodeNm().equals("학력무관") ){
%>				
			<!-- 게시글의 한단위  -->
              <!-- card-hear 안 a태그와 게시글의 아이디를 맞춰주세요 -->
              <div class="card">
                <div class="card-header">
				  <a class="btn title-btn" data-bs-toggle="collapse" href="#edu<%=i%>">
				학력구분&nbsp;&nbsp;:&nbsp;&nbsp;<span class="board-title eduCodeNm"><%=edu.getEduCodeNm()%></span>
				</a>
                </div>
                <!-- 게시글을 담고있는 곳 a 태그가 가르키는 곳 -->
                <div id="edu<%=i%>" class="collapse " data-bs-parent="#accordion">
                  <div class="card-body">
				
                    <span class="board-detail-content">
                      <label for="">구분&nbsp;</label>:&nbsp;&nbsp;<span class="board-title eduCodeNm" ><%=edu.getEduCodeNm()%></span><br>
                      <label for="">학교&nbsp;</label>:&nbsp;&nbsp;<span class="board-title eduSchNm" ><%=edu.getEduSchNm()%></span><br>
                      <label for="">전공&nbsp;</label>:&nbsp;&nbsp;<span class="board-title eduMajor" ><%=edu.getEduMajor()%></span><br>
       
  
         <%
         					if(edu.getEduCodeNm().equals("고등학교졸업") ){
         %>
         				   <label for="">평점&nbsp;</label>:&nbsp;&nbsp;해당없음<br>
                   	
         					
         <% 					
         					}else{
         %>
                      <label for="">평점&nbsp;</label>:&nbsp;&nbsp;<span class="board-title eduGraAvg" ><%=edu.getEduGraAvg()%></span> &nbsp;/&nbsp;<span class="board-title eduGraTot" ><%=edu.getEduGraTot() %></span><br>
                    </span>
          <%
         					 } 
          %>     
                   
                  </div>          
                </div>
              </div>
<% 				
				}
			}
		}
%>
              
            </div>
          </div>
        </div>

        <!-- 경력 -->
        <div id="crr" class="content-box search-result board board-main board-best">
          <div class="board-header">
            <div class="board-name">
              <h1 class="h1">경력</h1>
            </div>
          </div>
          <div class="board-body">
            <div class="divider"></div>
            <!-- 아코디언 : 게시판 게시글들 시작 -->
            <div id="accordion">
              <!-- 게시글의 한단위  -->
              <!-- card-hear 안 a태그와 게시글의 아이디를 맞춰주세요 -->
              
<%
	if(crrListSize==0){
%>
	<p style="text-align: center;">경력정보가 없습니다.</p>
<% 	
	}else{
		List<HRCrrVO> crrList = (List<HRCrrVO>)request.getAttribute("crrList"); 
		for(int i = 0; i < crrList.size(); i++){
			HRCrrVO crr = crrList.get(i);
			%>
			    <div class="card">
                <div class="card-header">
                  <a class="btn title-btn" data-bs-toggle="collapse" href="#or">
                    <span class="board-title crrCompNm"  ><%=crr.getCrrCompNm() %></span>&nbsp;&nbsp;&nbsp;<span class="board-title jtCodeNo" ><%=crr.getJtCodeNm() %></span>&nbsp;&nbsp;(<span class="board-title crrYears" >6</span>년차)
                  </a>
                </div>
                <!-- 게시글을 담고있는 곳 a 태그가 가르키는 곳 -->
                <div id="or" class="collapse " data-bs-parent="#accordion">
                  <div class="card-body">
                   
                    <span class="board-detail-content">
                      <label for="">회사&nbsp;</label>:&nbsp;&nbsp;<span class="board-title crrCompNm" ><%=crr.getCrrCompNm() %></span><br>
                      <label for="">직급&nbsp;</label>:&nbsp;&nbsp;<span class="board-title crrRank" ><%=crr.getCrrRank() %></span><br>
                      <label for="">연차&nbsp;</label>:&nbsp;&nbsp;<span class="board-title crrYears" ><%=crr.getCrrYears() %></span>년차<br>
                      <label for="">직군&nbsp;</label>:&nbsp;&nbsp;<span class="board-title jgCodeNo" ><%=crr.getJgCodeNm() %></span><br>
                      <label for="">직무&nbsp;</label>:&nbsp;&nbsp;<span class="board-title jtCodeNo" ><%=crr.getJtCodeNm() %></span>
                      
                    </span>
                  </div>
                
            
                </div>
              </div>				
			<%
		}
	}
%>              
 
            </div>
          </div>
        </div>
        <!-- 활동분야  -->
        <div id="pl" class="content-box search-result board board-main board-best">
          <div class="board-header">
            <div class="board-name">
              <h1 class="h1">활동분야</h1>
            </div>
          </div>
          <div class="divider"></div>
<%
if (plListSize==0){
%>
<p style="text-align: center;">활동분야 정보가 없습니다.</p>
<% 	
}else{
	List<ProgLangVO> plList = (List<ProgLangVO>)request.getAttribute("plList"); 	
	for(int i = 0 ; i < plList.size() ; i ++){
		ProgLangVO pl = plList.get(i);
%>

		<div class="board-card">
            <div class="board-detail">
              <a href="#" class="card-link"><span class="board-title company-name plCodeNm" ><%=pl.getPlCodeNm() %>t</span></a>&nbsp;&nbsp;
            </div>
          </div>

		
<% 		
	}
}
%>                
    
        </div>
        <!-- 자격증  -->
        <div id="cert" class="content-box search-result board board-main board-best">
          <div class="board-header">
            <div class="board-name">
              <h1 class="h1">자격증</h1>
            </div>
          </div>
          <div class="divider"></div>
<% 
	if(certListSize==0){
%>
<p style="text-align: center;">자격증 정보가 없습니다.</p>
<%		
	}else{
		List<CertificationVO> certList = (List<CertificationVO>)request.getAttribute("certList");
		for(int i = 0 ; i < certList.size(); i ++){
		CertificationVO cert = certList.get(i);
%>
  		<div class="board-card">
            <div class="board-detail">
              <a href="#" class="card-link"><span class="board-title company-name certCodeNm" ><%=cert.getCertCodeNm() %></span></a>&nbsp;&nbsp;          
            </div>
          </div>
<%						
		}
	}
%>          
  
        
        </div>
  </div>
</div>
      </div>
  <!--  풋터-->
  <div id="footer">
    <div id="footer-container"></div>
  </div>


</body>

</html>