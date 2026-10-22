# paste-annotate

Draw on an image before Ctrl+V pastes it. Text pastes go through. Requires an Xorg session.

```bash
curl -fsSL -o paste-annotate.deb https://github.com/VictorSoaresDev/paste-annotate/releases/download/v1.0.1/paste-annotate_1.0.1_all.deb
sudo apt install ./paste-annotate.deb
```

Those two commands install it and start it for the current graphical login. It also starts at later logins. Stop it with `paste-annotate --stop`.
