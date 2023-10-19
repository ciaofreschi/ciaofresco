## Scraping

- Collect URL and analyze different locales and data structures
- Understand the authorization mechanism
- Research information on how to write a scraper


# How to get recipes online
www.hellofresh.it/recipes 
www.hellofresh.it/spesa-online/menu-settimanale

Website url can be obtained by contatenating slug and id

https://www.hellofresh.be/recipes/{slug}-{id}

## Example of curl request to retrieve a recipe

```
curl 'https://www.hellofresh.it/gw/recipes/recipes/64ba83cfd4684302b87576ce?country=IT&locale=it-IT' \
  -H 'authority: www.hellofresh.it' \
  -H 'accept: */*' \
  -H 'accept-language: en-US,en;q=0.9,it-IT;q=0.8,it;q=0.7' \
  -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDAzNzI4MzAsImlhdCI6MTY5Nzc0MzA4NywiaXNzIjoic2VuZiIsImp0aSI6ImM5ZmRmNzMyLTUwNjMtNDRlNC05MDdjLTBlMWI4YzY1ZmZkZiJ9.79Op-0bJVwl0CGPvKN5ATaEdLVcicrwGJ4J7HtRPDh4' \
  -H 'cookie: hf_public_id=4a627977-0e9a-43ac-97a1-5308fcb93fd8; _HFtr=165848417.1693946478; _ga=GA1.1.1880078641.1693946478; FPAU=1.2.1030696363.1693946478; _fbp=fb.1.1693946478615.1197742366; __cf_bm=kFmADsPvGSbqPL.FnC0tnG8T8EUNl.3kN2ug9NwkHnk-1697745860-0-AWL7yumqScDwXA/jC5ZrnsBytWCxqicT0meqMvjHrksf/uXDAA+dwVoBLL2pQ3j1BaqC8BEVXKUBU1LhtAAqQdE=; __cfruid=5caa4d18574c61992e9b3a35693f32ff08c9f7f8-1697745861; hf_system_country=IT; hf_initial_page=/; _HFtr_gid=183317549.1697745863; _HFtr_gat=1; hf_cookie_permissions={"essential":true,"marketing":true,"functional":true}; _hjSessionUser_2740577=eyJpZCI6ImZhNjVhMzBmLTlhYWEtNWQxYi05NTllLTI2ODZlMDczNTViYSIsImNyZWF0ZWQiOjE2OTM5NDY0Nzg0MjQsImV4aXN0aW5nIjp0cnVlfQ==; _hjIncludedInSessionSample_2740577=0; _hjSession_2740577=eyJpZCI6ImU0ZTE3MmU0LThkZjYtNDRjOS05MzM2LWU5OTdhMTMxYTg2YSIsImNyZWF0ZWQiOjE2OTc3NDU4NjQzMDgsImluU2FtcGxlIjpmYWxzZSwic2Vzc2lvbml6ZXJCZXRhRW5hYmxlZCI6dHJ1ZX0=; _hjAbsoluteSessionInProgress=0; FPGSID=1.1697745864.1697745864.G-TDSYHGSSDH.u4GsCx3bkyKpQsUx6tAtaQ; _clck=7zjjfu|2|ffz|0|1343; _uetsid=b312e5206eba11ee9545e503e4fa48a2; _uetvid=909255604c2c11eead85b3a000a1f88e; _tq_id.TV-099045-1.c917=99a0b5390a925874.1693946479.0.1697745889..; _clsk=1f5byzv|1697745889448|2|1|t.clarity.ms/collect; _ga_TDSYHGSSDH=GS1.1.1697745863.2.1.1697745908.0.0.0' \
  -H 'dpr: 2' \
  -H 'referer: https://www.hellofresh.it/menus' \
  -H 'sec-ch-ua: "Google Chrome";v="117", "Not;A=Brand";v="8", "Chromium";v="117"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36' \
  -H 'viewport-width: 1358' \
  -H 'x-requested-by: organic' \
  --compressed
```