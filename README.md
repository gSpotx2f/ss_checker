# Shadowsocks checker for OpenWrt.
Checking the availability of the Shadowsocks server.

**Dependences:** lua, luci-lib-nixio or luasocket.

## Installation notes

    opkg update
    wget --no-check-certificate -O /tmp/ss_checker_1.1.0-1_all.ipk https://github.com/gSpotx2f/packages-openwrt/raw/master/current/ss_checker_1.1.0-1_all.ipk
    opkg install /tmp/ss_checker_1.1.0-1_all.ipk
    rm /tmp/ss_checker_1.1.0-1_all.ipk

## Usage:

    ss_checker <ss:// URL> | <address:port> | -

    ss_checker "ss://Y2hhY2hhMjAtaWV0Zi1wb2x5MTMwNTpDb2VhZzVGcmlobXhCVWwxVVo0aG0x@ak1834.www.outline.network.fr8678825324247b8176d59f83c30bd94d23d2e3ac5cd4a743bkwqeikvdyufr.cyou:443#www.outline.network%20(NL)"

    ss_checker 123.45.67.89:443

    echo -e "ss://Y2hhY2hhMjAtaWV0Zi1wb2x5MTMwNTpDb2VhZzVGcmlobXhCVWwxVVo0aG0x@ak1834.www.outline.network.fr8678825324247b8176d59f83c30bd94d23d2e3ac5cd4a743bkwqeikvdyufr.cyou:443#www.outline.network%20(NL)\n123.45.67.89:443" | ss_checker -

    echo -e "ss://Y2hhY2hhMjAtaWV0Zi1wb2x5MTMwNTpDb2VhZzVGcmlobXhCVWwxVVo0aG0x@ak1834.www.outline.network.fr8678825324247b8176d59f83c30bd94d23d2e3ac5cd4a743bkwqeikvdyufr.cyou:443#www.outline.network%20(NL)\n123.45.67.89:443" > server_list.txt
    cat server_list.txt | ss_checker -
