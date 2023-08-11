import Head from "next/head";
import Layout, { siteTitle } from "../components/layout";
import utilStyles from "../styles/utils.module.css";


export default function Home() {
  return (
    <Layout home>
      <Head>
        <title>{siteTitle}</title>
      </Head>
      <section className={utilStyles.headingMd}>
        <p>
          🙏🏻 Sawadee Ka! I'm Mel. A backend and data engineer from Thailand, but
          living in VIC, Australia right now. Feel free to contact me on{" "}
          <a href="https://linkedin.com/in/chayutpongpro/">LinkedIn</a>.
        </p>
        <p>
          You can build a site like this in{" "}
          <a href="https://nextjs.org/learn">Next.js tutorial</a>.
        </p>
      </section>
    </Layout>
  );
}
