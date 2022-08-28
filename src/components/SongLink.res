open Render

@react.component
let make = (~song: GeniusApi.song) => {
  <a
    href=song.url
    target="_blank"
    className="p-5 m-2 flex items-center gap-5 border-2 border-solid border-zinc-500 rounded-md">
    <img src=song.albumArt alt=song.title className="h-10 rounded" />
    <p className="font-sans text-black font-bold text-base"> {song.title->s} </p>
  </a>
}
