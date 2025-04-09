import { useContext, useEffect } from "react";
import TransactionForm from "../add-transaction";
import ExpenseView from "../expense-view";
import Summary from "../summary";
import { GlobalContext } from "../../context";

export default function Main() {
  const {
    totalIncome,
    setTotalIncome,
    totalExpense,
    setTotalExpense,
    allTransaction,
  } = useContext(GlobalContext);

  useEffect(() => {
    let income = 0;
    let expense = 0;

    allTransaction.forEach((element) => {
      element.type === "income"
        ? (income = income + parseFloat(element.amount))
        : (expense = expense + parseFloat(element.amount));

      setTotalIncome(income);
      setTotalExpense(expense);
    });
  }, [allTransaction]);

  return (
    <div className="flex align-middle items-center justify-around flex-col">
      <div className="flex items-center justify-around mt-12 p-5">
        <h1 className="text-3xl text-blue-600">Expense tracker</h1>
        <div className="flex align-middle m-5">
          <TransactionForm />
        </div>
      </div>
      <div>
        <Summary totalIncome={totalIncome} totalExpense={totalExpense} />
      </div>
      <div className="w-[100vw] m-0 flex flex-row place-content-evenly">
        <ExpenseView type={'expense'} data={allTransaction.filter(item => item.type === 'expense')} />
        <ExpenseView type={'income'} data={allTransaction.filter(item => item.type === 'income')}/>
      </div>
    </div>
  );
}
