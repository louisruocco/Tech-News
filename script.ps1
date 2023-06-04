$req = Invoke-RestMethod 'https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCFtEEv80fQVKkD4h1PF-Xqw&maxResults=1&order=date&type=video&key=AIzaSyBD7heoYLk2epcRlDzOUONLYhCpL8INtRM'

$date = Get-Date -Format "yyyy-MM-ddThh:mm:ssZ"
$date

$vidDate = $req.items.snippet.publishTime
$vidDate

$videoUrl = $req.items.id.videoId

if($date -ge $vidDate){
    Start-Process msedge https://www.youtube.com/watch?v=$videoUrl
}
