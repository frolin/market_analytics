# frozen_string_literal: true

class Chartjs::Component < ApplicationViewComponent

  ORDER_COLORS = ['rgba(248, 142, 72, .3)', 'rgba(248, 142, 72, .5)']
  SALE_COLORS = ['rgba(30, 159, 242, .3)', 'rgba(30, 159, 242, .5)']
  COLOR_PALLET = ["rgba(234, 85, 69, 0.7)", "rgba(244, 106, 155, 0.6)", "rgba(239, 155, 32, 0.6)",
                  "rgba(237, 191, 51, 0.6)", "rgba(237, 225, 91, 0.6", "rgba(189, 207, 50, 0.6", "rgba(135, 188, 69, 0.6", "#27aeef", "#b33dc6"]

  COLORS = ['rgba(168, 186, 239, .7)', 'rgba(166, 157, 204, .7)', 'rgba(133, 158, 233, .7)', 'rgba(252, 198, 186, .7)', 'rgba(106, 76, 147, 0.6)']
  attr_reader :data, :options

  def initialize(data:, **kwargs)
    @data = data
    @dataset = collect_datasets
    @options = options
    @args = kwargs
    @summ = kwargs[:summ]

    # @source_colors = self.class.const_get("#{source.upcase}_COLORS") if source
  end

  def collect_datasets
    {
      labels: @data.first.dig(:data).keys,
      legend: false,
      datasets: @data.map { |params| dataset(params) }
    }
  end

  def dataset(params)
    {
      fill: true,
      type: params[:type],
      borderWidth: 1,
      min: 0,
      label: params[:label],
      data: params[:data].values,
      backgroundColor: params[:background_color],
      borderColor: params[:border_color],
      barThickness: params[:bar_thickness],
      **params

      # backgroundColor: @source_colors.to_a[0] || ORDER_COLORS[0],
      # borderColor: @source_colors.to_a[1] || ORDER_COLORS[1],
    }
  end

  def options
    {
      responsive: true,
      maintainAspectRatio: true,
      animation: false,
      plugins: {
        legend: true,
        # datalabels: {
        #   color: '#36A2EB'
        # },
      },
      # interaction: {
      #   mode: 'nearest',
      #   axis: 'x',
      #   intersect: false
      # },
      scales: {
        x: {
          # grid: { display: false }
          type: 'time',
          position: 'left',
          ticks: { beginAtZero: true },
        },
        y: {
          position: 'left',
          display: false,
          ticks: { stepSize: 1, beginAtZero: true, },
          grid: { display: false },
          max: 10,
          stacked: true,
        },
        y1: {
          position: 'left',
          # type: 'linear',
          ticks: { stepSize: 1, beginAtZero: true, },
          grid: { display: false },
          stacked: true,
          max: 10

        },
        y2: {
          position: 'right',
          type: 'linear',
          ticks: { stepSize: 500, color: Chartjs::Component::COLOR_PALLET[0], beginAtZero: true, },
          grid: { display: true },
        }
      }

    }

    # scales: {
    # y1: {
    #   # type: 'linear',
    #   # max: @data.first[:data].values.max + 5,
    #   # min: 0,
    #   # display: true,
    #   # ticks: {
    #   #   stepSize: 500,
    #   # },
    #   grid: {
    #     display: false
    #   },
    #   position: 'right'
    # },
    # B: {
    #   type: 'linear',
    #   display: true,
    #   position: 'right',
    #   grid: {
    #     display: false
    #   },
    #   # ticks: {
    #   #   display: true
    #   # },
    # },
    # x: {
    #   type: 'time',
    #   time: {
    #     displayFormats: {
    #       day: 'MM DD',
    #     },
    #     unit: 'day'
    #   },
    #   ticks: {
    #     # display: false
    #   }
    # },
    # y: {
    #   display: false,
    #   # position: 'right',
    #   ticks: {
    #     # display: false
    #   }
    # },
    # }
    # }

    #   {
    #     'plugins': ['ChartDataLabels'],
    #     "options": { "maintainAspectRatio": false, "animation": false,
    #                  "plugins": { "legend": { "display": true },
    #                               "tooltip": { "displayColors": false, "callbacks": {} },
    #                               "title": { "font": { "size": 20 }, "color": "#333" } },
    #                  "interaction": {},
    #                  "scales": {
    #                    "y":
    #                      { "ticks": { "maxTicksLimit": 4 },
    #                        "title": { "font": { "size": 16 },
    #                                   "color": "#333" },
    #                        "grid": {}, "min": 0, "max": 5 },
    #                    "x": { "grid":
    #                             { "drawOnChartArea": false },
    #                           "title": { "font": { "size": 16 },
    #                                      "color": "#333" },
    #                           "time": { "unit": "day", "stepSize": 8, "tooltipFormat": "PP" },
    #                           "ticks": {}, "type": "time" },
    #                    "xAxes": [{ "display": false }],
    #                    "yAxes": [{ "display": false }] },
    #                  "colors": ["1e9ff2"],
    #                  "fill": true,
    #                  "responsive": true
    #     }
    #   }
    #
  end

end
