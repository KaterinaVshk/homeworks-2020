# writes lines from file to array
logs = File.readlines('data_t_02.txt')

REGEX_POST = /(.+)[\s\-]{5,}\[(.+)\] "POST (.+) HTTP/.freeze

# formated line from log, that match REGEX_POST
def formated_log(log)
  log.select { |line| line.match(REGEX_POST) }.map do |line|
    data = line.match(REGEX_POST)[2]
    ip = line.match(REGEX_POST)[1]
    path = line.match(REGEX_POST)[3]
    "#{data} FROM: #{ip} TO: #{path.upcase}"
  end
end

puts formated_log(logs)
