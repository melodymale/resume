import Head from "next/head";
import Image from "next/image";
import utilStyles from "../styles/utils.module.css";
import styles from "./layout.module.css";

export const siteTitle = "Chayutpong Promya";

export default function Layout({ children }) {
  return (
    <div className={styles.container}>
      <Head>
        <link rel="icon" href="/favicon.ico" />
        <meta name="og:title" content={siteTitle} />
      </Head>
      <header className={styles.header}>
        <Image
          priority
          src="/images/profile.jpg"
          className={utilStyles.borderCircle}
          height={144}
          width={144}
          alt=""
        />
        <h1 className={utilStyles.heading2Xl}>{siteTitle}</h1>
      </header>
      <main>{children}</main>
    </div>
  );
}
