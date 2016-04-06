class AppointmentItem
  include Listable
  attr_reader :description, :date, :start_time, :end_time, :item_type

  def initialize(description, options = {})
	@description = description
	@date = Chronic.parse(options[:date]) if options[:date]
	@start_time = Chronic.parse(options[:start_time]) if options[:start_time]
	@end_time = Chronic.parse(options[:end_time]) if options[:end_time]
	@item_type = 'appointment'
  end
  def details
	format_description(@description) + "appt date: " +
	format_date(date: @date) +
	format_time(start: @start_time, end: @end_time)
  end
end