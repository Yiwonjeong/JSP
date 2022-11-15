<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/_header.jsp"%>
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
<%@ include file="/_footer.jsp"%>