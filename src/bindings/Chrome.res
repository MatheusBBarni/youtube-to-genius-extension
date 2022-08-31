type scripting

module Tabs = {
  // Reference: https://developer.chrome.com/docs/extensions/reference/tabs/
  type t

  type tab = {
    url: string,
    active: bool,
    highlighted: bool,
    id: int,
  }

  type queryInfo = {active: bool, currentWindow: bool}

  @send external query: (t, queryInfo, array<tab> => unit) => unit = "query"
}

module Scripting = {
  // Reference: https://developer.chrome.com/docs/extensions/reference/scripting/
  type t

  type target = {tabId: int}

  type func = unit => option<string>

  type scriptingParams = {
    target: target,
    func: func,
  }

  type scriptingResult = {result: string}

  @send
  external executeScript: (t, scriptingParams, array<scriptingResult> => unit) => unit =
    "executeScript"
}

module Storage = {
  module Data = {
    let key = "data"

    type t = {
      songs: GeniusApi.songs,
      lastSearch: string,
    }

    type result = {data: string}

    @scope("JSON") @val
    external parse: string => t = "parse"
  }

  // Reference: https://developer.chrome.com/docs/extensions/reference/storage/
  @module("./Chrome__Storage.js")
  external set: (string, string) => unit = "set"

  @module("./Chrome__Storage.js")
  external get: (string, Data.result => unit) => unit = "get"
}

type t = {
  tabs: Tabs.t,
  scripting: Scripting.t,
}

@val external chrome: t = "chrome"

let getActiveTabs = chrome.tabs->Tabs.query
let executeScript = chrome.scripting->Scripting.executeScript

// Why I did this sh*t?
// Because this function is injected on the tab page
// And it was not finding some Rescript modules
// Using raw, I guarantee that the output will be just plain JS, without the Rescript modules
let getYoutubeMusicTextContent: unit => option<
  string,
> = %raw(`function() {return document.querySelector("#container > h1 > yt-formatted-string")?.textContent}`)
