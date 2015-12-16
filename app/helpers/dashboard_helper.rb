module DashboardHelper
	def time_to_terminate(event)
		time = event.date_next_event.to_date - Time.now.to_date
		raise time.inspect
	end

	def convert_datediff_to_string(date1, date2)
      if date1.class == String && date2.class == String
        time_diff = Time.diff(date1,date2)
      else
        time_diff = Time.diff(date1.strftime('%Y-%m-%d %H:%M'), date2.strftime('%Y-%m-%d %H:%M'))
      end

      s = ""
      time_diff.each do |t|
        if t[0] != :diff
          s += t[1].to_s + " "
        end
      end

      s[0...-2]
    end

end
