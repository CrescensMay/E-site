<div id="myModal" class="modal">
    <div id="details">
        <span class="close">&times;</span>
        <ul class="corps">
            <li><img src="data:image/png;base64,${requestScope['cover']}" width="200" height="220" style="position: relative;right: 25px;"></li>
            <li>
                <ul style="line-height: 30px;">
                    <li class="nada"><small style="text-decoration: underline">Title: </small><big><b><%=request.getAttribute("title")%></b></big></li>
                    <li class="nada"><small style="text-decoration: underline">Author: </small><cite><big>${requestScope['author']}</big></cite></li>
                    <li class="nada"><small style="text-decoration: underline">Published date: </small><span>${requestScope['date']}</span></li>
                </ul>
            </li>
        </ul>
        <hr style="clear:both; width:100%;color: #ffffff;position:relative;top: 5px;">
        <h3 style="text-decoration: underline">Description</h3>
        <p>je suis tres content de ce qui m'arrive deja merci Dieu car tu m'ouvres la tete concernant la programmation.</p>
    </div>
</div>
