import { Astal, App, Gtk, Gdk } from "astal/gtk3";

const isActive = Variable(false);
const date = Variable("").poll(1000, "date '+%a, %b %d %Y %T'");

function MainMenuItem(label: string) {
  return (
    <button cursor="pointer" className="mainmenu-item">
      <box spacing={20} className="mainmenu-item">
        <box className="mainmenu-item__icon" vexpand={false} hexpand={false} />
        <label className="mainmenu-item" label={label} />
      </box>
    </button>
  );
}

function MainMenuBody() {
  const slideDuration = 500;

  const menuItems = [
    { label: "SYSTEM" },
    { label: "AUDIO" },
    { label: "BRIGHTNESS" },
    { label: "POWER" },
  ];

  return (
    <overlay halign={START} vexpand={true}>
      <revealer
        transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
        transitionDuration={slideDuration}
        revealChild={isActive()}
      >
        <box className="mainmenu" vertical={true} vexpand={true}>
          <box className="mainmenu-items" vertical={true}>
            {menuItems.map(({ label }) => MainMenuItem(label))}
          </box>
          <box vexpand={true} />
          <label className="mainmenu-date" label={date()} />
        </box>
      </revealer>
    </overlay>
  );
}

export default function MainMenu() {
  return (
    <window
      className="mainmenu"
      clickThrough={false}
      exclusivity={Astal.Exclusivity.IGNORE}
      layer={Astal.Layer.OVERLAY}
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.BOTTOM |
        Astal.WindowAnchor.LEFT |
        Astal.WindowAnchor.RIGHT
      }
      visible={false}
      keymode={Astal.Keymode.EXCLUSIVE}
      namespace="mainmenu"
      onKeyPressEvent={(self, event) => {
        switch (event.get_keyval()[1]) {
          case Gdk.KEY_Escape:
          case Gdk.KEY_q:
            App.toggle_window(self.name);
        }
      }}
      name="mainmenu"
      application={App}
      onDraw={() => isActive.set(true)}
      onHide={() => isActive.set(false)}
    >
      <MainMenuBody />
    </window>
  );
}
