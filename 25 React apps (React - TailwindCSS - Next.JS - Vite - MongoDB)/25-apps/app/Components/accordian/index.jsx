"use client";
import { useState } from "react";
import data from "./data";
import "./styles.css";

export default function Accordian() {
  const [selected, setSelected] = useState(null);
  const [enableMultiSelect, setEnableMultiSelect] = useState(false);
  const [multipleItems, setMultipleItems] = useState([]);

  function handleSingleSelection(getCurrentId) {
    setSelected(getCurrentId === selected ? null : getCurrentId);
  }

  function handleMultiSelection(getCurrentId) {
    let currentSelection = [...multipleItems];

    const findIndexOfCurrentId = currentSelection.indexOf(getCurrentId);

    if (findIndexOfCurrentId === -1) {
      currentSelection.push(getCurrentId);
    } else {
      currentSelection.splice(findIndexOfCurrentId, 1);
    }

    setMultipleItems(currentSelection);
  }

  return (
    <div className="container">
      <button onClick={() => setEnableMultiSelect(!enableMultiSelect)}>
        Multiselection
      </button>
      <div className="accordian">
        {data && data.length > 0 ? (
          data.map((dataItem) => (
            <div className="item" key={dataItem.id}>
              <div
                className="title"
                onClick={
                  enableMultiSelect
                    ? () =>handleMultiSelection(dataItem.id)
                    : () => handleSingleSelection(dataItem.id)
                }
              >
                <h3>{dataItem.pregunta}</h3>
                <span>+</span>
              </div>
              {enableMultiSelect
                ? multipleItems.indexOf(dataItem.id) !== -1 && (
                    <div className="content">{dataItem.respuesta}</div>
                  )
                : selected === dataItem.id && (
                    <div className="content">{dataItem.respuesta}</div>
                  )}

              {/*
              {selected === dataItem.id ? (
                <div className="content">{dataItem.respuesta}</div>
              ) : null}
                */}
            </div>
          ))
        ) : (
          <div>No data found!</div>
        )}
      </div>
    </div>
  );
}
