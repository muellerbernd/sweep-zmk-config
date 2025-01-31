# zmk-config

## Toolchain setup on arch linux

- [Official documentation](https://zmk.dev/docs/development/setup)

- install west

```bash
pacman -S python-west
```

- get source code

```bash
git clone https://github.com/zmkfirmware/zmk.git
```

- Initialize & Update Zephyr Workspace

```bash
cd zmk
west init -l app/
west update
```

- Export Zephyr CMake package

```bash
west zephyr-export
```

- Install Zephyr Python Dependencies

Some additional Python dependencies are listed in Zephyr's scripts/requirements.txt file.

```bash
pip3 install --user -r zephyr/scripts/requirements.txt
```

## Toolchain and local build on with Nix

```bash
nix develop .
west init -l config
west update
west zephyr-export
python zmk_local_build.py
```

# taipo layout

- [taipo website](https://inkeys.wiki/en/keymaps/taipo)
- [zmk taipo](https://github.com/dlip/zmk-taipo/tree/main)
