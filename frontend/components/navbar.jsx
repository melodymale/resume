import Link from "next/link";
import { usePathname } from "next/navigation";

export default function Navbar() {
  const navItems = [
    { path: "/", name: "home" },
    { path: "/projects/", name: "projects" },
  ];
  const pathname = usePathname();

  return (
    <nav className="text-center space-x-5 py-5">
      {navItems.map((item) => {
        return (
          <Link
            href={item === "home" ? "/" : item.path}
            key={item.name}
            className={pathname === item.path ? "underline" : "text-gray-400"}
          >
            {item.name}
          </Link>
        );
      })}
    </nav>
  );
}
