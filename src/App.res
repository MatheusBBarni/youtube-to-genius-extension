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

  <div className="w-[600px] h-[600px] overflow-scroll">
    <Header position=#fixed />
    <Trademark />
    <div className="w-full h-full flex flex-col">
      {switch page {
      | Youtube => <OnYoutube />
      | _ => <NotYoutube />
      }}
    </div>
  </div>
}
