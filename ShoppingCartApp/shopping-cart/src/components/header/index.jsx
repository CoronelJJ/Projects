import { Link } from "react-router-dom";

export default function Header() {
  return (
    <div>
      <nav className="flex items-center justify-between h-20 max-w-6xl mx-auto">
        <Link to={"/"}>
          <div className="ml-5">
            <h1 className="text-red-900 font-bold text-xl sm:text-2xl md:text-3xl cursor-pointer tracking-wide">
              React redux shopping cart
            </h1>
          </div>
        </Link>
        <ul className="flex items-center space-x-0 text-gray-800 font-semibold list-none">
            <Link to={'/'}>
            <li className="cursor-pointer mr-1">Home</li>
            </Link>
            <Link to={'/cart'}>
            <li className="cursor-pointer mr-1">Cart</li>
            </Link>

        </ul>
      </nav>
    </div>
  );
}
