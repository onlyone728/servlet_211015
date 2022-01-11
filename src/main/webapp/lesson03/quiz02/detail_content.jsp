<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
// 아티스트 정보 

Map<String, Object> artistInfo = new HashMap<>();
artistInfo.put("name", "아이유");
artistInfo.put("debute", 2008);
artistInfo.put("agency", "EDAM엔터테인먼트");
artistInfo.put("photo", "http://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/867/444/81867444_1616662460652_1_600x600.JPG");

// 아이유 노래 리스트 
List<Map<String, Object>> musicList = new ArrayList<>();

Map<String, Object> musicInfo = new HashMap<>();
musicInfo.put("id", 1);
musicInfo.put("title", "팔레트");
musicInfo.put("album", "Palette");
musicInfo.put("singer", "아이유");
musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
musicInfo.put("time", 217);
musicInfo.put("composer", "아이유");
musicInfo.put("lyricist", "아이유");
musicList.add(musicInfo);

musicInfo = new HashMap<>();
musicInfo.put("id", 2);
musicInfo.put("title", "좋은날");
musicInfo.put("album", "Real");
musicInfo.put("singer", "아이유");
musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/3/3c/IU_-_Real.jpg");
musicInfo.put("time", 233);
musicInfo.put("composer", "이민수");
musicInfo.put("lyricist", "김이나");
musicList.add(musicInfo);

musicInfo = new HashMap<>();
musicInfo.put("id", 3);
musicInfo.put("title", "밤편지");
musicInfo.put("album", "palette");
musicInfo.put("singer", "아이유");
musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
musicInfo.put("time", 253);
musicInfo.put("composer", "제휘,김희원");
musicInfo.put("lyricist", "아이유");
musicList.add(musicInfo);

musicInfo = new HashMap<>();
musicInfo.put("id", 4);
musicInfo.put("title", "삐삐");
musicInfo.put("album", "삐삐");
musicInfo.put("singer", "아이유");
musicInfo.put("thumbnail",
		"https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/111/535/81111535_1539157728291_1_600x600.JPG");
musicInfo.put("time", 194);
musicInfo.put("composer", "이종훈");
musicInfo.put("lyricist", "아이유");
musicList.add(musicInfo);

musicInfo = new HashMap<>();
musicInfo.put("id", 5);
musicInfo.put("title", "스물셋");
musicInfo.put("album", "CHAT-SHIRE");
musicInfo.put("singer", "아이유");
musicInfo.put("thumbnail",
		"https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/080/724/877/80724877_1445520704274_1_600x600.JPG");
musicInfo.put("time", 194);
musicInfo.put("composer", "아이유,이종훈,이채규");
musicInfo.put("lyricist", "아이유");
musicList.add(musicInfo);

musicInfo = new HashMap<>();
musicInfo.put("id", 6);
musicInfo.put("title", "Blueming");
musicInfo.put("album", "Love poem");
musicInfo.put("singer", "아이유");
musicInfo.put("thumbnail",
		"https://upload.wikimedia.org/wikipedia/ko/6/65/%EC%95%84%EC%9D%B4%EC%9C%A0_-_Love_poem.jpg");
musicInfo.put("time", 217);
musicInfo.put("composer", "아이유,이종훈,이채규");
musicInfo.put("lyricist", "아이유");
musicList.add(musicInfo);
%>

<%

/* String keyword = request.getParameter("keyword");
String id = request.getParameter("id"); */

/* Iterator<Map<String, Object>> iter = musicList.iterator();
while (iter.hasNext()){
	Map<String, Object> item = iter.next();
	 if (Integer.valueOf(id) == (int)item.get("id")) { */

/* 풀이 */
// 상세 곡 정보를 보여줄 target Map 세팅
Map<String, Object> target = null;

	 // 1. 목록에서 클릭해서 들어온 경우(a tag) - id 값
	 if (request.getParameter("id") != null) {
		 int id = Integer.parseInt(request.getParameter("id"));
		 // out.print("######### id " + id);
		 
		 for (Map<String, Object> music : musicList) {
			 if ((int)music.get("id") == id) {
				 target = music;
				 break;
			 }
		 }
		// out.print(target);
	 }
	 
	 // 2. search 검색어로 유입되는 경우
	 if (request.getParameter("search") != null) {
		 String search = request.getParameter("search");
		 // out.print("##########search" + search);
		 
		for (Map<String, Object> music : musicList) {
			String title = (String)music.get("title");
			if (title.equals(search)) {
				target = music;
				break;
			}
		}
	 }
%>
<section>
	<%
		if (target != null) {
	%>
	<!-- 곡 정보 -->
	<div class="mt-3">
		<h3>곡 정보</h3>
		<div class="border border-success d-flex p-3">
			<div class="album-img mr-4">
				<img src="<%= target.get("thumbnail") %>" alt="앨범이미지" width="180">
			</div>
			<div class="album-info w-100">
				<h1 class="font-weight-lighter"><%= target.get("title") %></h1>
				<div class="text-success font-weight-bold"><%= target.get("singer") %></div>
				<!-- 풀이 -->
				<div class="d-flex mt-3 music-info-text">
					<div>
						앨범<br>재생시간<br>작곡가<br>작사가
					</div>
					<div class="ml-4">
						<%= target.get("album") %><br>
						<%= (int)target.get("time") / 60 %>:<%= (int)target.get("time") % 60 %><br>
						<%= target.get("composer") %><br>
						<%= target.get("lyricist") %>
					</div>
				</div>

				<%-- <table class="mt-2">
					<tr> 
						<td><small class="text-secondary">앨범</small></td>
						<td><small class="text-secondary"><%= target.get("album") %></small></td>
					</tr>
					<tr>
						<td><small class="text-secondary mr-2">재생시간</small></td>
						<td><small class="text-secondary"><%= (int)target.get("time") / 60 %>:<%= (int)item.get("time") % 60 %></small></td>
					</tr>
					<tr>
						<td><small class="text-secondary">작곡가</small></td>
						<td><small class="text-secondary"><%= target.get("composer") %></small></td>
					</tr>
					<tr>
						<td><small class="text-secondary">작사가</small></td>
						<td><small class="text-secondary"><%= target.get("lyricist") %></small></td>
					</tr>
				</table> --%>
			</div>
		</div>
	</div>
	
	<!-- 가사 -->
	<div class="mt-4">
		<h3>가사</h3>
		<hr>
		<div class="lyric">가사 정보 없음</div>
	</div>
	<%
		} // if 문 끝
		else {
	%>
	<h1>찾는 정보 없음</h1>
	<%
		}
	%>
</section>