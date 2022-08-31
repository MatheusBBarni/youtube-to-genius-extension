type options = {
  apiKey: string,
  title: string,
  artist: string,
  optimizeQuery: bool,
}

type song = {
  albumArt: string,
  id: int,
  title: string,
  url: string,
}

type songs = array<song>

type status =
  | Data(songs)
  | Loading
  | Error
  | NotFound

@module("genius-lyrics-api")
external searchSong: options => Promise.t<Js.Nullable.t<songs>> = "searchSong"
