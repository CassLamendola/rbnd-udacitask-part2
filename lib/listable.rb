module Listable
  def format_description(description)
  	description.ljust(30)
  end
  def format_date(options = {})
  	dates = options[:start].strftime("%D") if options[:start]
  	dates << options[:end].strftime("%D") if options[:end]
  	dates = options[:due_date].strftime("%D") if options[:due_date]
  	dates = "N/A" if !dates
  	return dates
  end
  def format_priority(priority)
    # Uses 'colored' gem (from 'command_line_reporter') for coloring instead of 'colorize'
    value = " ⇧".red if priority == "high"
    value = " ⇨".yellow if priority == "medium"
    value = " ⇩".green if priority == "low"
    value = "" if !priority
    return value
  end
end
