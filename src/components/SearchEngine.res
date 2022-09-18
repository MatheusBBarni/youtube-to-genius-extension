open Theme.Constants

@react.component
let make = (~onSearch: GeniusApi.status => unit) => {
  let (musicName, setMusicName) = React.useState(_ => "")

  let handleInputChange = event => {
    let value = ReactEvent.Form.currentTarget(event)["value"]

    setMusicName(_ => value)
  }

  let searchMusic = (name: option<string>) => {
    open Promise

    let name = switch name {
    | Some(value) => value
    | None => musicName
    }

    onSearch(Loading)
    GeniusApi.searchSong({
      apiKey: geniusAccesToken,
      title: name,
      artist: name,
      optimizeQuery: true,
    })
    ->then(result => {
      let result = result->Js.Nullable.toOption
      switch result {
      | Some(songs) => onSearch(Data(songs))
      | None => onSearch(NotFound)
      }

      resolve()
    })
    ->catch(e => {
      Console.log("Search error ->")
      Console.log(e)
      onSearch(Error)
      resolve()
    })
    ->ignore
  }

  React.useEffect0(_ => {
    Chrome.getActiveTabs(Theme.Constants.queryInfo, tabs => {
      let tabId = switch tabs->Array.pop {
      | Some(tab) => Some(tab.id)
      | None => None
      }

      switch tabId {
      | None => ()
      | Some(id) => {
          Chrome.executeScript(
            {
              target: {
                tabId: id,
              },
              func: Chrome.getYoutubeMusicTextContent,
            },
            results => {
              let result = results->Array.pop

              switch result {
              | Some(value) => {
                  let text = value.result
                  searchMusic(Some(text))
                  setMusicName(_ => text)
                }
              | None => setMusicName(_ => "")
              }
            },
          )
          ()
        }
      }

      ()
    })
    None
  })

  <div className="w-full flex justify-evenly mt-4">
    <input
      value=musicName
      onChange=handleInputChange
      placeholder="Music that you want to search"
      className="w-80 h-10 rounded-lg border-2 border-black text-sm text-black font-bold font-sans p-3 placeholder:text-sm focus:outline-none text-center"
    />
    <button
      onClick={_ => {
        searchMusic(None)
        ()
      }}
      className="w-28 h-10 bg-genius border-black rounded-lg text-sm text-black font-sans font-bold transition-all hover:scale-105">
      {"Search"->React.string}
    </button>
  </div>
}
