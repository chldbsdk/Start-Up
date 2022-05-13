<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>낙원</title>
<style>
#allwrapper{
	margin-top: 10px;
	margin-bottom: 10px;
	display: flex;
	justify-content: center;
}
#container {
	overflow: hidden;
	width: 1000px;
	height: 500px;
	position: relative;
}
#btnRoadview,  #btnMap {
	position: absolute;
	top: 5px;
	left: 5px;
	padding: 7px 12px;
	font-size: 14px;
	border: 1px solid #dbdbdb;
	background-color: #fff;
	border-radius: 2px;
	box-shadow: 0 1px 1px rgba(0,0,0,.04);
	z-index:1;cursor:pointer;
}
#btnRoadview:hover,  #btnMap:hover{
	background-color: #fcfcfc;
	border: 1px solid #c1c1c1;
}
#container.view_map #mapWrapper {z-index: 10;}
#container.view_map #btnMap {display: none;}
#container.view_roadview #mapWrapper {z-index: 0;}
#container.view_roadview #btnRoadview {display: none;}
#location-allwrap {margin-top: 40px;}
#location-wrap {
	width: 1000px;
	margin: 0 auto;
}
#location-table {margin: 0 auto;}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9edaf335e3e730759227d72dfcd75fa4"></script>

</head>
<body>
<%@ include file="../main/top.jsp" %>

<div id="location-allwrap">
	<div id="location-wrap">
	<table id="location-table">
	<tr><td class="locationImg"><img src="resources/img/placeholder.png" width="30" height="30"></td><td class="locationDetail" style="width: 250px;">인천광역시 미추홀구 인하로 100</td>
		<td class="locationImg"><img src="resources/img/call.png" width="30" height="30"></td><td class="locationDetail">010-1234-5678</td>
	</tr>
	</table>
	</div>
</div>

<div id="allwrapper">
<div id="container" class="view_map">
    <div id="mapWrapper" style="width:100%;height:500px;position:relative;">
        <div id="map" style="width:100%;height:100%"></div> <!-- 지도 표시할 div -->
        <input type="button" id="btnRoadview" onclick="toggleMap(false)" title="로드뷰 보기" value="로드뷰">
    </div>
    <div id="rvWrapper" style="width:100%;height:500px;position:absolute;top:0;left:0;">
        <div id="roadview" style="height:100%"></div> <!-- 로드뷰 표시할 div -->
        <input type="button" id="btnMap" onclick="toggleMap(true)" title="지도 보기" value="지도">
    </div>
</div>
</div>


<script>
var container = document.getElementById('container'), //지도와 로드뷰를 감싸고 있는 div
    mapWrapper = document.getElementById('mapWrapper'), //지도를 감싸고 있는 div
    btnRoadview = document.getElementById('btnRoadview'), //지도 위의 로드뷰 버튼 
    btnMap = document.getElementById('btnMap'), //로드뷰 위의 지도 버튼
    rvContainer = document.getElementById('roadview'), //로드뷰를 표시할 div
    mapContainer = document.getElementById('map'); //지도를 표시할 div
    
//지도와 로드뷰 위에 마커로 표시할 장소(음식점) 좌표
var placePosition = new kakao.maps.LatLng(37.4480158, 126.6575041);
//지도 옵션
var mapOption = {
    center: placePosition, //지도의 중심좌표 
    level: 3 //지도의 확대 레벨
};
//지도를 표시할 div와 지도 옵션으로 지도를 생성
var map = new kakao.maps.Map(mapContainer, mapOption);
//지도 확대 축소를 제어할 수 있는 줌 컨트롤 생성
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMRIGHT);
//로드뷰 객체 생성
var roadview = new kakao.maps.Roadview(rvContainer);
//좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
var roadviewClient = new kakao.maps.RoadviewClient(); 
//음식점 좌표와 가까운 로드뷰의 파노라마Id를 추출하여 로드뷰를 띄움
roadviewClient.getNearestPanoId(placePosition, 50, function(panoId) {
    roadview.setPanoId(panoId, placePosition); //파노라마Id와 중심좌표를 통해 로드뷰 실행
});
//음식점이 잘보이도록 로드뷰의 적절한 시점(ViewPoint)을 설정 
roadview.setViewpoint({
    pan: 321,
    tilt: 0,
    zoom: 0
});
//마커 이미지 변경
var imageSrc = 'resources/img/marker.png', //마커이미지
imageSize = new kakao.maps.Size(64, 69), //마커이미지 크기
imageOption = {offset: new kakao.maps.Point(27, 69)}; //마커이미지 옵션: 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정
  
//마커의 이미지정보를 가지고 있는 마커이미지를 생성
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
//지도 중심을 표시할 마커를 생성하고 장소 위에 마커 표시
var mapMarker = new kakao.maps.Marker({
    position: placePosition,
    map: map,
    image: markerImage // 마커이미지 설정 
    
});
//마커 드래그 가능하도록 설정
mapMarker.setDraggable(true); 
//마커에 dragend 이벤트를 등록합니다
kakao.maps.event.addListener(mapMarker, 'dragend', function(mouseEvent) {
    // 현재 마커가 놓인 자리의 좌표입니다 
    var position = mapMarker.getPosition();
    // 마커가 놓인 위치를 기준으로 로드뷰를 설정합니다
    toggleRoadview(position);
});
//지도에 클릭 이벤트 등록: 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    //클릭한 위도, 경도 정보를 가져옴 
    var latlng = mouseEvent.latLng; 
    
    //마커 위치를 클릭한 위치로 옮김
    mapMarker.setPosition(latlng);
    
 	// 마커가 놓인 위치를 기준으로 로드뷰를 설정합니다
    toggleRoadview(latlng);
    
});
//전달받은 좌표(position)에 가까운 로드뷰의 파노라마 ID를 추출하여
//로드뷰를 설정하는 함수입니다
function toggleRoadview(position){
	roadviewClient.getNearestPanoId(position, 50, function(panoId) {
   
    // panoId로 로드뷰를 설정합니다
    roadview.setPanoId(panoId, position);
	});
}
//로드뷰 초기화가 완료되면 
kakao.maps.event.addListener(roadview, 'init', function() {
    //로드뷰에 특정 장소(클릭, 드래그 등)를 표시할 마커를 생성하고 로드뷰 위에 표시
    var rvMarker = new kakao.maps.Marker({
        position: toggleRoadview(position),
        map: roadview
    });
});
//지도와 로드뷰를 감싸고 있는 div의 class를 변경하여 지도를 숨기거나 보이게 하는 토글 함수
function toggleMap(active) {
    if (active) {
        //지도가 보이도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경
        container.className = "view_map"
    } else {
        //지도가 숨겨지도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경
        container.className = "view_roadview"   
        toggleRoadview(position); //로드뷰를 토글합니다
    }
}
//지도에 교통정보 표시하도록 지도타입 추가
map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
</script>

<%@ include file="../location/locationInfo.jsp" %>

<%@ include file="../main/footer.jsp" %>
</body>
</html>