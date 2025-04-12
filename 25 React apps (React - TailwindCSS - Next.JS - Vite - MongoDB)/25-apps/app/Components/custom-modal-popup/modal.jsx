export default function Modal({ id, header, body, footer, onClose }) {
  return (
    <div id={id || "modal"} className="modal">
      <div className="modal-content">
        <div className="modal-header">
          <span className="close-modal-icon" onClick={onClose}>&times;</span>
          {header ? header : <h2>Header</h2>}
        </div>
        <div className="modal-body">
          {body ? body : <p>Body</p>}
        </div>
        <div className="modal-footer">
          {footer ? footer : <h2>Footer</h2>}
        </div>
      </div>
    </div>
  );
}
