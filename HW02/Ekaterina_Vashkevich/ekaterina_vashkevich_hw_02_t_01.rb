# writes lines from file to array
logs = File.readlines('data_t_01.txt')

# find lines from log, that contain 'error'
def line_log_error(log)
  log.select { |line| line.include? 'error' }.first
end

puts line_log_error(logs)
