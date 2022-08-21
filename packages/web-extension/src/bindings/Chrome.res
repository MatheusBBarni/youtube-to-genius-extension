type tabs
type scripting

type chrome = {
  tabs: tabs,
  scripting: scripting,
}

@val external chrome: chrome = "chrome"

type tab = {
  url: string,
  active: bool,
  highlighted: bool,
  id: int,
}

type queryInfo = {active: bool, currentWindow: bool}

@send external query: (tabs, queryInfo, array<tab> => unit) => unit = "query"

type target = {tabId: int}

type func = unit => option<string>

type scriptingParams = {
  target: target,
  func: func,
}

type scriptingResult = {result: string}

@send
external executeScript: (scripting, scriptingParams, array<scriptingResult> => unit) => unit =
  "executeScript"

let getActiveTabs = chrome.tabs->query
let executeScript = chrome.scripting->executeScript

// Why I did this sh*t?
// Because this function is injected on the tab page
// And it was not finding some Rescript modules
// Using raw, I guarantee that the output will be just plain JS, without the Rescript modules
let getYoutubeMusicTextContent: unit => option<
  string,
> = %raw(`function() {return document.querySelector("#container > h1 > yt-formatted-string")?.textContent}`)
