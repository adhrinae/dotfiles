module.exports = {
  defaultBrowser: "Safari",
  options: {
    hideIcon: true,
  },
  handlers: [
    {
      match: [
        /protopie\.atlassian\.net/,
        /notion\.so\/protopie\/.*$/,
        /figma\.com/,
        /protopie\.io/,
        /docs\.google\.com/,
        /zoom\.us/,
      ],
      browser: "Google Chrome",
    },
    {
      match: [/facebook\.com/, /twitter\.com/, /linkedin\.com/, /netflix\.com/],
      browser: "Safari",
    },
  ],
};
