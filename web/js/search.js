var $results = $('#result-video');
var $buttons = $('#btn');
var $search = $('#searchField');
var query;

$(function () {
    //prevent page to load earlier
    $('#search-form').on('submit', function (e) {
        e.preventDefault();
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
            // var nextPageToken = data.nextPageToken;
            // var prevPageToken = data.prevPageToken;

            console.log(data);

            //looping through the items
            $.each(data.items, function (i, item) {
                var outpout = getOutput(item);
                //appending result
            });
        }
    );
}

//initialize API
// function init() {
//     gapi.client.setApiKey("YOUR_PUBLIC_KEY");
//     gapi.client.load("youtube", "v3", function () {
//         // yt api is ready
//     });
// }