// var $results = $('#result-video');
// var $buttons = $('#btn');
// var $search = $('#searchField');
// var $heading = $('.video-heading p');
//
// $('form').submit(function (e) {
//     e.preventDefault();
//     //if input null
//     if($search.val() === ''){
//         alert('Cannot remain empty');
//     }else {
//         searchBook();
//     }
//
// });
//
// //load videos on page load
// function searchBook() {
//     //clear result first no overlapping
//     $results.html('');
//     $buttons.html('');
//     $heading.html('');
//
//     var query = $search.val();
//     $.get(
//         'https://www.googleapis.com/books/v1/volumes',
//         {
//             q: query,
//             maxResults: '24'
//         },
//         function (data) {
//             //go through paging
//             // var loadVideo = data.nextPageToken;
//             // var pageInfo = data.pageInfo.totalResults;
//
//             $.each(data.items, function (i, item) {
//                 var outPut = getOutput(item);
//                 console.log(data);
//
//                 //append output to the html page and total results
//                 $results.append(outPut);
//             });
//             //append total results
//             // $heading.append('About ' + pageInfo + ' results');
//
//             // var button = loadNextVideos(loadVideo);
//             //displaying buttons
//             // $buttons.append(button);
//         }
//     );
// }
//
//
// //building output for search
// function getOutput(item) {
//     // var bookId = item.id;
//     var author = item.volumeInfo.authors;
//     var title = item.volumeInfo.title;
//     // var description = item.snippet.description;
//     var thumb = item.volumeInfo.imageLinks.smallThumbnail;
//     var publishDate = item.volumeInfo.publishedDate;
//     var publisher = item.volumeInfo.publisher;
//     var previewLink = item.volumeInfo.previewLink;
//     // var pdf = item.accessInfo.pdf.downloadLink;
//     // var webReaderLink = item.accessInfo.pdf.webReaderLink;
//     var output = '';
//     //Build ouptput string
//     output = '<li class="list-item">' +
//         '<div class="list-left">' +
//         '<a data-fancybox="gallery" href="' + previewLink + '">' +
//         '<img src="' + thumb + '" title="' + 'rien ici' + '"></a>' +
//         '</div>' +
//         '<div class="list-right">' +
//         '<h3><a data-fancybox="gallery" href="' + previewLink + '">' + title + '</a></h3>' +
//         '<small class="channel-date">Author: <span class="cTitle">' + author + ' </span>' + '</small>' +
//         '<small class="channel-date">Pusblisher : <span class="cTitle">' + publisher + ' </span>' + '</small>' +
//         '<small class="channel-date">Published Date : <span class="cTitle">' + publishDate + ' </span>' + '</small>' +
//         // '<p>' +  + '</p>' +
//         '</div>' +
//         '</li>' +
//         '<div class="clearfix"></div>' +
//         '';
//
//     return output;
// }
//
// // //Build output for main page
// // function getMainOutput(item) {
// //     var videoId = item.id.videoId;
// //     var title = item.snippet.title;
// //     var description = item.snippet.description;
// //     var thumb = item.snippet.thumbnails.high.url;
// //     var channelTitle = item.snippet.channelTitle;
// //     var videoDate = item.snippet.publishedAt;
// //
// //     var output = '';
// //     //Build ouptput string
// //     output = '<li class="list-item-main">' +
// //         // '<div class="list-div-main">' +
// //         '<a data-fancybox href="http://www.youtube.com/embed/' + videoId + '">' +
// //         '<img src="' + thumb + '" title="' + description + '">' +
// //         '<h5 style="margin-left: 2px;"><a data-fancybox href="http://www.youtube.com/embed/' + videoId + '">' + title + '</a></h5>' +
// //         '<small class="channel-date">By <span class="cTitle">' + channelTitle + ' </span><br>' + videoDate + '</small>' +
// //         '</a>' +
// //         '</li>' +
// //         '';
// //     return output;
// // }
// //
// // //Build buttons
// // function getButtons(prevPageToken, nextPageToken) {
// //     var btnOutput;
// //     if(!prevPageToken){
// //         btnOutput = '<div class="btn-container">' +
// //             '<button id="next-btn" class="paging-btn" data-token="' + nextPageToken + '" data-query="' + query + '"' +
// //             ' onclick="nextPage();">Next</button>' +
// //             '</div>';
// //     }else {
// //         btnOutput = '<div class="btn-container">' +
// //             '<button id="prev-btn" class="paging-btn" data-token="' + prevPageToken + '" data-query="' + query + '"' +
// //             ' onclick="prevPage();">Prev</button>' +
// //             '<button id="next-btn" class="paging-btn" data-token="' + nextPageToken + '" data-query="' + query + '"' +
// //             ' onclick="nextPage();">Next</button>' +
// //             '</div>';
// //     }
// //
// //     return btnOutput;
// // }
// //
// // //same method as beneath one but single button here to load videos
// // function loadNextVideos(nextPageToken) {
// //
// //     var loadBtn;
// //     loadBtn = '<div class="lbtn-container">' +
// //         '<button id="load-btn" class="pagingLoad-btn" data-token="' + nextPageToken  + '"' +
// //         ' onclick="nextLoads();">Load more</button>' +
// //         '</div>';
// //
// //     return loadBtn;
// //}