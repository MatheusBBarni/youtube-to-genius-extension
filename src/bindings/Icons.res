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
