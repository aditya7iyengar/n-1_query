class TimeRecorder
  def initialize
  end

  def benchmark(options={})
    start_time = (Time.now * 1000).to_i
    puts "start time: #{start_time} ms"
    puts "--------------------------------------------------------------"
    puts "--------------------------------------------------------------"
    puts "--------------------------------------------------------------"

    begin
      result = yield
    rescue StandardError => e
      error = e.inspect
      raise e
    ensure

    puts "--------------------------------------------------------------"
    puts "--------------------------------------------------------------"
    puts "--------------------------------------------------------------"

    end_time = (Time.now * 1000).to_i
    puts "end time: #{end_time} ms"

    if error.present?
      puts "error: #{error}"
    end

    total_time = ((end_time - start_time) * 1000).to_i

    puts "Total time: #{total_time} ms"
  end
end
