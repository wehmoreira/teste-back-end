class TrackerDecorator < SimpleDelegator
  def format_datetime
    datetime.strftime('%d/%m/%Y - %H:%M:%S')
  end
end
