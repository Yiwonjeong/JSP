<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Jboard2</title>
    <link rel="stylesheet" href="/Jboard2/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
    <div id="wrapper">
        <header>
        	 <h3>Board System v2.0</h3>
            <p>
                <span>${sessUser.nick}</span>님 반갑습니다
                <a href="/Jboard2/user/info.do">[회원정보]</a>
                <a href="/Jboard2/user/logout.do">[로그아웃]</a>
            </p>
        </header>