open Render

@react.component
let make = () => {
  let (search, setSearch) = React.useState(_ => GeniusApi.Loading)

  <div className="w-full flex flex-column flex-wrap mt-24">
    <SearchEngine
      onSearch={event => {
        setSearch(_ => event)
        ()
      }}
    />
    <div className="mt-6 w-full">
      {switch search {
      | Loading => <LoadingState />
      | Error => <ErrorState />
      | NotFound => <NotFoundState />
      | Data(songs) =>
        songs->map(song => {
          <SongLink key={song.id->Belt.Int.toString} song />
        })
      }}
    </div>
  </div>
}
