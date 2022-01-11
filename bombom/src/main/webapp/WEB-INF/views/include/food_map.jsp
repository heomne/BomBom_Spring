<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    
        <script>
            L_NO_TOUCH = false;
            L_DISABLE_3D = false;
        </script>
    
    <style>html, body {width: 100%;height: 100%;margin: 0;padding: 0;}</style>
    <style>#map {position:absolute;top:0;bottom:0;right:0;left:0;}</style>
    <script src="https://cdn.jsdelivr.net/npm/leaflet@1.6.0/dist/leaflet.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet@1.6.0/dist/leaflet.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/python-visualization/folium/folium/templates/leaflet.awesome.rotate.min.css"/>
    
            <meta name="viewport" content="width=device-width,
                initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
            <style>
                #map_6b34f60669984c019b3e36b48a151f0e {
                    position: relative;
                    width: 1000.0px;
                    height: 500.0px;
                    left: 0.0%;
                    top: 0.0%;
                }
            </style>
        
</head>
<body>    
    
            <div class="folium-map" id="map_6b34f60669984c019b3e36b48a151f0e" ></div>
        
</body>
<script>    
    
            var map_6b34f60669984c019b3e36b48a151f0e = L.map(
                "map_6b34f60669984c019b3e36b48a151f0e",
                {
                    center: [37.53044888966384, 126.99692497588936],
                    crs: L.CRS.EPSG3857,
                    zoom: 14,
                    zoomControl: true,
                    preferCanvas: false,
                }
            );
 
    
            var tile_layer_f815fcdc84ca4d6fb46ab158a66cb12c = L.tileLayer(
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                {"attribution": "Data by \u0026copy; \u003ca href=\"http://openstreetmap.org\"\u003eOpenStreetMap\u003c/a\u003e, under \u003ca href=\"http://www.openstreetmap.org/copyright\"\u003eODbL\u003c/a\u003e.", "detectRetina": false, "maxNativeZoom": 18, "maxZoom": 18, "minZoom": 0, "noWrap": false, "opacity": 1, "subdomains": "abc", "tms": false}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
            var marker_13db5751e2ad4ab49ed42c2796a99d46 = L.marker(
                [37.54040696, 126.9947589],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_7f4d41bbf70e4aa4b8609bbd66a696af = L.popup({"maxWidth": "100%"});

        
            var html_72ced69992b14574ba8f1062d72acd10 = $(`<div id="html_72ced69992b14574ba8f1062d72acd10" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>도쿄살롱</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_7f4d41bbf70e4aa4b8609bbd66a696af.setContent(html_72ced69992b14574ba8f1062d72acd10);
        

        marker_13db5751e2ad4ab49ed42c2796a99d46.bindPopup(popup_7f4d41bbf70e4aa4b8609bbd66a696af)
        ;


            marker_13db5751e2ad4ab49ed42c2796a99d46.bindTooltip(
                `<div>
                     매일 신선한 재료로 정성껏 만든 수제꼬치
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_de90544b6e514fd19664e7a1da9f953e = L.marker(
                [37.53546566, 126.9911929],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_6bfbee604f654b1fadb90fdfc491529e = L.popup({"maxWidth": "100%"});

        
            var html_456cede1cf90427c985d0e243a0c4082 = $(`<div id="html_456cede1cf90427c985d0e243a0c4082" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>바이휴고</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_6bfbee604f654b1fadb90fdfc491529e.setContent(html_456cede1cf90427c985d0e243a0c4082);
        

        marker_de90544b6e514fd19664e7a1da9f953e.bindPopup(popup_6bfbee604f654b1fadb90fdfc491529e)
        ;

        
    
    
            marker_de90544b6e514fd19664e7a1da9f953e.bindTooltip(
                `<div>
                     캐쥬얼한 프렌치 레스토랑
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_33f3adcc7fc24fdd84f88bd0cb86b019 = L.marker(
                [37.53319874, 126.9912158],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_47cff73dd0a645c48a9704bbed630827 = L.popup({"maxWidth": "100%"});

        
            var html_8cc6b13e71c143a29c56bdb1ddf982b4 = $(`<div id="html_8cc6b13e71c143a29c56bdb1ddf982b4" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>Africanport</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_47cff73dd0a645c48a9704bbed630827.setContent(html_8cc6b13e71c143a29c56bdb1ddf982b4);
        

        marker_33f3adcc7fc24fdd84f88bd0cb86b019.bindPopup(popup_47cff73dd0a645c48a9704bbed630827)
        ;

        
    
    
            marker_33f3adcc7fc24fdd84f88bd0cb86b019.bindTooltip(
                `<div>
                     아프리카의 품속으로
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_e259a72cc10f4f069a204321a0b49585 = L.marker(
                [37.53963898, 126.9898573],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_be8f7af1f8074a6897fc422c9997da67 = L.popup({"maxWidth": "100%"});

        
            var html_1c69e6fec5a342508f86f686b6a6f978 = $(`<div id="html_1c69e6fec5a342508f86f686b6a6f978" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>고로킹</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_be8f7af1f8074a6897fc422c9997da67.setContent(html_1c69e6fec5a342508f86f686b6a6f978);
        

        marker_e259a72cc10f4f069a204321a0b49585.bindPopup(popup_be8f7af1f8074a6897fc422c9997da67)
        ;

        
    
    
            marker_e259a72cc10f4f069a204321a0b49585.bindTooltip(
                `<div>
                     지구에서 제일 맛있는 고로케
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_6941b11a046148b1b29a9ab3d983db74 = L.marker(
                [37.53334665, 126.9935239],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_82aefd2d18f343b6ba594ee523daad46 = L.popup({"maxWidth": "100%"});

        
            var html_e81ccc6b4aff419f8b33e57dae9e6067 = $(`<div id="html_e81ccc6b4aff419f8b33e57dae9e6067" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>매덕스피자이태원점</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_82aefd2d18f343b6ba594ee523daad46.setContent(html_e81ccc6b4aff419f8b33e57dae9e6067);
        

        marker_6941b11a046148b1b29a9ab3d983db74.bindPopup(popup_82aefd2d18f343b6ba594ee523daad46)
        ;

        
    
    
            marker_6941b11a046148b1b29a9ab3d983db74.bindTooltip(
                `<div>
                     뉴욕스타일의 조각피자
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_25c9a9e6429c47699b34c748ae90c0d3 = L.marker(
                [37.53678504, 127.0016067],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_1b9c6bec9ff34f0cb1566cf83a5cec33 = L.popup({"maxWidth": "100%"});

        
            var html_6118e7160a6546b2b27b5b5adece767e = $(`<div id="html_6118e7160a6546b2b27b5b5adece767e" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>미트볼라운지</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_1b9c6bec9ff34f0cb1566cf83a5cec33.setContent(html_6118e7160a6546b2b27b5b5adece767e);
        

        marker_25c9a9e6429c47699b34c748ae90c0d3.bindPopup(popup_1b9c6bec9ff34f0cb1566cf83a5cec33)
        ;

        
    
    
            marker_25c9a9e6429c47699b34c748ae90c0d3.bindTooltip(
                `<div>
                     Fast casual dining pub 미트볼전문점으로 다양한 미국식 퓨전음식과 맥주를 트렌디하게 즐길 수 있습니다
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_189363de18994139ad254f1c4046331a = L.marker(
                [37.54086836, 127.0024848],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_eea1d2a4e1524ecc9444353b667a3e7b = L.popup({"maxWidth": "100%"});

        
            var html_87951a96a26f45d7a413ec72d86ea2dc = $(`<div id="html_87951a96a26f45d7a413ec72d86ea2dc" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>스테이지비</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_eea1d2a4e1524ecc9444353b667a3e7b.setContent(html_87951a96a26f45d7a413ec72d86ea2dc);
        

        marker_189363de18994139ad254f1c4046331a.bindPopup(popup_eea1d2a4e1524ecc9444353b667a3e7b)
        ;

        
    
    
            marker_189363de18994139ad254f1c4046331a.bindTooltip(
                `<div>
                     외식과 문화가 공존하는 예술의 공간
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_58df8381b0fe4d6aafa56c4a9001d037 = L.marker(
                [37.54086836, 127.0024848],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_e75a285a2e814179bdeb6ed61c287918 = L.popup({"maxWidth": "100%"});

        
            var html_fe09292925cd4060b13306b65575dea9 = $(`<div id="html_fe09292925cd4060b13306b65575dea9" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>솔로스키친</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_e75a285a2e814179bdeb6ed61c287918.setContent(html_fe09292925cd4060b13306b65575dea9);
        

        marker_58df8381b0fe4d6aafa56c4a9001d037.bindPopup(popup_e75a285a2e814179bdeb6ed61c287918)
        ;

        
    
    
            marker_58df8381b0fe4d6aafa56c4a9001d037.bindTooltip(
                `<div>
                     '혼공족'을 위해 간편하게 테이크아웃해서 어디서든 편안하게 먹을 수 있는 건강한 한그릇 메뉴
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_4ec8e3ec79ce40509b6784fae1010713 = L.marker(
                [37.53563537, 126.998855],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_e52f2cb0482e437c9fd9b10ba455eb54 = L.popup({"maxWidth": "100%"});

        
            var html_1a9619f89789416ca0e36ac8b8efbe29 = $(`<div id="html_1a9619f89789416ca0e36ac8b8efbe29" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>아라베스크이태원</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_e52f2cb0482e437c9fd9b10ba455eb54.setContent(html_1a9619f89789416ca0e36ac8b8efbe29);
        

        marker_4ec8e3ec79ce40509b6784fae1010713.bindPopup(popup_e52f2cb0482e437c9fd9b10ba455eb54)
        ;

        
    
    
            marker_4ec8e3ec79ce40509b6784fae1010713.bindTooltip(
                `<div>
                     할랄요리 전문점, 아랍요리 전문점
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_66938ba71020433c8c57c7a14735f340 = L.marker(
                [37.53666612, 126.9990948],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_7be21aef52034917962a6263f7bbcfa9 = L.popup({"maxWidth": "100%"});

        
            var html_3628b029bd2249378367a777b76f8f99 = $(`<div id="html_3628b029bd2249378367a777b76f8f99" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>앤와이비엔비버거엔베이글</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_7be21aef52034917962a6263f7bbcfa9.setContent(html_3628b029bd2249378367a777b76f8f99);
        

        marker_66938ba71020433c8c57c7a14735f340.bindPopup(popup_7be21aef52034917962a6263f7bbcfa9)
        ;

        
    
    
            marker_66938ba71020433c8c57c7a14735f340.bindTooltip(
                `<div>
                     한국에서 느낄 수 있는 뉴욕 맨하탄의 버거 맛
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_451861689abe41f4ab3204954885abcd = L.marker(
                [37.53468751, 126.9981354],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_c8a8d377947f4233abb7cc1ea68f0ad6 = L.popup({"maxWidth": "100%"});

        
            var html_7fa432e1ac76446cbf5c19c34f599d74 = $(`<div id="html_7fa432e1ac76446cbf5c19c34f599d74" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>유타로</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_c8a8d377947f4233abb7cc1ea68f0ad6.setContent(html_7fa432e1ac76446cbf5c19c34f599d74);
        

        marker_451861689abe41f4ab3204954885abcd.bindPopup(popup_c8a8d377947f4233abb7cc1ea68f0ad6)
        ;

        
    
    
            marker_451861689abe41f4ab3204954885abcd.bindTooltip(
                `<div>
                     먹는 것 이상의 맛있는 즐거운, 하키타 일본라면
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_0f12a412f8ad457d9c140062f6ef5011 = L.marker(
                [37.53453972, 126.9970583],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_3e39b4b249074d77887637b7e7fd4d7c = L.popup({"maxWidth": "100%"});

        
            var html_b91226e141d047e9b5267a0cfd56b60b = $(`<div id="html_b91226e141d047e9b5267a0cfd56b60b" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>후지야마소바</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_3e39b4b249074d77887637b7e7fd4d7c.setContent(html_b91226e141d047e9b5267a0cfd56b60b);
        

        marker_0f12a412f8ad457d9c140062f6ef5011.bindPopup(popup_3e39b4b249074d77887637b7e7fd4d7c)
        ;

        
    
    
            marker_0f12a412f8ad457d9c140062f6ef5011.bindTooltip(
                `<div>
                     일본에서 먹어본 맛을 즐길 수 있어요
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_3859c198aae44afa9b6213f0dbeddcfb = L.marker(
                [37.53737971, 127.000258],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_51d9e605d2e94b2a993bfde84230144a = L.popup({"maxWidth": "100%"});

        
            var html_203d8049811440a1a0cda6c97de295ba = $(`<div id="html_203d8049811440a1a0cda6c97de295ba" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>일키아쏘</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_51d9e605d2e94b2a993bfde84230144a.setContent(html_203d8049811440a1a0cda6c97de295ba);
        

        marker_3859c198aae44afa9b6213f0dbeddcfb.bindPopup(popup_51d9e605d2e94b2a993bfde84230144a)
        ;

        
    
    
            marker_3859c198aae44afa9b6213f0dbeddcfb.bindTooltip(
                `<div>
                     한남동에 위치한 이탈리아 본고장의 맛과 분위기를 느낄 수 있는 이탈리아 레스토랑
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_9bcfe4e219684389b576878624849532 = L.marker(
                [37.53393038, 126.9915235],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_9efb7548914845888301207dfddbc83f = L.popup({"maxWidth": "100%"});

        
            var html_a01751fc6ca84a4299602c285914e473 = $(`<div id="html_a01751fc6ca84a4299602c285914e473" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>포하우스</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_9efb7548914845888301207dfddbc83f.setContent(html_a01751fc6ca84a4299602c285914e473);
        

        marker_9bcfe4e219684389b576878624849532.bindPopup(popup_9efb7548914845888301207dfddbc83f)
        ;

        
    
    
            marker_9bcfe4e219684389b576878624849532.bindTooltip(
                `<div>
                     베트남쌀국수가 맛있는 이태원 포하우스
                 </div>`,
                {"sticky": true}
            );
        
    
            var marker_94ce959a3f5141d0b294c6031b078b60 = L.marker(
                [37.53695027, 127.0115182],
                {}
            ).addTo(map_6b34f60669984c019b3e36b48a151f0e);
        
    
        var popup_e253443d84ea45978486dfc1f16ee99b = L.popup({"maxWidth": "100%"});

        
            var html_fcc2ee4baaa349d0b50989acc830bcc8 = $(`<div id="html_fcc2ee4baaa349d0b50989acc830bcc8" style="width: 100.0%; height: 100.0%;"><div  style='width: 100px'><strong>매덕스피자한남점</strong></div><br>                               <br><img width='80px' src='a.jpg'><br>                               <a href='https://www.cgv.co.kr/' target='blank'>CGV</a></div>`)[0];
            popup_e253443d84ea45978486dfc1f16ee99b.setContent(html_fcc2ee4baaa349d0b50989acc830bcc8);
        

        marker_94ce959a3f5141d0b294c6031b078b60.bindPopup(popup_e253443d84ea45978486dfc1f16ee99b)
        ;

        
    
    
            marker_94ce959a3f5141d0b294c6031b078b60.bindTooltip(
                `<div>
                     뉴욕스타일의 조각피자
                 </div>`,
                {"sticky": true}
            );
        
</script>
</html>