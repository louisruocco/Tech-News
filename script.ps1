$key = Get-Content ./info.txt

$req = Invoke-RestMethod "https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCFtEEv80fQVKkD4h1PF-Xqw&maxResults=1&order=date&type=video&key=$key"

$today = Get-Date -Format "yyyy-MM-dd"
$yesterday = (Get-Date).AddDays(-1).ToString('yyyy-MM-dd')
$yesterday


$vidDate = $req.items.snippet.publishTime -replace "T.*"
$vidDate

$videoUrl = $req.items.id.videoId

if($vidDate -eq $today -or $vidDate -eq $yesterday ){
    Start-Process msedge https://www.youtube.com/watch?v=$videoUrl
}
