import Image from "next/image";
import Link from "next/link";
import { BsGithub } from "react-icons/bs";

export default function Projects() {
  const projects = [
    {
      key: "de-zoomcamp",
      image_src: "/images/projects/de-zoomcamp.jpeg",
      description:
        "DE Zoomcamp is a data engneering project for learning about the data workflow",
      src: "https://github.com/melodymale/de-zoomcamp",
      title: "DE Zoomcamp",
    },
    {
      key: "resume",
      image_src: "/images/projects/resume.jpeg",
      description:
        "Resume is a part of cloud resume challenge which helps me learn about IaC, frontend, backend, and CI/CD.",
      src: "https://github.com/melodymale/resume",
      title: "Resume",
    },
  ];
  return (
    <div className="px-10 space-y-10 pt-10 md:w-2/3 mx-auto">
      {projects.map((project) => (
        <div key={project.key} className="space-x-5 flex md:space-x-10">
          <div className="w-1/2 border border-gray-100 rounded-lg shadow-lg overflow-hidden hover:shadow-xl">
            <Link href={project.src} target="_blank">
              <Image
                src={project.image_src}
                alt={project.title}
                width={1000}
                height={1000}
              />
            </Link>
          </div>
          <div className="w-1/2">
            <h1 className="font-bold md:text-2xl">{project.title}</h1>
            <p className="py-5 text-sm text-gray-600 md:text-lg">
              {project.description}
            </p>
            <div className="flex space-x-5">
              <Link href={project.src} target="_blank">
                <BsGithub size={30} />
              </Link>
            </div>
          </div>
        </div>
      ))}
    </div>
  );
}
