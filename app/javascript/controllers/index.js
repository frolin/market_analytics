// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
// import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
// eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

// const controllers = import.meta.glob(
//   "../../../app/frontend/components/**/controller.js"
// )
//
// for (let path in controllers) {
//   let module = controllers[path]
//   let name = path
//     .match(/app\/frontend\/components\/(.+)\/controller\.js$/)[1]
//     .replaceAll("_", "-")
//     .replaceAll("/", "--")
//
//
//
//   application.register(name, module.default)
// }

// document.addEventListener("turbo:frame-load", function() {
//   // Check if the Turbo Frame that just loaded contains a Chart.js chart
//   const chartElement = document.querySelector(".c--chartjs--container>canvas")
//   if (chartElement) {
//     // Get the data for the chart from the element's data attributes
//     const chartData = JSON.parse(chartElement.dataset.chartDataValue);
//
//     // Re-initialize the Chart.js chart with the new data
//       debugger
//
//     const ctx = chartElement.getContext("2d");
//     new Chart(ctx, {
//       type: chartData.type,
//       data: chartData.data,
//       options: chartData.options
//     });
//   }
// });
//

import Chart from '../../frontend/components/chartjs/controller'
application.register('chartjs', Chart)

import DateRangeController from "../../frontend/components/date_range/controller";
application.register('dateRange', DateRangeController)

// import ApplicationController from "./animations";
// application.register('animations', ApplicationController)

// import ApplicationController from "./select2_controller";
// application.register('select2_controller', ApplicationController)
