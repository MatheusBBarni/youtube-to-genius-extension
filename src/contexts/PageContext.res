type page = Youtube | NotYoutube | Configuration

module Context = {
  include ReactContext.Make({
    type context = (page, (page => page) => unit)
    let defaultValue = (NotYoutube, _ => ())
  })
}

module Provider = {
  @react.component
  let make = (~children) => {
    let (page, setPage) = React.useState(_ => NotYoutube)

    <Context.Provider value=(page, setPage)> children </Context.Provider>
  }
}
