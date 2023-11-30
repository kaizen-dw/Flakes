<h1 align="center">
  <img src="https://files.catbox.moe/i4twd5.png"></img> 
  <br />
  My Flakes
</h1>
<p align="center">:snowflake: Wolly's NixOS configuration Flake :snowflake:</p>

<details>
  <summary>View Contents</summary>
  <ul>
    <li>
      <a href="#Screenshots"> 
        Screenshots
      </a>
    </li>
    <li>
      <a href="#System%20%Components"> 
        System Components
      </a>
    </li>
    <li>
      <a href="#Installation"> 
        Installation
      </a>
    </li>
    <li>
      <a href="#Acknowledgements"> 
        Acknowledgements
      </a>
    </li>
  </ul>
</details>

# 👀 Screenshots

# System Components

|              |   Wayland    |  Xorg   | 
| ------------ | ------------ | ------- |
| WM           | Hyprland     | DWM     |
| Compositor   | Wayland      | Picom   |
| Terminal     | Kitty        | ST      |
| Used by host | Laptop       | Minimal |
| Editor       | Neovim/Emacs | Neovim  |


# 🔧 Installation Guide
You will need to download [NixOS minimal installation](https://nixos.org/download#:~:text=without%20a%20desktop.-,Minimal%20ISO%20image,-The%20minimal%20installation) ISO and create a bootable disk/usb.

## 1. Partition
You can use `cfdisk` for create 3 partition if your on UEFI boot:

| Label |   Directory    | Size  |
| ----- | -------------- | ----- |
| Boot  | /dev/nvme0n1p1 | 100MB |
| Swap  | /dev/nvme0n1p2 |  8GB  |
| Root  | /dev/nvme0n1p3 | Rest  |

- **Format created partitions**
    - Boot
    ```
    mkfs.fat -F 32 -n boot /dev/nvme0n1p1
    ```
    - Swap
    ```
    mkswap -L /dev/nvme0n1p2
    ```
    - Root
    ```
    mkfs.ext4 -L nixos /dev/nvme0n1p3
    ```
<p align="right"><a href="#top">back to top</a></p>

## 2. Mounting

- Mount Home directory
```
mount /dev/disk/by-label/nixos /mnt
```
- Make & Mount Boot directory
```
mkdir -p /mnt/boot && mount /dev/disk/by-label/boot /mnt/boot
```
<p align="right"><a href="#top">back to top</a></p>

### 3. Installation
- **Choose what host to install:**
  - Laptop 
    ```
    chmod +x ~/Flakes/scripts/laptop.sh && ~/Flakes/scripts/laptop.sh
    ```
  - Minimal
    ```
    chmod +x ~/Flakes/scripts/minimal.sh && ~/Flakes/scripts/minimal.sh
    ```
  - Virtual Machine(VM)
    ```
    chmod +x ~/Flakes/scripts/vm.sh && ~/Flakes/scripts/vm.sh
    ```

- Reboot your computer
```
reboot
```
<p align="right"><a href="#top">back to top</a></p>

# 🙏 Acknowledgements
- [Ruixi]: NixOS configuration
- [Matthias Benaets]: NixOS configuration
- [Tai Aoki]: Yukopi Wallpaper Art

<!-- Acknowledgements -->
[Tai Aoki]: https://www.behance.net/Busker
[Ruixi]: https://github.com/Ruixi-rebirth/melted-flakes
[Matthias Benaets]: https://github.com/MatthiasBenaets/nixos-config
