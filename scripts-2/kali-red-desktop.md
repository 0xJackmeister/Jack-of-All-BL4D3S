# kali-red-desktop

## Download Desktop image

<details>

<summary>Kali Desktop Wallpaper</summary>

<img src="https://user-images.githubusercontent.com/78603128/228483112-91b5743a-bf9b-4730-b268-dbe8eba0888b.png" alt="kali-night-skyB-1920x1080" data-size="original"><img src="https://user-images.githubusercontent.com/78603128/228483132-c004b431-c4a1-4b96-b1aa-964ef23a8a5c.png" alt="kali-polygon-2560x1080" data-size="original"><img src="https://user-images.githubusercontent.com/78603128/228483140-80d6f4e0-aca3-4719-b8e9-60793a3f48a4.png" alt="kali-polygon-dragonB-1920x1080" data-size="original"><img src="https://user-images.githubusercontent.com/78603128/228483145-21c851d8-7575-4bda-b9d3-6de0e42bd9ff.png" alt="kali-fade-2020b-3840x2160" data-size="original"><img src="https://user-images.githubusercontent.com/78603128/228483509-bb7397a4-c841-469b-8773-d09aa267cf91.png" alt="kali_dragon_font" data-size="original"><img src="https://user-images.githubusercontent.com/78603128/228483523-5d63e92f-2679-4570-b78b-cfc8263b1bd6.png" alt="kali_red" data-size="original"><img src="https://user-images.githubusercontent.com/78603128/228483529-8d964615-c7a1-4efa-a73a-e481221c5a72.png" alt="kali-3d-black-1920x1080" data-size="original"><img src="https://user-images.githubusercontent.com/78603128/228483536-d6bc29ab-3a65-4695-96fc-3f6349f1eba4.png" alt="kali-linux-wallpaper-v1" data-size="original"><img src="https://user-images.githubusercontent.com/78603128/228483541-6512bf1c-eb1a-42d9-85cf-49f1d77d29ef.png" alt="kali-polygon-dragonB-1920x1080" data-size="original"><img src="https://user-images.githubusercontent.com/78603128/228483549-b70ee82d-0574-4b7a-9606-327f234f262d.jpg" alt="red-kali-abstract-sky-dark-16x9" data-size="original">

https://github.com/owerdogan/wallpapers-for-kali

</details>

## Download login screen image

<details>

<summary>Kali Login wallpaper</summary>

<img src="https://user-images.githubusercontent.com/78603128/228484220-04a93200-1e2f-4803-b758-6727731832db.jpg" alt="red-kali-contours" data-size="original">

</details>

## Download login profile icon

<details>

<summary>Kali Login User icon</summary>

<img src="https://user-images.githubusercontent.com/78603128/228484350-a8b13717-f237-4b49-8fd0-052c99319abd.png" alt="Screenshot_2023-03-29_160318-removebg-preview" data-size="original">

### You will need to convert to .ico file

https://convertico.com/

</details>

## Necessary commands to change wallpaper

```
sudo mv desktop-image.png /usr/share/backgrounds/ && chmod 555 desktop-image.png
sudo mv login-image.png /usr/share/backgrounds/ && chmod 555 login-image.png
sudo mv user-icon.ico /usr/share/backgrounds/ && chmod 555 user-icon.ico
```

### Locate LightDM GTK+ Greeter to change icon and login screen wallpaper

## To change boot screen

```
1. chmod 644 kali_red.png
2. sudo cp -r kali_red.png /boot/grub/themes/kali
3. sudo nano theme.txt
desktop-image: "kali_red.png"

4. sudo nano grub_background.sh
WALLPAPER=/boot/grub/themes/kali/kali_red.png

5. chmod 644 background_ii.png
6. sudo cp -r background_ii.png /boot/grub
7. sudo update-grub
```
