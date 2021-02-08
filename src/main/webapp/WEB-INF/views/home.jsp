<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.register {
	color: black;
	padding-top: 10px;
}

select {
width: 100%;
padding: .8em .5em;
border: 1px solid #999;
font-family: inherit;
background: url('arrow.jpg') no-repeat 95% 50%;
border-radius: 0px;
-webkit-appearance: none;
-moz-appearance: none;
appearance: none;
}

</style>

<script>
var idChk = '';

$(function() {
	
	//로그인
	$("#btnLogin").on('click', function() {
	
		$.ajax({
			  url: '${pageContext.request.contextPath}/login' ,
			  data : $("#frmLogin").serialize(), 
			  success: function(data) {
				  if(data) {
					  alert("환영합니다.");
					  $(location).attr('href','${pageContext.request.contextPath}/home');
				  } else {
					  alert("아이디 또는 비밀번호가 일치하지 않습니다.");
				  }
			}
		});
	});
	
	//중복확인
	$("#idCheck").on('click', function() {
		$.ajax({
			  url: '${pageContext.request.contextPath}/idCheck' ,
			  data : {st_id : $("#st_id").val() }, 
			  success: function(data) {
				idChk = data;
				if(data) {
					alert("사용 가능한 아이디입니다.");
					$("#btnInsert").attr("disabled",false);
				} else {
					alert("중복된 아이디입니다.");
					$("#btnInsert").attr("disabled",true);
				}
			}
		});
	});
	
	//비밀번호 확인
	$("#st_pw").keyup(function(){ //비밀번호 입력할때
		$("#pwCheck").text(""); //유효성검사창 초기화
	});
	$("#st_pw2").keyup(function(){
		if( $("#st_pw").val() != $("#st_pw2").val() ){
			$("#pwCheck").text("비밀번호가 일치하지 않습니다.").css("color","red");
		}else{
			$("#pwCheck").text("비밀번호가 일치합니다.").css("color","green");
		}
	});
	
	
	
	
	// 회원가입
	$("#btnInsert").on('click', function() {
		//유효성검사
		
		if(!idChk) {
			alert("아이디 중복 체크를 확인하세요.");
		} else if() {
			
		}

		//insert하기
/* 		$.ajax({
			  url: '${pageContext.request.contextPath}/register' ,
			  data : $("#frmRegister").serialize(), 
			  success: function() {
				  alert("가입되었습니다.");
			}
		}); */
	});
	
	
});
</script>
<section>
<c:if test="${sessionScope.student.st_id eq null }" >
<div class="hero overlay" style="background-image: url('images/hero_bg_1.jpg');">
        
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-lg-12">

              <div class="row align-items-center justify-content-between">

                <div class="col-lg-5 intro">
                  <h1 class="text-white"><strong>Notary Public</strong> &amp; Legal Solutions</h1>
                  <p class="text-white">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis cupiditate deserunt placeat necessitatibus a aliquam corrupti nisi odio aliquid, accusamus.</p>
                </div>

                <div class="col-lg-5">
                  <form class="book-form" id="frmLogin">
                    <h3>LOGIN</h3>
                    <div class="row align-items-center">
                      <div class="mb-3 mb-md-4 col-md-12">
                        <input type="text" class="form-control" placeholder="ID" name="st_id">
                      </div>
                      <div class="mb-3 mb-md-4 col-md-12">
                        <input type="password" class="form-control" placeholder="PASSWORD" name="st_pw">
                        <div align="right" class="register">
                        <a data-toggle="modal" href="#registerModal" class="register">REGISTER</a>
                        </div>
                      </div>
                      
                      <div class="col-md-12">
                        <input type="button" value="LOGIN" class="btn btn-primary btn-block py-3" id="btnLogin">
                      </div>
                    </div>

                  </form>

                </div>
              </div>
              
              
            </div>
          </div>
        </div>
	</div>
</c:if>
      
<!-- Modal -->
<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">회원가입</h5>
      </div>
      <div class="modal-body">
      	<div class="">
			<form id="frmRegister">
				<div class="form-group row">
					<div class="col-md-8 mb-4 mb-lg-0">
						<input type="text" class="form-control" placeholder="아이디" id="st_id" name="st_id">
					</div>
					<div class="col-md-4">
						<input type="button" class="btn btn-primary btn-block" value="중복확인" id="idCheck"><!-- (INPUT태그 안에 넣어야지) -->
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-12 mb-4 mb-lg-0">
						<input type="text" class="form-control" placeholder="이름" id="st_name" name="st_name">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-6">
						<input type="password" class="form-control" placeholder="비밀번호" id="st_pw" name="st_pw">
					</div>
					<div class="col-md-6">
						<input type="password" class="form-control" placeholder="비밀번호 확인" id="st_pw2" name="st_pw2">
					</div>
					<div class="col-md-12 mb-4 mb-lg-0" style="padding-top: 10px;">
						<b id="pwCheck"></b>
					</div>
				</div>
				<div class="form-group row">
					
					<div class="col-md-4 mb-4 mb-lg-0">
						<input type="text" class="form-control" placeholder="학교" id="school" name="school">
					</div>
					<div class="col-md-4 mb-4 mb-lg-0">
						<input type="text" class="form-control" placeholder="전공" id="major" name="major">
					</div>
					
					<div class="col-md-4 mb-4 mb-lg-0">
						<select name="grade" id="grade">
							<option value="none">선택</option>
  							<option value="입학예정">입학예정</option>
  							<option value="졸업">졸업</option>
  							<option value="재학">재학</option>
						</select>
					</div>
					
				</div>
				
			</form>      	
      	</div>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-secondary" id="btnInsert" disabled="disabled">가입하기</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div><!-- modal end -->



<!-- 로그인 했을 때 보이는 거 (시간표, 쪽지알림, 게시판 조회수 top5 -->

<c:if test="${sessionScope.student.st_id ne null }" >
<div class="hero overlay" style="background-image: url('images/hero_bg_1.jpg');">
        
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-lg-12">

              <div class="row align-items-center justify-content-between">
				
				<!-- 왼쪽 -->
                <div class="col-lg-5 intro">
                  <h1 class="text-white"><strong>시간표</strong></h1>
                </div>
				<!-- 오른쪽 -->
                <div class="col-lg-5">
					<div>
						<h1>쪽지 알림</h1>
					</div>
					<p></p>
					<div>
						<h1>게시판 top5</h1>
					</div>
                </div>
              </div>

            </div>
          </div>
        </div>
	</div>
</c:if>




</section>
