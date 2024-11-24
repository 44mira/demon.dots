import Battery from "gi://AstalBattery";
import { readFile } from "astal";

function PowerColor(percent: number) {
  let palette;
  try {
    palette = JSON.parse(readFile("palette.json"));
  } catch (err) {
    console.log(err, "Failed to read palette.json");
    return "white";
  }

  switch (true) {
    case percent == 1:
      return palette.aqua_1;
    case percent < 0.8:
      return palette.aqua_0;
    case percent < 0.6:
      return palette.yellow;
    case percent < 0.4:
      return palette.orange;
    case percent < 0.2:
      return palette.red;
    case percent < 0.1:
      return palette.bg_red_1;
  }
}

export default function Power() {
  const battery = Battery.get_default();

  return (
    <box spacing={5} halign={END}>
      <label
        className="power"
        label={bind(battery, "charging").as((charging) =>
          charging ? "CHARGING:" : "POWER:",
        )}
      />
      <label
        css={bind(battery, "percentage").as((p) => `color:${PowerColor(p)};`)}
        label={bind(battery, "percentage").as((p) => `${Math.round(p * 100)}%`)}
      />
    </box>
  );
}
