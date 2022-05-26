// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import BarcodeReaderController from "./barcode_reader_controller.js"
application.register("barcode-reader", BarcodeReaderController)

import InputMaskController from "./input_mask_controller.js"
application.register("input-mask", InputMaskController)

import NumberMaskController from "./number_mask_controller.js"
application.register("number-mask", NumberMaskController)

import PrintController from "./print_controller.js"
application.register("print", PrintController)
