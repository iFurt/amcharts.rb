require 'collection_of'
require "amcharts/version"
require_relative '../app/helpers/amcharts/amcharts_helper'

module AmCharts
  autoload :Axis,           'amcharts/axis'
  autoload :Chart,          'amcharts/chart'
  autoload :ChartBuilder,   'amcharts/chart_builder'
  autoload :Cursor,         'amcharts/cursor'
  autoload :DataSource,     'amcharts/data_source'
  autoload :ExportSettings, 'amcharts/export_settings'
  autoload :Graph,          'amcharts/graph'
  autoload :Legend,         'amcharts/legend'
  autoload :Listener,       'amcharts/listener'
  autoload :ScrollBar,      'amcharts/scroll_bar'
  autoload :Settings,       'amcharts/settings'
  autoload :UsesSettings,   'amcharts/uses_settings'

  ActiveSupport::Inflector.inflections do |inflect|
    inflect.acronym "AmCharts"
  end if defined?(ActiveSupport)

  Engine = Class.new(::Rails::Engine) do
    # Load the Amcharts helper when loading ActionView
    initializer 'amcharts.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        ::ActionController::Base.helper AmCharts::AmChartsHelper
      end
    end
  end if defined?(Rails)
end
