export default function ExpenseView({ type, data }) {
  return (
    <div className="flex-1 w-full bg-white mr-4 mt-10 p-5 pb-4 border-2 border-gray-100 rounded-xl">
      <div className="flex items-center content-between">
        <h1 className="text-3xl text-red-700 font-bold">
          {type === "income" ? "Income" : "Expense"}
        </h1>
      </div>

      {data.map((item) => (
        <div
          className={`${
            type === "expense" ? "text-red-500" : "text-green-500"
          } text-2xl mt-4 content-between items-center border-1 border-${
            type === "expense" ? "red-500" : "green-500"
          } p-4 rounded-2xl bg-gray-100`}
        >
          <div className="flex items-center content-center">
            <p className="ml-3 font-bold text-gray-600">{item.description}</p>
          </div>
          <p>{item.amount}</p>
        </div>
      ))}
    </div>
  );
}
