$date = Get-Date

$req = Invoke-RestMethod 'https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCFtEEv80fQVKkD4h1PF-Xqw&maxResults=1&order=date&type=video&key=AIzaSyBD7heoYLk2epcRlDzOUONLYhCpL8INtRM'
# $req.items.snippet
$videoUrl = $req.items.id.videoId

# start msedge https://www.youtube.com/watch?v=$videoUrl