# writes lines from file to array
logs = File.readlines('data_t_02.txt')

REGEX_POST = /(.+)[\s\-]{5,}\[(.+)\] "POST (.+) HTTP/.freeze

# formated line from log, that match REGEX_POST
def formated_log(log)
  log.select { |line| line.match(REGEX_POST) }.map do |line|
    "#{line.match(REGEX_POST)[2]} FROM: #{line.match(REGEX_POST)[1]} TO: #{line.match(REGEX_POST)[3].upcase}"
  end
end

puts formated_log(logs)
