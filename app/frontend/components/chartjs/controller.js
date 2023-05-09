import {Controller} from "@hotwired/stimulus"
import _ from 'lodash';

import {merge} from 'lodash';

import Moment from 'moment';

import 'moment/locale/ru';
import chartTrendline from 'chartjs-plugin-trendline';

import Chart from 'chart.js/auto'
import 'chartjs-adapter-moment';

Moment.locale('ru');

import ChartDataLabels from 'chartjs-plugin-datalabels'
Chart.register(ChartDataLabels);

// import {Colors} from 'chart.js';

// Chart.register(chartTrendline);
// Chart.register(Colors);

export default class extends Controller {
  static targets = ['chart', 'canvas'];

  canvasContext() {
    return this.canvasTarget.getContext('2d');
  }


  createNewChart() {
    new Chart(this.canvasContext(), {
      plugins: [ChartDataLabels],
      type: 'line',
      data: this.chartData,
      options: this.fullOptions
    })
  }

  get chartData() {
    return JSON.parse(this.canvasTarget.dataset.chartDataValue)
  }


  get fullOptions() {
    const chartOptions = JSON.parse(this.canvasTarget.dataset.chartOptionsValue);
    return this.deepMergeWithAdd(chartOptions, this.overrideOptions);
  }

  get overrideOptions() {
    return {
      tooltips: {
        // callbacks: {
        //     label: function (tooltipItem, data) {
        //         return 1321;
        //     },
        // },
      },
      scales: {
        y: {
          ticks: {
            callback: function (value, index, ticks) {
              return value + ' шт.';
            }
          }
        },
        y1: {
          ticks: {
            callback: function (value, index, ticks) {
              return value + ' шт.';
            }
          }
        },
        y2: {
          ticks: {
            callback: function (value, index, ticks) {
              return value + ' шт.';
            }
          }
        },
        y3: {
          ticks: {
            callback: function (value, index, ticks) {
              return value + ' ₽';
            }
          }
        }
      }
      // scales: {
      //     y: {
      //         ticks: {
      //             // Include a dollar sign in the ticks
      //             callback: function (value, index, ticks) {
      //                 return '$' + value;
      //             }
      //         }
      //     }
      // }
    }
  }

  deepMergeWithAdd(obj1, obj2) {
    const result = {};

    // Merge properties from obj1
    for (let key in obj1) {
      const val1 = obj1[key];
      const val2 = obj2[key];

      if (val1 && typeof val1 === 'object' && val2 && typeof val2 === 'object') {
        result[key] = this.deepMergeWithAdd(val1, val2);
      } else if (typeof val1 === 'number' && typeof val2 === 'number') {
        result[key] = val1 + val2;
      } else {
        result[key] = val1;
      }
    }

    // Merge properties from obj2 that are not in obj1
    for (let key in obj2) {
      const val1 = obj1[key];
      const val2 = obj2[key];

      if (!val1 && val2) {
        result[key] = val2;
      }
    }

    return result;
  }


  connect() {
    const chart = this.createNewChart()
  }


  disconnect() {
    // this.chart.destroy()
  }


  canvasTargetConnect() {
    console.log('CONNECT NEW DATASET')
  }


  // Bind an action on this method
  // async update() {
  //   const response = await fetch('https://example.com/chart_data.json')
  //   const data = await response.json()
  //
  //   this.chart.data = data
  //   this.chart.update()
  // }

  // You can set default options in this getter for all your charts.


  get defaultDataSet() {
    return {
      ...this.chart.data,
      // borderColor: ["rgba(248, 142, 72, 0.9)"],
      // backgroundColor: ["rgba(248, 142, 72, .7)"],
      borderWidth: 1,
      pointBackgroundColor: "1e9ff2",
      pointHoverBackgroundColor: "1e9ff2",
      pointHitRadius: 50,
      tension: 1
    }
  }

  get defaultOptions() {
    return {
      plugins: {
        legend: {display: false},
        tooltip: {displayColors: false, callbacks: {}},
        title: {font: {size: 20}, color: "#333"},
        interaction: {},
      },
      fill: true,
      scales: {
        y: {
          ticks: {
            callback: function (label, index, labels) {
              return label;
            }
          },
          title: {
            font: {size: 16},
            color: "#333"
          },
          grid: {}, min: 0, max: 7
        },
        x: {
          grid:
            {drawOnChartArea: false},
          title: {
            font: {size: 16},
            color: "#333"
          },
          time: {unit: "day", stepSize: 8, tooltipFormat: "P"},
          ticks: {}, type: "time"
        },
        xAxes: [{
          type: "date",
          time: {
            unit: 'day',
            tooltipFormat: 'YYYY',
            displayFormats: {
              day: 'YYYY'
            },
          },
          scaleLabel: {
            display: false,
          },
          ticks: {

            // Here's where the magic happens:
            callback: function (label, index, labels) {

              return '123';
            }
          }
        }],
        yAxes: [{
          id: 'A',
          type: 'linear',
          position: 'left',
        }, {
          id: 'B',
          type: 'linear',
          position: 'right',
          ticks: {
            max: 1,
            min: 0
          }
        }]
      },
      tooltips: {
        callbacks: {
          // Here's where the magic happens:
          title: function (data) {
            return data[0];
          },
          label: function (item, data) {
            return item;
          }
        }
      },
      // colors: ["1e9ff2"],
      // fill: true,
      responsive: true
    }

  }

}