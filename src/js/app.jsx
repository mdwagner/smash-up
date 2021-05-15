import { start as RailsUjsStart } from "@rails/ujs";
import React, { useState } from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Switch, Route } from "react-router-dom";

/**
 * Rails Unobtrusive JavaScript (UJS) is *required* for links in Lucky that use DELETE, POST and PUT.
 * Though it says "Rails" it actually works with any framework.
 */
RailsUjsStart();

const App = () => {
  return (
    <BrowserRouter>
      <Switch>
        {/* Route `path` should match Lucky Page url */}
        {/* Use React Portal to render to custom elements on page */}
        <Route path="*"></Route>
      </Switch>
    </BrowserRouter>
  );
};

ReactDOM.render(<App />, document.getElementById("root"));
