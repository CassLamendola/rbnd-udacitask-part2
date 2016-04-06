class UdaciList
  attr_reader :title, :items

  # include CommandLineReporter


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
  def print_table
    table = Terminal::Table.new title:@title do |t|
      @items.each_with_index do |item, position|
        t << [position + 1, item.details]
      end
    end
    puts table
  end
  def all
    print_table
#    puts "-" * @title.length
#    puts @title
#    puts "-" * @title.length
#    @items.each_with_index do |item, position|
#      puts "#{position + 1}) #{item.details}"
#    end
  end
end
