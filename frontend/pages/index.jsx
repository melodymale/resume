import Image from "next/image";

export default function Home() {
  return (
    <div className="flex flex-col items-center mt-10 space-y-5 px-20">
      <Image
        src="/images/profile.jpg"
        width={150}
        height={150}
        className="rounded-full"
        alt="profile"
      ></Image>
      <p className="text-3xl font-bold">Chayutpong Promya</p>
      <p className="text-xl text-center text-gray-700 md:w-1/2">
        👋🏻 G'day! I'm Mel. A backend and data engineer from Thailand, now living
        in VIC, Australia. I'm passionated about clean code and data
        engineering.
      </p>
    </div>
  );
}
