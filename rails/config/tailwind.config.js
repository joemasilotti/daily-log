const defaultTheme = require("tailwindcss/defaultTheme")
const colors = require("tailwindcss/colors")

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}"
  ],
  theme: {
    extend: {
      colors: {
        primary: colors.teal
      },
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans]
      }
    }
  },
  plugins: [
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/container-queries"),
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography")
  ]
}
