<%--
  Created by IntelliJ IDEA.
  User: Crescens
  Date: 13/01/2018
  Time: 6:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.2.0.min.js"></script>
    <title>Home</title>
  </head>
  <body>
  <header>
    <ul>
      <li><img src="images/menu3.png" id="menu-icon" height="30" width="30" alt="menu-icon" title="Menu"></li>
      <li><img src="images/logo1.png" id="logo" alt="sign-up" height="45" width="45"></li>
      <li><p>eTube</p></li>
      <li>
        <div id="searchGroup">
          <input type="text" name="search" id="searchBox" placeholder="Enter search keyword" required>
          <input type="submit" name="searchSubmit" id="searchSubmit" value="Search" title="Search">
        </div>
      </li>
      <li><img src="images/upload2.png" id="upload-icon" height=25" width="25" alt="upload-icon" title="Upload"></li>
    </ul>
  </header>
  <nav>
    <ul>
      <li class="menu-item home"><a href="">Home</a></li>
      <li class="menu-item movies"><a href="">Movies</a></li>
      <li class="menu-item tv-show"><a href="">TV-Shows</a></li>
      <li class="menu-item music"><a href="">Music</a></li>
      <li class="menu-item e-book"><a href="">E-Books</a></li>
      <%--<li id="upload-links"><a href="">Upload</a>--%>
        <%--<ul id="upload-children">--%>
          <%--<li><a href="">Movie</a></li>--%>
          <%--<li><a href="">TV-Show</a></li>--%>
          <%--<li><a href="">Music</a></li>--%>
          <%--<li><a href="">Music</a></li>--%>
          <%--<li><a href="">E-Book</a></li>--%>
        <%--</ul>--%>
      <%--</li>--%>
    </ul>
  </nav>
  <div>

  </div>
  <script type="text/javascript" src="js/script.js"></script>
  <script type="text/javascript" src="js/jquery.js"></script>
  </body>
</html>
