#!/usr/local/bin/lua52
--[[Waffle customization template for wpa_supplicant 
by tupoll for freebsd.
--]]
local a =('ssid="')
local c =('"')
local b = ('\n')
local d = ("network={\n")
local e = ("}")
local f = ('psk="')


io.write("\027[s") -- save cursor position
print('Введите имя wifi сети')
l=io.read()
io.write('\027[u',('*'):rep(#l),"\n") -- rewind to where we were, and fill with the correct amount of stars
print('ssid="', l, '"\n')
print('Введите пароль wifi сети')
m=io.read()
io.write('\027[u',('*'):rep(#m),"\n") -- rewind to where we were, and fill with the correct amount of stars
print('psk="', m, '"\n')
wpaspl = io.open("/tmp/wpa_supplicant.conf", "w")
wpaspl:write(d, a, l, c, b, f, m, c, b, e)
wpaspl:close()
os.execute("sudo mv -f /tmp/wpa_supplicant.conf /etc/wpa_supplicant.conf")
print('Перезагрузите для запуска сети')
os.execute("exit")
