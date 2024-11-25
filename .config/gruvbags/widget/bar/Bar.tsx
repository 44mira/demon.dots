import { App, Astal, Gtk, Gdk } from "astal/gtk3";
import Workspaces from "./Workspaces";
import Power from "./Power";

export default function Bar(gdkmonitor: Gdk.Monitor, idx: number) {
  return (
    <window
      name={`bar-${idx}`}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      layer={Astal.Layer.TOP}
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.LEFT |
        Astal.WindowAnchor.RIGHT
      }
      application={App}
    >
      <centerbox className="bar">
        <Workspaces />
        <box />
        <Power />
      </centerbox>
    </window>
  );
}
