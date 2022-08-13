// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion



/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Jolt',
  tagline: 'A collection of packages and examples, intended to make building with Flutter quicker and cleaner',
  url: 'https://your-docusaurus-test-site.com',
  baseUrl: '/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'asteroid-studios', // Usually your GitHub org/user name.
  projectName: 'jolt', // Usually your repo name.

  // Even if you don't use internalization, you can use this field to set useful
  // metadata like html lang. For example, if your site is Chinese, you may want
  // to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          // Enable editUrl to edit pages via GitHub
          // editUrl:
          //   'https://github.com/asteroid-studios/jolt/tree/master/docs',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: '',
        logo: {
          alt: 'My Site Logo',
          src: 'img/logo.svg',
        },
        items: [
          {
            type: 'doc',
            docId: 'getting-started',
            position: 'right',
            label: 'Docs',
          },
          {
            href: 'https://github.com/orgs/asteroid-studios/projects/2/views/1',
            label: 'Roadmap',
            position: 'right',
          },
          {
            href: 'https://github.com/asteroid-studios/jolt',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        // links: [
        //   {
        //     title: 'More',
        //     items: [
        //       {
        //         label: 'Blog',
        //         to: '/blog',
        //       },
        //       {
        //         label: 'GitHub',
        //         href: 'https://github.com/facebook/docusaurus',
        //       },
        //     ],
        //   },
        // ],
        copyright: `Copyright © ${new Date().getFullYear()} Asteroid Studios. Built with Docusaurus.`,
      },
      prism: {
        // theme: require('prism-react-renderer/themes/nightOwl'),
        // darkTheme: require('prism-react-renderer/themes/oceanicNext'),
        additionalLanguages: ["dart"],
      },
    }),
};

async function createConfig() {

  const lightTheme = (await import('./src/themes/lightTheme.mjs')).default;
  const darkTheme = (await import('./src/themes/darkTheme.mjs')).default;
  // @ts-expect-error: we know it exists, right
  config.themeConfig.prism.theme = lightTheme;
  // @ts-expect-error: we know it exists, right
  config.themeConfig.prism.darkTheme = darkTheme;
  return config;
}


module.exports = createConfig;
