# paste-annotate

Draw on an image before Ctrl+V pastes it. Text pastes go through. Requires an Xorg session.

```bash
curl -fsSL -o paste-annotate.deb https://github.com/VictorSoaresDev/paste-annotate/releases/download/v1.0.0/paste-annotate_1.0.0_all.deb
sudo apt install ./paste-annotate.deb
```

The tool starts at the next graphical login. Run `paste-annotate` to start it for the current login. Stop it with `paste-annotate --stop`.
