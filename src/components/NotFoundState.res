open Render

@react.component
let make = () => {
  <div className="w-full flex flex-col justify-center items-center gap-3 mt-10">
    <Icons.TbMusicOffIcon size={50.} />
    <p className="font-sans text-xl font-bold text-center text-black">
      {"Song lyrics not found"->s}
    </p>
  </div>
}
