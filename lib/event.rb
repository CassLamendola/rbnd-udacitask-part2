class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date, :item_type

  def initialize(description, options = {})
    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
    @item_type = 'event'
  end
  def details
    format_description(@description) + "event dates: " + format_date(start: @start_date, end: @end_date)
  end
end
