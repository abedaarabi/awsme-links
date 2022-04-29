import Head from "next/head";
import { gql, useQuery, useMutation } from "@apollo/client";
import { useUser } from "@auth0/nextjs-auth0";
import Link from "next/link";
import { AwesomeLink } from "../components/AwesomeLink";
import { links } from "../data/links";

function Home() {
  const { user } = useUser();

  if (!user) {
    return (
      <div className="flex items-center justify-center">
        To view the awesome links you need to{" "}
        <Link href="/api/auth/login">
          <a className=" block bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0">
            Login
          </a>
        </Link>
      </div>
    );
  }

  return (
    <div>
      <Head>
        <title>Awesome Links</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <div className="container mx-auto max-w-5xl my-20 px-5">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
          {links?.map((node, i) => (
            <Link href={`/link/${node.id}`} key={i}>
              <a>
                <AwesomeLink
                  title={node.title}
                  category={node.category}
                  url={node.url}
                  id={node.id}
                  description={node.description}
                  imageUrl={node.imageUrl}
                />
              </a>
            </Link>
          ))}
        </div>
      </div>
    </div>
  );
}

export default Home;
