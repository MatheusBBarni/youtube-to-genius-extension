@react.component
let make = () => {
  open Theme

  <div className="w-full grid gap-4 grid-cols-3">
    <div className={`p-5 flex justify-center bg-youtube`}>
      <Icons.YoutubeIcon size=Constants.iconSize />
    </div>
  </div>
}
