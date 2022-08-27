type page = Youtube | NotYoutube | Configuration

@react.component
let make = () => {
  let (page, setPage) = React.useState(_ => NotYoutube)

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

      setPage(_ => isYoutube ? Youtube : NotYoutube)
    })

    None
  })

  <div className="w-[600px] h-[600px] overflow-scroll">
    <Header
      position={switch page {
      | NotYoutube => #fixed
      | _ => #static
      }}
    />
    {switch page {
    | Youtube => <OnYoutube />
    | NotYoutube => <NotYoutube />
    | Configuration => "Config"->React.string
    }}
  </div>
}
