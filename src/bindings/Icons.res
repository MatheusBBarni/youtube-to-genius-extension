module YoutubeIcon = {
  @module("react-icons/bs") @react.component
  external make: (~size: float) => React.element = "BsYoutube"
}

module GeniusIcon = {
  @module("react-icons/si") @react.component
  external make: (~size: float) => React.element = "SiGenius"
}

module ArrowRightIcon = {
  @module("react-icons/fa") @react.component
  external make: (~size: float, ~color: string=?, ~className: string=?) => React.element =
    "FaArrowRight"
}

module SadTearIcon = {
  @module("react-icons/fa") @react.component
  external make: (~size: float, ~color: string=?, ~className: string=?) => React.element =
    "FaSadTear"
}

module ErrorAltIcon = {
  @module("react-icons/bi") @react.component
  external make: (~size: float, ~color: string=?, ~className: string=?) => React.element =
    "BiErrorAlt"
}

module TbMusicOffIcon = {
  @module("react-icons/tb") @react.component
  external make: (~size: float, ~color: string=?, ~className: string=?) => React.element =
    "TbMusicOff"
}

module GearFillOffIcon = {
  @module("react-icons/bs") @react.component
  external make: (~size: float, ~color: string=?, ~className: string=?) => React.element =
    "BsFillGearFill"
}
