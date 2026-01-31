// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "./controllers";
import "./components/Clock";

import React from "react";
import { createRoot } from "react-dom/client";
import Clock from "./components/Clock";

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("react-root");
    if (root) {
        createRoot(Root).render(<Clock />);
    }
});