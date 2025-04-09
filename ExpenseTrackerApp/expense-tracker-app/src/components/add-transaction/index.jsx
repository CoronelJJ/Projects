import { useContext, useState } from "react";
import { GlobalContext } from "../../context";

export default function TransactionForm() {
  const [open, setOpen] = useState(false);
  const { formData, setFormData, value, setValue, handleFormSubmit } = useContext(GlobalContext);

  function handleOpen() {
    setOpen(true);
  }
  function handleClose() {
    setOpen(false);
  }
  function handleFormChange(event) {
    setFormData({
      ...formData,
      [event.target.name]: event.target.value,
    });
  }

  function handleSubmit(event){
    event.preventDefault();
    handleFormSubmit(formData);
  }
  return (
    <>
      <button
        onClick={handleOpen}
        className="bg-blue-400 text-black p-3 rounded-2xl cursor-pointer font-bold"
      >
        Add new transaction
      </button>
      <dialog className="modal" open={open}>
        <div className="modal-box w-11/12 max-w-5xl flex flex-col items-center">
          <h1 className="text-blue-400 text-2xl font-bold ">
            ADD NEW TRANSACTION
          </h1>
          <div className="modal-action">
            <form method="dialog" onSubmit={handleSubmit} className="flex flex-col">
              <div className="flex flex-col border-2 border-gray-300 items-start p-3 m-0.5">
                <label htmlFor="description">Description:</label>
                <input
                  type="text"
                  id="description"
                  name="description"
                  onChange={handleFormChange}
                  className="bg-white text-gray-900 m-0.5"
                />
              </div>
              <div className="flex flex-col border-2 border-gray-300 items-start p-3 m-0.5">
                <label htmlFor="amount">Enter amount:</label>
                <input
                  placeholder="Enter transaction amount"
                  id="amount"
                  name="amount"
                  type="number"
                  onChange={handleFormChange}
                  className="bg-white text-gray-900 m-0.5"
                />
              </div>
              <div className="flex flex-col border-2 border-gray-300 items-start p-3 m-0.5">
                <h3>Select type:</h3>
                <label htmlFor="income">Income</label>
                <input
                  type="radio"
                  id="income"
                  name="type"
                  value={value}
                  onChange={handleFormChange}
                  checked={formData.type === "income"}
                />
                <label htmlFor="expense">Expense</label>
                <input
                  type="radio"
                  id="expense"
                  name="type"
                  value={value}
                  onChange={handleFormChange}
                  checked={formData.type === "expense"}
                />
              </div>
              <input
                type="submit"
                value="Add"
                onClick={handleClose}
                className="bg-blue-400 text-black p-1 rounded-2xl cursor-pointer m-1"
              />
              <button
                onClick={handleClose}
                className="bg-red-400 text-black p-1 rounded-2xl cursor-pointer m-1"
              >
                Cancel
              </button>
            </form>
          </div>
        </div>
      </dialog>
    </>
  );
}
