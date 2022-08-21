module Colors = {
  let youtubeColor = "#FF0000"
  let geniusColor = "#FFFC64"
  let black = "#101010"
}

module Constants = {
  type queryInfo = {active: bool, currentWindow: bool}
  let font = "'Noto Sans JP', sans-serif"
  let ytVideoParam = "v"
  let ytPathName = "/watch"
  let ytHostname = "www.youtube.com"
  let iconSize = 30.
  let musicSelector = "#container > h1 > yt-formatted-string"
  let musicSelectorSpan = "#container > h1 > yt-formatted-string > span:nth-child(1)"
  let queryInfo: Chrome.queryInfo = {active: true, currentWindow: true}
  @val @scope(("process", "env")) external geniusAccesToken: string = "GENIUS_ACCESS_TOKEN"
}
