import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const fitMapToMarkers = (map, markers) => {
  //creating a new bounds element
  const bounds = new mapboxgl.LngLatBounds();
  //extending the bouds with all my markers
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  //Adding some options to my bound
  map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 3000 });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    // element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundImage = "url('https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678111-map-marker-512.png')"
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    // only build a map if there's a div#map to inject into
    // creating the map giving to mapbox the api key
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    // Initializing a new map
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);

  // iterating trough the markers we just defined and and for every marker we display a marker on the map
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    // });
      addMarkersToMap(map, markers)
    //fit the map to markers
      fitMapToMarkers(map, markers);
      map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      //add this line to your code
      mapboxgl: mapboxgl
    }))
  })
};
}



export { initMapbox };
