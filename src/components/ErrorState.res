open Render

@react.component
let make = () => {
  <div className="w-full flex flex-col justify-center items-center gap-3 mt-10">
    <Icons.ErrorAltIcon size={50.} />
    <p className="font-sans text-xl font-bold text-center text-black">
      {"Error while searching for this song lyrics"->s}
    </p>
  </div>
}
