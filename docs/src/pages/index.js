import React from 'react';
import CodeBlock from '@theme/CodeBlock';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import styles from './index.module.scss';

import JoltWidgetSource from "!!raw-loader!/static/snippets/jolt_widget.dart";

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={styles.heroBanner}>
      {/* <img class={styles.heroImage} src='/img/icon.png'></img> */}
      <div className="container">
        {/* <h1 className={styles.heroTitle}>{siteConfig.title}</h1> */}
        <p className={styles.heroSubtitle}>{siteConfig.tagline}</p>
        <div className={styles.buttons}>
          <Link
            className="button button--secondary button--lg"
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
    snippetSource: JoltWidgetSource,
    title: "Built using standard Flutter patterns",
    description: (
      <>
        Jolt can manage your theming, typography and much more. Many other packages that offer these features, insist that you use their custom made classes and patterns.
        <p></p>Jolt keeps the standard MaterialApp/CupertinoApp and all the great functionality that comes with it.
        <p></p>Simply wrap your app with a 'Jolt' InheritedWidget. After that you can start using all the extensions and widgets that build on top of Jolt.
      </>
    ),
  },
  {
    title: 'Easy to understand extensions',
    description: (
      <>
        Docusaurus lets you focus on your docs, and we&apos;ll do the chores. Go
        ahead and move your docs into the <code>docs</code> directory.
      </>
    ),
  },
  {
    title: 'Theme management',
    description: (
      <>
        Extend or customize your website layout by reusing React. Docusaurus can
        be extended while reusing the same header and footer.
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
            <p>{description}</p>
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
