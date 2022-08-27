open Render

@react.component
let make = () => {
  <div className="w-full flex justify-center items-center mt-10">
    <div
      className="spinner-border animate-spin inline-block w-8 h-8 border-4 rounded-full"
      role="status">
      <span className="visually-hidden"> {"Loading..."->s} </span>
    </div>
  </div>
}
