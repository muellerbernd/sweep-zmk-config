# zmk-config

## Toolchain setup

- [Official documentation](https://zmk.dev/docs/development/setup)

- install west

```bash
pacman -S python west
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
