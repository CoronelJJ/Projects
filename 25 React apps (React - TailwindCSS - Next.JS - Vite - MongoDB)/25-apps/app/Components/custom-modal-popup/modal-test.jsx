"use client";
import { useState } from "react";
import Modal from "./modal";
import "./modal.css";

export default function ModalTest() {
  const [showModal, setShowModal] = useState(false);

  function handleToggleModal() {
    setShowModal(!showModal);
  }

  function onClose() {
    setShowModal(false);
  }
  return (
    <div>
      <button onClick={handleToggleModal}>Open modal</button>

      {showModal && <Modal header={<h1>Passed header</h1>} onClose={onClose} />}
    </div>
  );
}
