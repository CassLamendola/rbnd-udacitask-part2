module Listable
  def format_description(description)
  	description.ljust(30)
  end
  def format_date(options = {})
  	dates = options[:start].strftime("%D") if options[:start]
  	dates << " to #{options[:end].strftime("%D")}" if options[:end]
  	dates = options[:due_date].strftime("%D") if options[:due_date]
  	dates = options[:date].strftime("%D") if options[:date]
  	dates = "N/A" if !dates
  	return dates
  end
  def format_priority(priority)
    value = " ⇧".red if priority == "high"
    value = " ⇨".yellow if priority == "medium"
    value = " ⇩".green if priority == "low"
    value = "" if !priority
    return value
  end
  def format_time(options = {})
  	times = " at#{options[:start].strftime("%l:%M %P")}" if options[:start]
  	times << " until #{options[:end].strftime("%l:%M %P")}" if options[:end]
  	return times
  end
end
