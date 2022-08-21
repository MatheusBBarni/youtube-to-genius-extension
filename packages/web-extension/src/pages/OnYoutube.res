open Render

@react.component
let make = () => {
  let (search, setSearch) = React.useState(_ => GeniusApi.Loading)

  <div className="w-full flex flex-column flex-wrap">
    <SearchEngine
      onSearch={event => {
        setSearch(_ => event)
        ()
      }}
    />
    <div className="mt-6">
      {switch search {
      | Loading => "Loading"->s
      | Error => "Error"->s
      | NotFound => "Music not found"->s
      | Data(songs) =>
        songs->map(song => {
          <a
            href=song.url
            target="_blank"
            className="p-5 flex gap-5"
            key={song.id->Belt.Int.toString}>
            <img src=song.albumArt alt=song.title className="h-10 rounded" />
            <p className="font-sans text-black font-bold text-lg"> {song.title->s} </p>
          </a>
        })
      }}
    </div>
  </div>
}
