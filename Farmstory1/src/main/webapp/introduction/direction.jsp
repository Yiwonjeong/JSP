<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리::찾아오시는길</title>
    <link rel="stylesheet" href="/Farmstory1/css/style.css">    
</head>
<body>
    <div id="wrapper">
        <header>
            <a href="/Farmstory1/index.jsp" class="logo"><img src="/Farmstory1/img/logo.png" alt="로고"/></a>
            <p>
                <a href="#">HOME |</a>
                <a href="#">로그인 |</a>
                <a href="#">회원가입 |</a>
                <a href="#">고객센터</a>
            </p>
            <img src="/Farmstory1/img/head_txt_img.png" alt="3만원 이상 무료배송"/>
            
            <ul class="gnb">
                <li><a href="/Farmstory1/introduction/hello.jsp">팜스토리소개</a></li>
                <li><a href="/Farmstory1/market/market.jsp"><img src="/Farmstory1/img/head_menu_badge.png" alt="30%"/>장보기</a></li>
                <li><a href="/Farmstory1/croptalk/story.jsp">농작물이야기</a></li>
                <li><a href="/Farmstory1/event/event.jsp">이벤트</a></li>
                <li><a href="/Farmstory1/community/notice.jsp">커뮤니티</a></li>
            </ul>
        </header>
        <div id="sub">
            <div><img src="/Farmstory1/img/sub_top_tit1.png" alt="INTRODUCTION"></div>
            <section class="cate1">
                <aside>
                    <img src="/Farmstory1/img/sub_aside_cate1_tit.png" alt="팜스토리소개">
                    <ul>
                        <li><a href="/Farmstory1/introduction/hello.jsp">인사말</a></li>
                        <li class="on"><a href="/Farmstory1/introduction/direction.jsp">찾아오시는길</a></li>
                    </ul>
                </aside>
                <article>
                    <nav>
                        <img src="/Farmstory1/img/sub_nav_tit_cate1_tit2.png" alt="찾아오시는길">
                        <p>
                            HOME > 팜스토리소개 >
                            <em>찾아오시는길</em>
                        </p>
                    </nav>
                    <!-- 내용 시작 -->
                    <p>
                        <strong>팜스토리</strong><br>
                        주소: 경기도 이천시 잘한다구 신난다동 123<br>
                        전화: 01-234-5678<br>
                    </p>
                    <p>
                        <strong>찾아오시는길</strong><br>
                        <!--
                            * 카카오맵 - 약도서비스
                            * 한 페이지 내에 약도를 2개 이상 넣을 경우에는
                            * 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.
                        -->
                        <!-- 1. 약도 노드 -->
                        <div id="daumRoughmapContainer1668421440818" class="root_daum_roughmap root_daum_roughmap_landing"></div>

                        <!-- 2. 설치 스크립트 -->
                        <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

                        <!-- 3. 실행 스크립트 -->
                        <script charset="UTF-8">
                            new daum.roughmap.Lander({
                                "timestamp" : "1668421440818",
                                "key" : "2cj5i",
                                "mapWidth" : "760",
                                "mapHeight" : "400"
                            }).render();
                        </script>
                        </p>
                    <!-- 내용 끝 -->
                </article>
            </section>
        </div>
        <footer>
            <img src="/Farmstory1/img/footer_logo.png" alt="로고"/>
            <p>
                (주)팜스토리 / 사업자등록번호 123-45-67890 / 통신판매업신고 제 2013-팜스토리구-123호 / 벤처기업확인 서울지방중소기업청 제 012345678-9-01234호<br />
                등록번호 팜스토리01234 (2013.04.01) / 발행인 : 홍길동<br />
                대표 : 홍길동 / 이메일 : email@mail.mail / 전화 : 01) 234-5678 / 경기도 성남시 잘한다구 신난다동 345<br />
                <em>Copyright(C)홍길동 All rights reserved.</em>
            </p>
        </footer>
    </div>
    
</body>
</html>