import React from 'react';
import CodeBlock from '@theme/CodeBlock';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import styles from './index.module.scss';

import JoltWidget from "!!raw-loader!/static/snippets/jolt_widget.dart";
import JoltExtensions from "!!raw-loader!/static/snippets/jolt_extensions.dart";
import JoltSnackBars from "!!raw-loader!/static/snippets/jolt_snackbars.dart";
import JoltTheming from "!!raw-loader!/static/snippets/jolt_themes.dart";
import JoltSemanticColors from "!!raw-loader!/static/snippets/jolt_semantic_colors.dart";
import JoltTextScaling from "!!raw-loader!/static/snippets/jolt_text_scaling.dart";
import JoltWidgets from "!!raw-loader!/static/snippets/jolt_widgets.dart";

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={styles.heroBanner}>
      <div className="container">
        <h1 className={styles.heroTitle}>{siteConfig.tagline}</h1>
        <div className={styles.buttons}>
          <Link
            className="button button--primary button--lg"
            to="/docs/getting-started">
            Get Started
          </Link>
        </div>
      </div>
    </header>
  );
}

const FeatureList = [
  {
    snippetSource: JoltWidget,
    title: "Built using standard Flutter patterns",
    description: (
      <>
        <p>Jolt can manage your theming, typography and much more. Many other packages that offer these features, insist that you use their custom made classes and patterns.</p>
        <p>Jolt keeps the standard MaterialApp/CupertinoApp and all the great functionality that comes with it.</p>
        <p>Simply wrap your app with a 'Jolt' InheritedWidget. After that you can start using all the extensions and widgets that build on top of Jolt.</p>
      </>
    ),
  },
  {
    snippetSource: JoltExtensions,
    title: 'Easy to understand extensions',
    description: (
      <>
        <p>Jolt includes many extensions, most available straight from the BuildContext. They are structured in a way that is easy to use and read.</p>
        <ul>
          <li>All colors from the default Flutter ColorScheme are available via context.color, as well as Jolt's extended semantic colors.</li>
          <li>All text styles from the default Flutter TextTheme are available via context.textStyle.</li>
          <li>There are many more extensions available, find out more in the Flutter Jolt section of the docs.</li>
        </ul>
      </>
    ),
  },
  {
    snippetSource: JoltTheming,
    title: 'Theme management',
    description: (
      <>
        <p>Use Jolt to manage the active theme for the user. Setting the theme with Jolt with save the selected value to the device using Hive.</p>
        <p>If you have multiple light and dark themes, Jolt is smart enough to know that a light theme with primary color x, should be swapped for a dark theme with primary color x, and visa versa.</p>
      </>
    ),
  },
  {
    snippetSource: JoltSemanticColors,
    title: 'Semantic Colors',
    description: (
      <>
        <p>Flutter's semantic colors only include a color for 'error' by default.</p>
        <p>Jolt adds colors for:</p>
        <ul>
          <li>Success</li>
          <li>Warning</li>
          <li>Info</li>
        </ul>
      </>
    ),
  },
  {
    snippetSource: JoltSnackBars,
    title: 'Extended Snackbars',
    description: (
      <>
        <p>Jolt utilises ScaffoldMessenger in the standard Flutter way, but adds support for icons and semantic snackbars.</p>
        <p>It also makes it easier to show a snackbar, with useful extensions.</p>
        <p>In cases where the context is not available, use the: <code>joltScaffoldMessengerKey</code></p>
        <p>Extensions are added directly to the key, so you can use: <code>joltScaffoldMessengerKey.showSnackBar()</code></p>
      </>
    ),
  },
  {
    snippetSource: JoltTextScaling,
    title: 'App Specific Text Scaling',
    description: (
      <>
        <p>By default Flutter will read a device's text size settings and adjust text widgets accordingly. Jolt adds an optional layer on top of this, allowing the text scale to be adjusted inside the app as well.</p>
        <p>To use the combined textScale, use the JoltText widget (which has a bunch of extra functionality as well).</p>
        <p>There are also rare cases where you don't want text widgets to scale their text, JoltText allows turning off scaling all together.</p>
      </>
    ),
  },
  {
    snippetSource: JoltWidgets,
    title: 'Widgets',
    description: (
      <>
        <p>Aside from the functionality listed above, Jolt also provides some useful widgets:</p>
        <ul>
          <li>JoltText</li>
          <li>JoltButton</li>
          <li>JoltGrid</li>
        </ul>
      </>
    ),
  },
];

function Feature({ title, description,snippetSource}) {
  return (
    <div className={styles.feature}>
      <div className={styles.container}>
        <div className={styles.content}>
          <div className={styles.contentBody}>
            <h3>{title}</h3>
            {description}
          </div>
          <CodeBlock language="dart" className={styles.code}>
            {snippetSource}
          </CodeBlock>
        </div>
      </div>
    </div>
  );
}

export default function Home() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={`${siteConfig.title} Docs`}
      description="Jolt is a collection of packages and examples, intended to make building with Flutter quicker and cleaner">
      <HomepageHeader />
      
      <main>
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
      </main>
    </Layout>
  );
}
