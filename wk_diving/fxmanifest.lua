fx_version 'adamant'

game 'gta5'

client_scripts {
    "@mysql-async/lib/MySQL.lua",
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",

    "client.lua",
}


server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server.lua"
}


ui_page "ui/index.html"


files {
	"ui/index.html",
	"ui/index.css",
	"ui/index.js"
}