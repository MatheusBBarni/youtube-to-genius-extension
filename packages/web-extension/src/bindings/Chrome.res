type tab = {
  url: string,
  active: bool,
  highlighted: bool,
}

type queryInfo = {active: bool, currentWindow: bool}

type tabs
type chrome = {tabs: tabs}

// @val external tabs: tabs = "tabs"
@val external chrome: chrome = "chrome"
@send external query: (tabs, queryInfo, array<tab> => unit) => unit = "query"

let getActiveTabs = chrome.tabs->query

// chrome.tabs->query("a", activeTabs => {
//   open Js
//   Console.log(activeTabs)
// })
