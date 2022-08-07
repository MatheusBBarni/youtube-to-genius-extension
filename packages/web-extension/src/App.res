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

  <div className="w-[500px] h-[500px]">
    <Header />
    <div className="text-lg text-orange-700">
      {switch page {
      | Youtube => "Youtube"->React.string
      | NotYoutube => "NotYoutube"->React.string
      | Configuration => "Config"->React.string
      }}
    </div>
  </div>
}
