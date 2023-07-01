import React from 'react'
import { DocsThemeConfig } from 'nextra-theme-docs'
import ThemeResponsiveImage from './components/theme_responsive_image'

const config: DocsThemeConfig = {
  logo: <ThemeResponsiveImage
    lightSrc="/logo_light.svg"
    darkSrc="/logo_dark.svg"
    alt="Logo"
    width='100'
    height='20'
  />,
  useNextSeoProps() {
    return {
      titleTemplate: '%s – Jolt',
    }
  },
  banner: {
    key: 'pre-release',
    text: (
      <a href="" target="_blank">
        🚧 &nbsp; Jolt is currently pre-alpha. Read more →
      </a>
    )
  },
  primaryHue: {dark:  270, light: 270},
  project: {
    link: 'https://github.com/shuding/nextra-docs-template',
  },
  chat: {
    link: 'https://discord.com',
  },
  docsRepositoryBase: 'https://github.com/shuding/nextra-docs-template',
  footer: {
    text: 'Copyright © 2023 Kane Wickman',
  },
}

export default config
