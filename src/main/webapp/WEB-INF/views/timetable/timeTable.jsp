<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <!-- MiniColors -->
  <script src="${pageContext.request.contextPath}/color/jquery.minicolors.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/color/jquery.minicolors.css">

<style>
.hbox-menu { 
	margin-top:4px; 
	width:100%; 
	display: inline-block; 
	overflow: hidden; 
} 
.hbox-menu li { 
	float: left; 
	width:10%; 
	align-items: center;
} 
.hbox-menu a { 
	display: block;
	text-align:center; 
	height: 50px; 
	line-height: 50px; 
	background-color: #F0E7DB; 
	color: #666666; 
	font-weight:bold; 
} 
.hbox-menu li:last-child a { 
	border-right: 0; 
}

ul {
	list-style:none;
}

select {
width: 100%;
padding: .8em .5em;
border: 1px solid #999;
font-family: inherit;
border-radius: 0px;
-webkit-appearance: none;
-moz-appearance: none;
appearance: none;
background-color: white;
}
td {
	padding: 10px;
}
th {
	padding: 10px;
}

.time tr {
	  border-bottom: 1px solid black;
}


</style>

<script>
	$(function () {
		$("#addTime").on('click', function() {
			var week = $("#week :selected").val();
			var sb_time = parseInt( $("#sb_time :selected").val() );
			var sb_name = $("#sb_name").val();
			var tt_time = parseInt( $("#tt_time :selected").val() );

			var total = tt_time + sb_time;
			
			var background = $("#background").val();
			var color = $("#color").val();

			if( background == null || background == '') {
				background = 'yellow';
				$("#background").val('yellow')
			}
			
			if( color == null || color == '' ) {
				color = 'black';
				$("#color").val('black');
			}
			
			console.log("color", color);
			
			for(var i=tt_time; i<= total; i++) {
				$("#tr" + i).children().eq(week).text(sb_name).css( {'background-color':background , 'color': color} );
			}
		});
		
		$("#btnInsert").on('click', function() {
			$.ajax({
				  url: '${pageContext.request.contextPath}/timeTable/insert' ,
				  data : $("#frmInsert").serialize(), 
				  success: function() {
				  	alert("저장되었습니다.");
				}
			});
		});

		
	});
</script>




<section>



<div class="hero overlay" style="background-image: url('images/hero_bg_1.jpg'); height: 1000px;">

	<div class="" style="padding: 50px;">
	
		<div  style="padding-top: 200px;">

			<div class="row align-items-center justify-content-between" >
		        <div class="col-lg-4 ml-auto intro" >
		        	<div style="padding-top: 20px; width: 100%">
			        <form id="frmInsert" >
			        	<input id="st_id" name="st_id" value="${sessionScope.student.st_id}" style="display: none;">
			        	<table>
			        		<tr>
			        			<td></td>
			        			<td align="right"> <input type="button" value="추가" id="addTime" class="btn btn-secondary"> </td>
			        		</tr>
			        		<tr>
			        			<td>
			        				<select name="week" id="week">
										<option value="">요일</option>
			  							<option value="1">월</option>
			  							<option value="2">화</option>
			  							<option value="3">수</option>
			  							<option value="4">목</option>
			  							<option value="5">금</option>
									</select>
			        			</td>
			        			<td>
			        				<input placeholder="과목명" class="form-control" name="sb_name" id="sb_name">
			        			</td>
			        		</tr>
			        		<tr>
			        			<td>
			        				<select name="tt_time" id="tt_time">
										<option value="">시작시간</option>
			  							<option value="9">9시</option>
			  							<option value="10">10시</option>
			  							<option value="11">11시</option>
			  							<option value="12">12시</option>
			  							<option value="13">13시</option>
			  							<option value="14">14시</option>
			  							<option value="15">15시</option>
			  							<option value="16">16시</option>
			  							<option value="17">17시</option>
			  							<option value="18">18시</option>
			  							<option value="19">19시</option>
			  							<option value="20">20시</option>
									</select>
			        			</td>
			        			<td>
			        				<select name="sb_time" id="sb_time">
										<option value="">강의시간</option>
			  							<option value="0">1시간</option>
			  							<option value="1">2시간</option>
			  							<option value="2">3시간</option>
			  							<option value="3">4시간</option>
									</select>
			        			</td>
			        		</tr>
			        		<tr>
			        			<td>
					            	<input name="back_color" id="background" class="form-control" type="minicolors" data-swatch-position="left" placeholder="배경색" data-textfield="false" />
			        			</td>
			        			<td>
			        				<input name="color" id="color" class="form-control" type="minicolors" data-swatch-position="left" placeholder="글자색" data-textfield="false" />
			        			</td>
			        		</tr>
			        	</table>
			        </form>
		        	</div>
		        </div>
		
		        <div class="col-lg-8 ml-auto">
					 <div style="width: 100%">
					 	<div align="right" style="padding-bottom: 20px;"><input type="button" value="저장" id="btnInsert" class="btn btn-secondary"></div>
					 	<table style="width: 100%; background-color: white;" class="time" >
					 		<tr id="trWeek" align="center">
					 			<th></th>
					 			<th style="width: 200px;">월</th>
					 			<th style="width: 200px;">화</th>
					 			<th style="width: 200px;">수</th>
					 			<th style="width: 200px;">목</th>
					 			<th style="width: 200px;">금</th>
					 		</tr>
				 			<tr id="tr9">
				 				<td>9</td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 			</tr>
				 			<tr id="tr10">
				 				<td>10</td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 			</tr>
				 			<tr id="tr11">
				 				<td>11</td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 			</tr>
				 			<tr id="tr12">
				 				<td>12</td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 			</tr>
				 			<tr id="tr13">
				 				<td>13</td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 			</tr>
				 			<tr id="tr14">
				 				<td>14</td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 			</tr>
				 			<tr id="tr15">
				 				<td>15</td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 			</tr>
				 			<tr id="tr16">
				 				<td>16</td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 			</tr>

				 			<tr id="tr17">
				 				<td>17</td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 			</tr>
				 			<tr id="tr18">
				 				<td>18</td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 			</tr>
				 			<tr id="tr19">
				 				<td>19</td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 			</tr>
				 			<tr id="tr20">
				 				<td>20</td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 			</tr>	
					 	</table>
					 </div>
					 
		        </div>
			</div>
			
		</div> <!-- end  col-lg-12-->
	
	
	</div>

</div>




</section>





