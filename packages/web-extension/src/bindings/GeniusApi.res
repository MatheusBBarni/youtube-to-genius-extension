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

@module("genius-lyrics-api")
external searchSong: options => Promise.t<array<song>> = "searchSong"
