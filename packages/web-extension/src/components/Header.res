type columnType = Youtube | Arrow | Genius

let columnClasses = (~columnType) => {
  let color = switch columnType {
  | Youtube => "bg-youtube"
  | Arrow => "bg-slate-900"
  | Genius => "bg-genius"
  }
  `p-5 flex justify-center ${color}`
}

@react.component
let make = () => {
  open Theme

  <div className="w-full grid grid-cols-3">
    <div className={columnClasses(~columnType=Youtube)}>
      <Icons.YoutubeIcon size=Constants.iconSize />
    </div>
    <div className={columnClasses(~columnType=Arrow)}>
      <Icons.ArrowRightIcon
        className="animate-slide_to_right" size=Constants.iconSize color="#ffffff"
      />
    </div>
    <div className={columnClasses(~columnType=Genius)}>
      <Icons.GeniusIcon size=Constants.iconSize />
    </div>
  </div>
}
