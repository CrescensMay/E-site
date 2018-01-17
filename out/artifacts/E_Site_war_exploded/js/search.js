var $results = $('#result-video');
var $buttons = $('#btn');
var $search = $('#searchField');
var $heading = $('.video-heading');
var query;

$(function () {
    //prevent page to load earlier
    $('#search-form').on('submit', function (e) {
        e.preventDefault();
        searchVideo();
    });

    $('#searchSubmit').onclick(function (e) {
        e.preventDefault();
        searchVideo();
    });
});

//create searchVideo function
function searchVideo() {
    //clear result first no overlapping
    $results.html('');
    $buttons.html('');

    //get form input
    query = $search.val();

    //run get request on API
    // specific to a particular API or API method
    $.get(
        'https://www.googleapis.com/youtube/v3/search',
        {
            part: 'snippet, id',
            q: query,
            type: 'video',
            key:'AIzaSyDBFWMwiOM6ptHRrQpTw_8cVUzJyULucIA'
            // maxResults: '25'
        },
        function (data) {
            //go through paging
            var prevPageToken  = data.prevPageToken;
            var nextPageToken = data.nextPageToken;
            var loadVideo = data.nextPageToken;

            console.log(data);

            //looping through the items
            $.each(data.items, function (i, item) {
                //getting output
                var outpout = getOutput(item);
                //appending result
                $results.append(outpout);
            });

            //creating paging buttons
            var buttons = getButtons(prevPageToken, nextPageToken);
            var button = loadNextVideos(loadVideo);

            //displaying buttons
            $buttons.append(button);
            $buttons.append(buttons);
        }
    );
}

//Next page function
function nextPage() {
    var $nextBtn = $('#next-btn');
    var token = $nextBtn.data('token');
    var qry = $nextBtn.data('query');
    //clear result first no overlapping
    $results.html('');
    $buttons.html('');

    //get from input
    query = $search.val();

    //run get request on API
    // specific to a particular API or API method
    $.get(
        'https://www.googleapis.com/youtube/v3/search',
        {
            part: 'snippet, id',
            q: query,
            pageToken: token,
            type: 'video',
            key:'AIzaSyDBFWMwiOM6ptHRrQpTw_8cVUzJyULucIA'
            // maxResults: '25'
        },
        function (data) {
            //go through paging
            var prevPageToken  = data.prevPageToken;
            var nextPageToken = data.nextPageToken;
            var loadVideo = data.nextPageToken;

            console.log(data);

            //looping through the items
            $.each(data.items, function (i, item) {
                //getting output
                var outpout = getOutput(item);
                //appending result
                $results.append(outpout);
            });

            //creating paging buttons
            var buttons = getButtons(prevPageToken, nextPageToken);
            var button = loadNextVideos(loadVideo);

            //displaying buttons
            $buttons.append(button);
            $buttons.append(buttons);
        }
    );
}

//Previous page function
function prevPage() {
    var $prevBtn = $('#prev-btn');
    var token = $prevBtn.data('token');
    var qry = $prevBtn.data('query');
    //clear result first no overlapping
    $results.html('');
    $buttons.html('');

    //get form input
    query = $search.val();

    //run get request on API
    // specific to a particular API or API method
    $.get(
        'https://www.googleapis.com/youtube/v3/search',
        {
            part: 'snippet, id',
            q: query,
            pageToken: token,
            type: 'video',
            key:'AIzaSyDBFWMwiOM6ptHRrQpTw_8cVUzJyULucIA'
            // maxResults: '25'
        },
        function (data) {
            //go through paging
            var prevPageToken  = data.prevPageToken;
            var nextPageToken = data.nextPageToken;
            var loadVideo = data.nextPageToken;

            console.log(data);

            //looping through the items
            $.each(data.items, function (i, item) {
                //getting output
                var output = getOutput(item);
                //appending result
                $results.append(output);
            });

            //creating paging buttons
            var buttons = getButtons(prevPageToken, nextPageToken);
            var button = loadNextVideos(loadVideo);

            //displaying buttons
            $buttons.append(button);
            $buttons.append(buttons);
        }
    );
}

//building output
function getOutput(item) {
    var videoId = item.id.videoId;
    var title = item.snippet.title;
    var description = item.snippet.description;
    var thumb = item.snippet.thumbnails.high.url;
    var channelTitle = item.snippet.channelTitle;
    var videoDate = item.snippet.publishedAt;
    var output = '';
    //Build ouptput string
    output = '<li class="list-item">' +
        '<div class="list-left">' +
        '<img src="' + thumb + '">' +
        '</div>' +
        '<div class="list-right">' +
        '<h3>' + title + '</h3>' +
        '<small>By <span class="cTitle">' + channelTitle + ' </span> on ' + videoDate + '</small>' +
        '<p>' + description + '</p>' +
        '</div>' +
        '</li>' +
        '<div class="clearfix"></div>' +
        '';

    return output;


}

//Build buttons
function getButtons(prevPageToken, nextPageToken) {
    var btnOutput;
    if(!prevPageToken){
        btnOutput = '<div class="btn-container">' +
            '<button id="next-btn" class="paging-btn" data-token="' + nextPageToken + '" data-query="' + query + '"' +
            ' onclick="nextPage();">Next</button>' +
            '</div>';
    }else {
        btnOutput = '<div class="btn-container">' +
            '<button id="prev-btn" class="paging-btn" data-token="' + prevPageToken + '" data-query="' + query + '"' +
            ' onclick="prevPage();">Prev</button>' +
            '<button id="next-btn" class="paging-btn" data-token="' + nextPageToken + '" data-query="' + query + '"' +
            ' onclick="nextPage();">Next</button>' +
            '</div>';
    }

    return btnOutput;
}

//same method as beneath one but single button here to load videos
function loadNextVideos(loadVideo) {

    var loadBtn;
        loadBtn = '<div class="lbtn-container">' +
        '<button id="load-btn" class="pagingLoad-btn" data-token="' + loadVideo + '" data-query="' + query + '"' +
        ' onclick="nextLoads();">Load more</button>' +
        '</div>';

    return loadBtn;
}

//initialize API
// function init() {
//     gapi.client.setApiKey("YOUR_PUBLIC_KEY");
//     gapi.client.load("youtube", "v3", function () {
//         // yt api is ready
//     });
// }