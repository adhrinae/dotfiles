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
        /gitlab\.protopie\.io/,
        /cloud\.protopie\.io/,
        /docs\.google\.com/,
      ],
      browser: "Google Chrome",
    },
    {
      match: [/facebook\.com/, /twitter\.com/, /linkedin\.com/, /netflix\.com/],
      browser: "Safari",
    },
    {
      match: [/youtube\.com/, /youtu\.be/, /github\.com/],
      browser: "Microsoft Edge",
    },
  ],
};
