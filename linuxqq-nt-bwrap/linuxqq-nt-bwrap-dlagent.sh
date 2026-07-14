_get_sign="https://im.qq.com/http2rpc/gotrpc/noauth/trpc.qqntv2.urlsign.UrlSign/GetSign"
_cookie="tgw_l7_route=$(curl -fsSLc- https://im.qq.com | awk '/tgw_l7_route/{print $7}')"
_signed="$(curl -fsSL "$_get_sign" -b "$_cookie" -H "Content-Type: application/json" -H "x-oidb: {\"uint32_command\":\"0x9b8e\",\"uint32_service_type\":1}" --data "{\"url\": \"$1\"}" | awk -F\" '{for(i=1;i<NF;i++){if($i ~ /^h/){gsub("\\\\","",$i);print $i}}}')"
curl -qgb "" -fLC - --retry 3 --retry-delay 3 "$_signed" -o "$2"
exit 0
