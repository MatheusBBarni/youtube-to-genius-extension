open PageContext

@react.component
let make = () => {
  let (page, setPage) = Context.use()

  setPage(_ => Youtube)

  React.useEffect0(_ => {
    Chrome.getActiveTabs(Theme.Constants.queryInfo, tabs => {
      let url = {
        let tab = tabs->Array.pop

        switch tab {
        | None => ""
        | Some(value) => value.url
        }
      }
      let isYoutube = Util.isYoutube(~tabUrl=url)

      // setPage(_ => isYoutube ? Youtube : NotYoutube)
    })

    None
  })

  <Provider>
    <div className="w-[600px] h-[600px] overflow-scroll">
      <Header position=#fixed />
      <div className="w-full h-full flex flex-col">
        <button className="absolute right-3 top-20" onClick={_ => setPage(_ => Configuration)}>
          <Icons.GearFillOffIcon size=30. />
        </button>
        {switch page {
        | Youtube => <OnYoutube />
        | NotYoutube => <NotYoutube />
        | Configuration => <Configuration />
        }}
      </div>
    </div>
  </Provider>
}
