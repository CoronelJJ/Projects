"use client";

import { useContext } from "react";
import Accordian from "../accordian";
import LightDarkMode from "../light-dark-mode";
import RandomColor from "../random-color";
import TicTacToe from "../tec-tac-toe";
import TreeView from "../tree-view";
import { FeatureFlagsContext } from "./context";
import menus from "../tree-view/data";

export default function FeaturedFlags() {
  const { loading, enabledFlags } = useContext(FeatureFlagsContext);
  const componentsToRender = [
    {
      key: "showLightAndDarkMode",
      component: <LightDarkMode />,
    },
    {
      key: "showTicTacToe",
      component: <TicTacToe />,
    },
    {
      key: "showRandomColorGenerator",
      component: <RandomColor />,
    },
    {
      key: "showAccordian",
      component: <Accordian />,
    },
    {
      key: "showTreeView",
      component: <TreeView menus={menus} />,
    },
  ];

  function checkEnabledFlag(currentKey) {
    return enabledFlags[currentKey];
  }

  if (loading) return <h1>Loading data please wait</h1>;

  return (
    <div>
      <h1>Featured flags</h1>
      {componentsToRender.map((component) =>
        checkEnabledFlag(component.key) ? component.component : null
      )}
    </div>
  );
}
