<%@page import="java.util.Random"%>
<%@page import="com.learn.thriftstore.entities.User"%>
<% 

    User user1=(User)session.getAttribute("current-user");
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Order Confirmed</title>
    <%@include file="components/common_css_js.jsp" %> 

    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            font-family: 'Poppins', sans-serif;
            background-attachment: fixed;
        }
        
        .card {
            background: rgba(0, 0, 0, 0.6); 
            backdrop-filter: blur(15px); 
            border-radius: 20px;
            padding: 60px 80px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
            text-align: center;
            color: white;
            width: 600px;
        }

        .tick-icon {
            width: 100px;
            height: 100px;
            background: #2ecc71;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 30px;
        }

        .tick-icon svg {
            width: 50px;
            height: 50px;
            color: white;
        }

        .thank-you-text {
            font-size: 40px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .order-text {
            font-size: 18px;
            margin-bottom: 20px;
            color: #e0e0e0;
        }

        .order-id {
            font-size: 20px;
            margin-bottom: 30px;
            color: #2ecc71;
            font-weight: bold;
        }

        .btn-success {
            background-color: #2ecc71;
            border: none;
            padding: 12px 30px;
            border-radius: 30px;
            font-size: 18px;
            color: white;
            cursor: pointer;
            text-decoration: none;
            transition: 0.3s;
            display: inline-block;
            margin-top: 20px;
        }

        .btn-success:hover {
            background-color: #27ae60;
            transform: scale(1.05);
        }

        .footer-text {
            margin-top: 30px;
            font-size: 14px;
            color: #bdbdbd;
            font-style: italic;
        }
    </style>

    <!-- Include Canvas Confetti Script -->
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.4.0/dist/confetti.browser.min.js"></script>
</head>

<body>

    <div class="card">
        <div class="tick-icon">

            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
            </svg>
        </div>

        <div class="thank-you-text">
            Thank You!
        </div>

        <div class="order-text">
            Your order has been successfully placed 🎉 <br>
            Thank you for shopping with <strong>ThriftBU</strong>!<br><br>
            Your order details will be sent to your mobile number: <%= ((User)session.getAttribute("current-user")).getUserPhone() %>
        </div>

        <div class="order-id">
            <%
            Random rand = new Random();
            int number = rand.nextInt(1000000); 
            out.println("Order ID: #"+number);
        %>
            
        </div>

        <a href="index.jsp" class="btn-success">Continue Shopping</a>

        <div class="footer-text">
            ThriftBU — Sustainable Fashion, Delivered with Love 💚
        </div>
    </div>

    <script>
        // Full-screen confetti effect when the page loads
        window.onload = function() {
            confetti({
                particleCount: 300,
                spread: 70,
                origin: { y: 0.6 },
                scalar: 1.2
            });
        }
    </script>

</body>
</html>









