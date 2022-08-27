open Render

@react.component
let make = (~song: GeniusApi.song) => {
  <a href=song.url target="_blank" className="p-5 flex gap-5" key={song.id->Belt.Int.toString}>
    <img src=song.albumArt alt=song.title className="h-10 rounded" />
    <p className="font-sans text-black font-bold text-lg"> {song.title->s} </p>
  </a>
}
