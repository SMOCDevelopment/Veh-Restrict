# Veh-Restrict

A standalone FiveM vehicle restriction script that automatically deletes restricted vehicles upon player entry unless the player has override permission. Notifications are sent via **ox_lib**, and all removal events are logged to a Discord webhook securely.

![Preview](preview.mp4)   You need to download the MP4 video or view in my discord!

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Status](https://img.shields.io/badge/status-active-success)
[![Join our Discord](https://img.shields.io/discord/1336789892180738162?style=flat-square&logo=discord)](https://discord.gg/pHsTfwAXbF)
[![Support me on Patreon](https://img.shields.io/badge/Patreon-FF424D?style=flat&logo=patreon&logoColor=white)](https://www.patreon.com/c/smocdevelopment/membership)

---

## Features

- Instant detection and deletion of restricted vehicles  
- Uses **ox_lib** for in-game notifications  
- Logs vehicle removal events to a Discord webhook (server-side only)  
- Permission-based override (ACE permissions support)  
- Easily configurable restricted vehicle list  
- Lightweight and efficient design  

---

## Installation

1. Clone or download this repository into your FiveM resources folder as `Veh-Restrict`.  
2. Make sure you have [ox_lib](https://github.com/overextended/ox_lib) installed and started before this script.  
3. Add the following lines to your `server.cfg`:

    ```
    ensure ox_lib
    ensure Veh-Restrict
    ```

4. Open `config.lua` and set your Discord webhook URL:

    ```lua
    Config.Webhook = 'https://discord.com/api/webhooks/your_webhook_here'
    ```

5. (Optional) Set up ACE permissions for staff override in `server.cfg`:

    ```
    add_ace group.admin veh.override allow
    ```

---

## Usage

- Players attempting to enter restricted vehicles will be immediately removed from the vehicle, and the vehicle will be deleted.  
- Players with the `veh.override` ACE permission are exempt from this restriction.  
- All removals are logged with player info and vehicle model in your Discord webhook channel.

---

## Configuration

- **`config.lua`**: Set your Discord webhook URL here. Keep this file server-side only to prevent webhook exposure.  
- **`client.lua`**: Customize the restricted vehicle list if needed.

---



## License

This script is provided as-is. Feel free to modify and distribute it according to your needs.

## Support

For issues or feature requests, please join the discord https://discord.gg/pHsTfwAXbF


