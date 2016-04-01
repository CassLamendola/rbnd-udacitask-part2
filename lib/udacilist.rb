class UdaciList
  attr_reader :title, :items

  include CommandLineReporter

  def initialize(options={})
    options[:title] ? @title = options[:title] : @title = 'Untitled List'
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    if type == "todo"; @items.push TodoItem.new(description, options)
    elsif type == "event"; @items.push EventItem.new(description, options) 
    elsif type == "link"; @items.push LinkItem.new(description, options)
    else; raise UdaciListErrors::InvalidItemType, "'#{type}' is an invalid item type"
    end
    if options[:priority]
      raise UdaciListErrors::InvalidPriorityValue, "'#{options[:priority]}' is not a valid priority" unless valid_priority?(options[:priority])
    end
  end
  def valid_priority?(priority)
    valid = ['high','medium','low']
    valid.include?(priority)
  end
  def delete(index)
    @items.delete_at(index - 1)
    if index > @items.length
      raise UdaciListErrors::IndexExceedsListSize, "There are not #{index} items in '#{@title}'"
    end
  end
  def all
    header(title: @title, align: 'center', bold: true, color: 'blue', rule: true)
    table(border: true) do
      row color: 'blue', header: true do
        column 'Position', width: 10
        column 'Description', width: 25
        column 'Details', width: 30
      end      
      @items.each_with_index do |item, position|
        row do
          column "#{position + 1}) "
          column item.description
          column item.details
        end
      end
    end
#    puts "-" * @title.length
#    puts @title
#    puts "-" * @title.length
#    @items.each_with_index do |item, position|
#      puts "#{position + 1}) #{item.details}"
#    end
  end
end
