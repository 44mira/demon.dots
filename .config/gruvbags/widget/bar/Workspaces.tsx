import Hyprland from "gi://AstalHyprland";
import { Gtk } from "astal/gtk3";

const hypr = Hyprland.get_default();

function Workspace(id: number): Gtk.Widget {
  return (
    <button
      className={bind(hypr, "focused_workspace").as(
        (active) => `workspace ${active.id == id ? "active" : ""}`,
      )}
      onClicked={() => hypr.dispatch("workspace", id.toString())}
      cursor="pointer"
    />
  );
}

export default function Workspaces() {
  const workspaces = Array(5)
    .fill(0)
    .map((_, idx) => idx + 1);

  return (
    <box className="workspaces" spacing={4} valign={CENTER}>
      {workspaces.map((ws) => Workspace(ws))}
    </box>
  );
}
