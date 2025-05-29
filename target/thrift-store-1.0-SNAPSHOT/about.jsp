<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>About</title>
    <%@include file="components/common_css_js.jsp" %>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <%@include file="components/navbar.jsp" %>
    <div class="about-container">
    <div class="about-page">
    <section class="intro text-center">
        <h1 class="about-heading">About Us.</h1>
        <p>
            <b>ThriftBU</b> is a platform created to redefine shopping. Inspired by the hustle of college students and the spirit of everyday convenience, we offer a seamless experience across lifestyle, groceries, and essentials.
        </p>
        <p>
            With a growing network of trusted vendors and a tech-first mindset, we deliver joy with every package, and value with every transaction.
        </p>
    </section>

    <section class="image-block">
        <img src="img/thrift.png" alt="Team at work">
    </section>

        <h6 class="text-center">
        <blockquote>
            “Our mission only makes sense when it truly serves your life, time, and needs.”<br>
            <span>— ThriftBU Team</span>
        </blockquote>
    </h6>

    <section class="team-intro">
        <div class="member-image">
            <img src="img/shop.jpeg" alt="Team Member">
        </div>
        <div class="team-text">
            <h2>The Team.</h2>
            <p>
                We're not just a company; we're a crew of thinkers, doers, and dreamers. From local delivery agents to the backend builders — everyone at ThriftBU shares one goal: making your day better.
            </p>
        </div>
    </section>
</div>
</div>

<%@include file="components/common_modals.jsp" %>

</body>
</html>

