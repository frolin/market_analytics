# frozen_string_literal: true

class Chartjs::Component < ApplicationViewComponent

  ORDER_COLORS = ['rgba(248, 142, 72, .3)', 'rgba(248, 142, 72, .5)']
  SALE_COLORS = ['rgba(30, 159, 242, .3)', 'rgba(30, 159, 242, .5)']
  COLOR_PALLET = ["rgba(234, 85, 69, 0.7)", "rgba(244, 106, 155, 0.6)", "rgba(239, 155, 32, 0.6)",
                  "rgba(237, 191, 51, 0.6)", "rgba(237, 225, 91, 0.6", "rgba(189, 207, 50, 0.6", "rgba(135, 188, 69, 0.6", "#27aeef", "#b33dc6"]

  COLORS = ['rgba(182, 197, 242, 0.6)', 'rgba(166, 157, 204, 0.6)', 'rgba(133, 158, 233, 0.6)', 'rgba(52, 168, 83, 0.6)',
            'rgba(137, 139, 197, 0.5)', 'rgba(207, 139, 197, 0.5)', 'rgba(234, 67, 53, 0.7)', 'rgba(234,67,53, 0.7)', 'rgba(66,85,165, 0.7)']
  attr_reader :data, :options

  def initialize(data:, **kwargs)
    @data = data
    @dataset = collect_datasets
    @options = collect_options
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

  def collect_options
    options(scales_max)
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
      stack: 'Stack 0',
      **params

      # backgroundColor: @source_colors.to_a[0] || ORDER_COLORS[0],
      # borderColor: @source_colors.to_a[1] || ORDER_COLORS[1],
    }
  end

  def scales_max
    data.each_with_object({}) do |d, hsh|
      next if d[:yAxisID].blank? || d[:yAxisMAX].blank?

      hsh.merge!({ d[:yAxisID].to_sym => { max: d[:yAxisMAX].to_i, postfix: d[:postfix] } })
    end
  end

  def max(axis_value = 0)
    return if axis_value == nil

    axis_value + axis_value / 2
  end

  def options(opts = {})
    {
      responsive: false,
      maintainAspectRatio: false,
      animation: false,
      plugins: {
        title: {
          display: true,
          text: ''
        },
        legend: true,
        datalabels: {
          color: '#36A2EB'
        },
      },
      interaction: {
        intersect: false,
        mode: 'index',
      },
      scales: {
        x: {
          # grid: { display: false }
          type: 'time',
          time: {
            unit: 'day'
          },
          # position: 'left',
          ticks: { beginAtZero: true },
          # stacked: 'single'

        },
        y: {
          title: { text: 'Заказы, шт.', display: true },
          position: 'left',
          display: true,
          ticks: { stepSize: 5, beginAtZero: true, },
          grid: { display: false },
          max: max(opts.dig(:y, :max)),
        },
        y1: {
          # display: false ,
          position: 'right',
          display: false,

          ticks: { stepSize: 5, beginAtZero: true, },
          grid: { display: false },
          max: 100,
        },
        y2: {
          position: 'left',
          display: false,

          # type: 'linear',
          ticks: { stepSize: 5, beginAtZero: true, },
          grid: { display: false },
          max: max(opts.dig(:y2, :max)),
        },
        y3: {
          title: { text: 'Продажи, Р.', display: true },

          position: 'right',
          type: 'linear',
          ticks: { stepSize: 2500, beginAtZero: true, },
          grid: { display: true },
          max: max(opts.dig(:y3, :max)),
        },
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
