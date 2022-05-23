# Firefox configuration

- `about:config` in URL

## Change tab by scroll

- `toolkit.tabbox.switchByScrolling true`

## Disable TTS (speech-dispatcher)

- `reader.parse-on-load.enabled false`
- `media.webspeech.synth.enabled false`

## Adjust scroll speed

- `mousewheel.min_line_scroll_amount 5`
- `mousewheel.acceleration.start -1`
- `mousewheel.acceleration.factor 10`

## Hide navigation bar

- vi `chrome/userChrome.css`
- [Medium Reference](https://medium.com/@Aenon/firefox-hide-native-tabs-and-titlebar-f0b00bdbb88b)

```
#nav-bar, #identity-box, #tabbrowser-tabs, #TabsToolbar {
  visibility: collapse !important;
}
```
