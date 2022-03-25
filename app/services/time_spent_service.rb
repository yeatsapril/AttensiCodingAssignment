class TimeSpentService
  def self.calculate_time_spent!(finished_playing, started_playing)
    time_spent = finished_playing - started_playing
  end

  def self.format_time_spent(time_spent)
    Time.at(time_spent).utc.strftime("%H:%M:%S")
  end
end
