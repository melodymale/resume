import Link from "next/link";
import { usePathname } from "next/navigation";

export default function Navbar() {
  const navItems = [
    { path: "/", name: "home" },
    { path: "/projects", name: "projects" },
  ];
  const pathname = usePathname();

  return (
    <nav className="text-center space-x-5 py-5">
      {navItems.map((item) => {
        const isActive = pathname === item.path;
        return (
          <Link
            href={item === "home" ? "/" : item.path}
            key={item.name}
            className={isActive ? "underline" : "text-gray-500"}
          >
            {item.name}
          </Link>
        );
      })}
    </nav>
  );
}
