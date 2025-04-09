import TransactionChartSummary from "../chart";

export default function Summary({totalIncome, totalExpense}) {
  return (
    <div className="p-6 border-3 border-gray-100 overflow-hidden rounded-2xl bg-gray-25">
      <div className="w-full content-center items-center flex flex-row">
        <div className=" flex flex-1 flex-col items-center place-content-evenly ml-2 mr-2 text-center">
          <h1 className="text-2xl mb-4 text-green-600">Balance is: ${totalIncome - totalExpense}</h1>
          <div className="place-content-evenly items-center bg-gray-50 w-full h-[100px] border-1 border-gray-100">
            <div className="flex flex-col">
              <h1 className="text-gray-700">{totalIncome}</h1>
              <p className="text-gray-500">Total income</p>
            </div>
          </div>
          <div className="place-content-evenly items-center bg-gray-50 w-full h-[100px] border-1 border-gray-100">
            <div className="flex flex-col">
              <h1 className="text-gray-700">{totalExpense}</h1>
              <p className="text-gray-500">Total Expense</p>
            </div>
          </div>
        </div>
        <div className="flex flex-1 mt-10 ml-[-90] mr-5 w-[300px] h-[300px] items-center content-center">
            <TransactionChartSummary income={totalIncome} expense={totalExpense}/>
        </div>
      </div>
    </div>
  );
}
