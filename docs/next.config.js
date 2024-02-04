const withNextra = require('nextra')({
  theme: 'nextra-theme-docs',
  themeConfig: './theme.config.tsx',
  defaultShowCopyCode: true,
  basePath: '/docs',
})

module.exports = {
  ...withNextra(),
  async redirects() {
    return [
      {
        source: '/',
        destination: '/docs',
        permanent: true,
      },
      // {
      //   source: '/docs',
      //   destination: '/docs/introduction',
      //   permanent: true,
      // },
      // {
      //   source: '/widgets',
      //   destination: '/widgets/all',
      //   permanent: true,
      // },
    ];
  },
};

