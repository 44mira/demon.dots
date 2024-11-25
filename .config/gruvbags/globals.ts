import { bind as _bind, Variable as _Variable } from "astal";
import { Gtk } from "astal/gtk3";

declare global {
  const bind: typeof _bind;
  const Variable: typeof _Variable;
  const START: number;
  const CENTER: number;
  const END: number;
  const FILL: number;
  const BASELINE: number;
}

Object.assign(globalThis, {
  bind: _bind,
  Variable: _Variable,
  START: Gtk.Align.START,
  CENTER: Gtk.Align.CENTER,
  END: Gtk.Align.END,
  FILL: Gtk.Align.FILL,
  BASELINE: Gtk.Align.BASELINE,
});
