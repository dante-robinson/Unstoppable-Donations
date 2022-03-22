module.exports = {
  content: ["./src/**/*.{js,jsx,ts,tsx}"],
  theme: {
    extend: {
      gridTemplateColumns: {
        nav: "0.1fr 1fr 0.25fr",
      },
      gridTemplateRows: {
        nav: "7vh",
        tips: "1fr 0.15fr 0.75fr 1fr",
      },
      colors: {
        "crayola-blue": "#1d81fa",
        "darker-blue": "#145aaf",
        "greyish-white": "#f2f2f2",
        "maya-blue": "#5bc9f9",
      },
    },
  },
  plugins: [],
};
