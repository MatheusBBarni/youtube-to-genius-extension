@react.component
let make = () => {
  <div className="w-full h-full flex justify-center items-center flex-col">
    <p className="font-sans text-xl text-black mb-9">
      {"This extension only works on youtube videos."->React.string}
    </p>
    <Icons.SadTearIcon size=100. />
  </div>
}
