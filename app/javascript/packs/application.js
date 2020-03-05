import "bootstrap";
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import 'mapbox-gl/dist/mapbox-gl.css';

import flatpickr from "flatpickr";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import {initflatpicker} from '../plugins/init_flatpickr';
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
initUpdateNavbarOnScroll();

initflatpicker();
