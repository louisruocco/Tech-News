$key = Get-Content "E:\Code\Tech News\info.txt"

$req = Invoke-RestMethod "https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UC0m-80FnNY2Qb7obvTL_2fA&channelType=any&maxResults=1&order=date&key=$key"

$today = Get-Date -Format "yyyy-MM-dd"
$yesterday = (Get-Date).AddDays(-1).ToString('yyyy-MM-dd')
$twodaysago = (Get-Date).AddDays(-2).ToString('yyyy-MM-dd')

$vidDate = $req.items.snippet.publishTime -replace "T.*"

$videoUrl = $req.items.id.videoId

if($vidDate -eq $today -or $vidDate -eq $yesterday -or $vidDate -eq $twodaysago ){
    Start-Sleep 5
    Start-Process msedge https://www.youtube.com/watch?v=$videoUrl
}