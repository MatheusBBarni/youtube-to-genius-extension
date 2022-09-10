@react.component
let make = () => {
  let (page, setPage) = PageContext.Context.use()

  let getActiveTabs = () => {
    Chrome.getActiveTabs(Theme.Constants.queryInfo, tabs => {
      let url = {
        let tab = tabs->Array.pop

        switch tab {
        | None => ""
        | Some(value) => value.url
        }
      }
      let isYoutube = Util.isYoutube(~tabUrl=url)

      Console.log(isYoutube)

      setPage(_ => isYoutube ? Youtube : NotYoutube)
    })
  }

  React.useEffect0(_ => {
    getActiveTabs()

    None
  })

  let handleConfigClick = _ => {
    switch page {
    | Configuration => getActiveTabs()
    | _ => setPage(_ => Configuration)
    }
  }

  <div className="w-[600px] h-[600px] overflow-scroll">
    <Header position=#fixed />
    <div className="w-full h-full flex flex-col">
      <button className="absolute left-3 top-20" onClick={handleConfigClick}>
        {switch page {
        | Configuration => <Icons.ArrowBackIcon size=30. />
        | _ => <Icons.GearFillOffIcon size=30. />
        }}
      </button>
      {switch page {
      | Youtube => <OnYoutube />
      | NotYoutube => <NotYoutube />
      | Configuration => <Configuration />
      }}
    </div>
  </div>
}
