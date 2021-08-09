import 'package:beautifulsoup/beautifulsoup.dart';
import 'package:http/http.dart';

Map<String, String> headers = {
  'ATERNOS_SESSION':
      'set-cookie: ATERNOS_SESSION=EDhkAC5qdXJK7PPViW23PkaR6urVPX8Xkgq4Eh6UFCAu632DzZYMecG3KhFpVNbpyLjx6fI7gskGpc03FwbrJJhSPmUJHHSQE3qY; expires=Thu, 06-Aug-2020 13:42:20 GMT; Max-Age=2592000; path=/; HttpOnly; SameSite=Lax, set-cookie: ATERNOS_SEC_farzp6rxjah00000=deleted; expires=Thu, 01-Jan-1970 00:00:01 GMT; Max-Age=0; path=/panel/ajax/start.php',
  'User-Agent':
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0',
  'Cookie':
      'ATERNOS_SEC_6ps7gmqemeg00000=1dytzj69lubj0000; __cfduid=d940902ed5fa8c6cacffc55a8715137bf1593987935; _ga=GA1.2.1202669642.1593990296; PHPSESSID=n89pbic30tp8jbjfrmc44kalbn; __gads=ID=bd18f18daeb0f4c9:T=1593990607:S=ALNI_MY_69mid9Yk-KwbU3dYlWjgnQwkUQ; ATERNOS_SERVER=tL0lmF1KZT8O8KwN; ATERNOS_SESSION=EDhkAC5qdXJK7PPViW23PkaR6urVPX8Xkgq4Eh6UFCAu632DzZYMecG3KhFpVNbpyLjx6fI7gskGpc03FwbrJJhSPmUJHHSQE3qY; DigiTrust.v1.identity=eyJpZCI6IlRUNUZVUzdKOXVSbDNBR0txQjZyL05hYVRsN1owWXlqaHFpaWFUYlhuZzJJb2kzWEdWcVdNWFptOVRmclpOdHUvZ2FwQXpiUWlxWUZvZXBYenpER3RxendOYkR3NHZaUTE5ZzZ2WHdMbENQTHVZY3NESVJOSlY3bDM4SGZOZmZPcWhGSTlUOW0rV0ZDcm1WYmY2bEdXMzBCS2pzdVo2Q2JQd0NQa2ZVV04zNWt1NkdhdUs5TERuM00xaEE3OTdrUDBCWlJNOTlYTnlkaGQxMUlUakw2aW9SdUltNkhGOExlT3gySGpPN1p6VXdyUGw2QUZQMWlzdlN1dSttQ0RRZnFDUXF0OENvTTRlLzNRRmZGZjRSK0xua283cERWNGVwU2pzM0R0eEpGaGZ5cGJIV0F3Q2hyZVhhOGhMVGNkczM4RnlabmtuYzZhYmI1YU1LbnBxUEN5UT09IiwidmVyc2lvbiI6MiwicHJvZHVjZXIiOiIxQ3JzZFVOQW82IiwicHJpdmFjeSI6eyJvcHRvdXQiOmZhbHNlfSwia2V5diI6NH0%3D; ATERNOS_SESSION=EDhkAC5qdXJK7PPViW23PkaR6urVPX8Xkgq4Eh6UFCAu632DzZYMecG3KhFpVNbpyLjx6fI7gskGpc03FwbrJJhSPmUJHHSQE3qY; _gid=GA1.2.558139580.1594114776; DigiTrust.v1.identity=eyJpZCI6IkVwTWRHQUpNZFR0R2N3MVhYVjI5TlVoZUR4Ym4wc2p2SHVzcU8weWEySVJEUlhNU1hOSEhCZ0JGVTAxQWNITjFSZkFxTU9UQW1yT2lWOHVVQk9BOWY1a3ZxSDluaXpwNjVXN2lKSzQ2UW0yNDdkdEkyZm9oQ1Jnd0VISTdrcDNlQ2tsWXBuUzloK1pIS3I2VUVvdEpSRTFDS0xBQnREd0d5ZXpEMUZic2pZbWh3b2t6YlkvU2JTNTVPc1czUmtMdXpOZXhTRHBLTm9ja1p6cGZOWGRuL0g1Qm9ISmQwY0srK2E2UDNKeU9JS21HT3pRK1lCV2xyUlk3QXRVcVpTakg4dERIQTRPUDNiaXNTQVkzYWN1YmRuWXppT3RyU3l3ZHBCdlk5TzNxZmZmNTNlRWEzTk1oaVFNKyt6TmQ5T3B6RlVQWmdvbmw2YklQZDBteVZyWDhSUT09IiwidmVyc2lvbiI6MiwicHJvZHVjZXIiOiIxQ3JzZFVOQW82IiwicHJpdmFjeSI6eyJvcHRvdXQiOmZhbHNlfSwia2V5diI6NH0%3D; cnx_userId=fd2df24f554841e398a53646ff3fd92c; GED_PLAYLIST_ACTIVITY=W3sidSI6IjhYbWoiLCJ0c2wiOjE1OTQxMjkwODMsIm52IjoxLCJ1cHQiOjE1OTQxMjkwNjQsImx0IjoxNTk0MTI5MDgxfV0.; ATERNOS_SERVER=tL0lmF1KZT8O8KwN; _gat=1'
};
String sec = "6ps7gmqemeg00000:1dytzj69lubj0000";

Future<String> serverStatus() async {
  Response status = await get(Uri.decodeFull('https://aternos.org/server/'),
      headers: headers);
  var statusSoup = Beautifulsoup(status.body);
  return (statusSoup('.statuslabel-label').text.trim());
}

queueConfirm() async {
  await get(
      Uri.decodeFull('https://aternos.org/panel/ajax/confirm.php?SEC=${sec}'),
      headers: headers);
  return (await serverStatus());
}

Future<String> remainTime() async {
  Response time = await get(Uri.decodeFull('https://aternos.org/server/'),
      headers: headers);
  var timeSoup = Beautifulsoup(time.body);
  return (timeSoup('.server-status-label-left').text.trim());
}

Future<String> startServer() async {
  if (await serverStatus() == 'Offline') {
    await get(
        Uri.decodeFull(
            'https://aternos.org/panel/ajax/start.php?headstart=0&SEC=${sec}'),
        headers: headers);
    return ('Sit back and relax. ${await remainTime()}');
  } else if (await serverStatus() == 'Online') {
    return ("Server is already Online");
  } else {
    return ("Server is in processing state. Try after some time.");
  }
}
