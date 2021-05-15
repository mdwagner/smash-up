import React from "react";
import ReactDOM from "react-dom";

export const ReactPortal = ({ children, domNode }) => {
  return <>{ReactDOM.createPortal(children, domNode)}</>;
};
