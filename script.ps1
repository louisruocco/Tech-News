$key = Get-Content ./info.txt

$req = Invoke-RestMethod "https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCFtEEv80fQVKkD4h1PF-Xqw&maxResults=1&order=date&type=video&key=$key"

$date = Get-Date -Format "yyyy-MM-dd"

$vidDate = $req.items.snippet.publishTime -split 'T' -replace $vidDate[1], ''

$videoUrl = $req.items.id.videoId

if($date -eq $vidDate){
    Start-Process msedge https://www.youtube.com/watch?v=$videoUrl
}
