class TodoItem
  include Listable
  attr_reader :description, :due, :item_type
  attr_accessor :priority

  def initialize(description, options = {})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    @item_type = 'to do'
  end
  def details
    format_description(@description) + "due: " +
    format_date(due_date: @due) +
    format_priority(@priority)
  end
end
