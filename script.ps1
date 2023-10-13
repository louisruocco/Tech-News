$key = Get-Content "E:\Code\Tech News\info.txt"

$azure = Invoke-RestMethod "https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UC0m-80FnNY2Qb7obvTL_2fA&channelType=any&maxResults=1&order=date&key=$key"
$pixel = Invoke-RestMethod "https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCIG1k8umaCIIrujZPzZPIMA&maxResults=1&order=date&key=$key"

$today = Get-Date -Format "yyyy-MM-dd"
$yesterday = (Get-Date).AddDays(-1).ToString("yyyy-MM-dd")

$AzureVidDate = $azure.items.snippet.publishTime -replace "T.*"
$AzurevideoUrl = $azure.items.id.videoId

if($AzureVidDate -eq $today -or $AzureVidDate -eq $yesterday){
    Start-Sleep 2
    Start-Process msedge https://www.youtube.com/watch?v=$AzurevideoUrl
}