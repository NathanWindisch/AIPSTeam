function Invoke-BingQuery {
  param (
      [string]$Query,
      [string]$Language = "en-US",  # Default to English (US)
      [string]$UILanguage = "en",    # User interface language
      [int]$count = 20
  )
  
  $Key = $env:BINGAPIKEY
  $QueryString = [System.Net.WebUtility]::UrlEncode($Query)
  $Uri = "https://api.bing.microsoft.com/v7.0/search?q=$QueryString&mkt=$Language&setLang=$UILanguage&count=$count"

  $Headers = @{
      "Ocp-Apim-Subscription-Key" = $Key
  }
  
  $Results = Invoke-RestMethod -Uri $Uri -Headers $Headers
  return $Results
}


$query = "azure ai semantic search"

#$Results = Invoke-BingQuery -Query "PowerShell" -Language "pl-pl" -UILanguage "en"
$Results = Invoke-BingQuery -Query $query -count 1

# Display results
$url = ($Results.webPages.value | Select-Object url).url

# Search in German (Germany) with English UI
#$Results = Invoke-BingQuery -Query "PowerShell" -Language "de-DE" -UILanguage "en"

# Display results
#$Results.webPages.value | Select-Object name, url, snippet


#$url = "https://stackoverflow.com/questions/41052831/extract-lines-matching-a-pattern-from-all-text-files-in-a-folder-to-a-single-out"
#$url = "https://thewindowsclub.blog/pl/16-essential-powershell-commands-to-know/"
<#
#$content = (Invoke-WebRequest -Uri $url).Content
#$content

$response = Invoke-WebRequest -Uri $url
$text = $response.ParsedHtml.body.innerText

$text


$response = Invoke-WebRequest -Uri $url
$text = $response.Content -replace '<[^>]+>',''
$text
#>

#Install-Module -Name PowerHTML
#Import-Module PowerHTML





$html = Invoke-WebRequest -Uri $url


$code =@"
<!DOCTYPE html>
<html>
<head>
  <title>My First Webpage</title>
</head>
<body>
  <h1>Welcome to my webpage!</h1>
  <p>This is a simple paragraph.</p>
</body>
</html>
"@

 $text = ($html.Content | PowerHTML\ConvertFrom-HTML).innerText -replace '(?m)^\s*$', ''

 $a = $text | PSAOAI\Invoke-PSAOAIChatCompletion -SystemPrompt "Analyzer of text" -OneTimeUserPrompt -Mode Balanced -simpleresponse -usermessagelogfile "Summary text"
#$html.Content
#$text = $html.DocumentNode.InnerText
#$text