// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddressAutocompleteController from "./address_autocomplete_controller.js"
application.register("address-autocomplete", AddressAutocompleteController)

import DynamicBookingPriceController from "./dynamic_booking_price_controller.js"
application.register("dynamic-booking-price", DynamicBookingPriceController)

import FlatpickrController from "./flatpickr_controller.js"
application.register("flatpickr", FlatpickrController)

import FullscreenController from "./fullscreen_controller.js"
application.register("fullscreen", FullscreenController)

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import MapController from "./map_controller.js"
application.register("map", MapController)

import TimeoutController from "./timeout_controller.js"
application.register("timeout", TimeoutController)
