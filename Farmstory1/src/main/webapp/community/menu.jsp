<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리::장보기</title>
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
            <div><img src="/Farmstory1/img/sub_top_tit5.png" alt="COMMUNITY"></div>
            <section class="cate5">
                <aside>
                    <img src="/Farmstory1/img/sub_aside_cate5_tit.png" alt="커뮤니티">
                    <ul class="lnb">
                        <li><a href="/Farmstory1/community/notice.jsp">공지사항</a></li>
                        <li class="on"><a href="/Farmstory1/community/menu.jsp">오늘의식단</a></li>
                        <li><a href="/Farmstory1/community/chef.jsp">나도요리사</a></li>
                        <li><a href="/Farmstory1/community/qna.jsp">1:1고객문의</a></li>
                        <li><a href="/Farmstory1/community/faq.jsp">자주묻는질문</a></li>
                    </ul>
                </aside>
                <article>
                    <nav>
                        <img src="/Farmstory1/img/sub_nav_tit_cate5_tit2.png" alt="오늘의식단">
                        <p>
                            HOME > 커뮤니티 > 
                            <em>오늘의식단</em>
                        </p>
                    </nav>
                    <!-- 내용 시작 -->
                    <img src="/Farmstory1/img/board_list.png" alt="">
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