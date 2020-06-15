'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/FontManifest.json": "580ff1a5d08679ded8fcf5c6848cece7",
"assets/AssetManifest.json": "99914b932bd37a50b983c5e7c90ae93b",
"assets/LICENSE": "9addd706811b9383b11ef9334d01895a",
"main.dart.js": "d3d16935f9743623b4c310f7c8b4f6b5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "4ec9326de583432e2d807ebaffe3d8a3",
"index.html": "a99c1da2cc5c87e0e7cb8829739c1738",
"/": "a99c1da2cc5c87e0e7cb8829739c1738",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
