module DashboardHelper
  def time_to_terminate(event)
    time = event.date_next_event.to_date - Time.now.to_date
    raise time.inspect
  end

  def convert_time(date1, date2)
    raise date1.diff
    # Time.diff(Time.parse('2011-03-06'), Time.parse('2011-03-07')
    
  end
  # def events_for_user
  #   vehicles = current_user.vehicles
  #   @events 
  #   vehicles.each do |v|
  #     @events << v.events
  #   end
    
  #   raise @events.inspect
  # end

  def convert_datediff_to_string(date1, date2)

    napis = ""
    
    if date1 < date2 
      if date1.class == String && date2.class == String
        time = Time.diff(date1,date2)
      else
        time = Time.diff(date1.strftime('%Y-%m-%d'), date2.strftime('%Y-%m-%d'))
      end

      years = time[:year].to_s
      months = time[:month].to_s
      days = time[:day].to_s
    
      if time[:year] > 1
        napis += "ponad " + years + " lata"
      elsif time[:year] == 1
        napis += "ponad rok"  
      elsif time[:month] >= 5
        napis += months + " miesięcy"
      elsif time[:month] > 1 && months < 5
        napis += months + " miesiące"
      elsif time[:month] == 1
        napis += months + " miesiąc"
      elsif time[:day] > 1
        napis += days + " dni"
      elsif time[:day] == 1
        napis += days + " dzień"
      else
        napis += "termin wygasa dzisiaj"
      end    

    else
      napis = "Termin upłynął " + date2.strftime('%Y-%m-%d')
    end
    napis
  end
end
