import { App } from "astal/gtk3";
import Bar from "./widget/bar/Bar";
import { exec } from "astal/process";
import "./globals";

const stylesPath = "/tmp/gruvbags/styles";

exec(["sass", `styles:${stylesPath}`]);

App.start({
  css: stylesPath + "/styles.css",
  main() {
    App.get_monitors().map((monitor, idx) => Bar(monitor, idx));
  },
});