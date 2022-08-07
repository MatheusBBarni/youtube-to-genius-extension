const colors = require('tailwindcss/colors')

module.exports = {
  content: ['./public/*.html', './src/**/*.res', './src/**/*.bs.js'],
  theme: {
    extend: {
      keyframes: {
        slide_to_right: {
          '0%,100%': {
            transform: 'translate(-10px, 0)',
          },
          '50%': {
            transform: 'translate(10px, 0)',
          },
        }
      },
      animation: {
        slide_to_right: 'slide_to_right 2s ease-in-out infinite'
      }
    },
    colors: {
      ...colors,
      youtube: "#FF0000",
      genius: "#FFFC64",
    }
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
