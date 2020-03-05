import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const fitMapToMarkers = (map, markers) => {
  //creating a new bounds element
  const bounds = new mapboxgl.LngLatBounds();
  //extending the bouds with all my markers
  // A LngLatBounds object represents a geographical bounding box, defined by
  // its southwest and northeast points in longitude and latitude.
  // If no arguments are provided to the constructor, a null bounding box is created.
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  // .extend = Extend the bounds to include a given LngLat or LngLatBounds.
  //Adding some options to my bound
  map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 3000 });
  // .fitBounds = use only when fitting the initial bounds provided above.
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    // element.style.backgroundImage = "url('https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678111-map-marker-512.png')"
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';

    console.log(marker.lng)
    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  // grab our map element and store it in a constant mapElement

  if (mapElement) {
    // only build a map if there's a div#map to inject into
    // creating the map giving to mapbox the api key
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    // common when passing information from HTML to JS. mapElement (is our constant that we grab
    // with getElementById ie. map), dataset is referring to the data elements that are present
    //in the map <div> in index.html.erb, and mapboxApiKey grabs the key from index.html.erb
    // Initializing a new map
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    // common when passing information from HTML to JS. mapElement (is our constant that we grab
    // with getElementById ie. map), dataset is referring to the data elements that are present
    //in the map <div> in index.html.erb, and mapboxApiKey grabs the key from index.html.erb
    // console.log(markers)

  // iterating trough the markers we just defined and and for every marker we display a marker on the map
      addMarkersToMap(map, markers)
    //fit the map to markers
      fitMapToMarkers(map, markers);
      map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      //add this line to your code
      mapboxgl: mapboxgl
    }))
  }
}

export { initMapbox };
